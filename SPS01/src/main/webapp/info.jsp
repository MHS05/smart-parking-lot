<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();

cmno = dto.SearchCar(cmno);


CarinfoVO vo  = dto.Read(cmno);

//주차시간
int now_enter=0;
int exit_enter=0;
try{
	now_enter = Integer.parseInt(dto.Now_Enter(cmno));
	exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
}catch(Exception e){
	
}
%>
<style>
.td5
{
	text-align:center;
	height:60px;
	font-weight:bold;
	font-size:20;
}
th
{	
	font-size:20;
	height:50px;
	background-color:#3498db;
}
.carnumber
{	
	margin-left:50px;
	margin-top:10px;
	color:red;
	font-size: 36;
}
</style>
<div style="height:600px; overflow: scroll;">
	<table border="1" width="1000px" align="center" style="border-collapse: collapse; overflow: scroll;">
		<div class="carnumber"><b>차량번호 : <%= vo.getCarnum() %></b></div>
		<div align="center"><h1>통합정보</h1></div>
		<tr style="background-color:#eaeaea;">
			<th>입차시간</th>
			<th>출차시간</th>
			<th>주차요금</th>
			<th>결제요금</th>
			<th>결제수단</th>
			<th>구분</th>
		</tr>
		<tr>
			<td class="td5"><%= vo.getEntertime() %></td>
			<td class="td5"><%= vo.getExittime()  %></td>
			<%
			//출차 X 안했을때 요금
			if( vo.getEntertime().equals(vo.getExittime()) )
			{ 	//주차시간 10분 미만일 경우
				if(now_enter < 10)
				{
				%>
					<td class="td5">주차요금 : 0원(회차)</td>
					<td class="td5">결제요금 : 0원</td>
				<%
				}
				//주차시간 30분 미만일 경우
				else if(now_enter < 30)	
				{
				%>
					<td class="td5">주차요금 : 600원</td>
					<td class="td5">결제요금 :    원</td>
				<%
				}
				//주차시간 30분 이상일 경우
				else 
				{
					%>
					<td class="td5">주차요금 : <%= vo.getPayamount() %>원</td>
					<td class="td5">결제요금 : <%= vo.getPayamount() %>원</td>
				<%
				}
			}
			//출차 O 했을때 요금
			if( !vo.getEntertime().equals(vo.getExittime()) )
			{ 	//주차시간 10분 미만일 경우
				if(exit_enter < 10)
				{
				%>
					<td class="td5">주차요금 : 0원(회차)</td>
					<td class="td5">결제요금 : 0원</td>
				<%
				}
				//주차시간 10분 이상 30분 미만일 경우
				else if(10 <= exit_enter && exit_enter < 30)
				{
				%>
					<td class="td5">주차요금 : 600원</td>
					<td class="td5">결제요금 : 600원</td>
				<%
				}
				//주차시간 30분 이상일 경우
				else
				{
				%>
					<td class="td5">주차요금 : <%= vo.getPayamount() %>원</td>
					<td class="td5">결제요금 : <%= vo.getPayamount() %>원</td>
				<%
				}
			} 
			%>
			<td class="td5"><%= vo.getPaymethod() %></td>
			<td class="td5"><%= vo.getPayclassifi() %></td>
		</tr>
	</table>	
</div>	