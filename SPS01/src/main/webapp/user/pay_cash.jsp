<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
String cmno = request.getParameter("cmno");
if( cmno == null || cmno.equals("") )
{
	response.sendRedirect("main.jsp");
	return;
}

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);
if( vo == null )
{
	response.sendRedirect("main.jsp");
	return;	
}

int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
int timecal = exit_enter / 30;
int payamount = timecal * 600;

//숫자 세자리 수 마다 ,
DecimalFormat formatter = new DecimalFormat("#,###");
String comma = formatter.format(timecal);

//주차금액에 따른 지불 금액 
int insert_money = 0;

if(payamount == 0){
	insert_money = 0;
}else if(payamount > 0 && payamount <= 1000){
	insert_money += 1000;
}else if(payamount > 1000 && payamount <= 5000){
	insert_money += 5000;
}else if(payamount > 5000 && payamount <= 10000){
	insert_money += 10000;
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>현금 결제</title>
<style>
.next_btn
{
	width:150px;
	height:50px;
	font-size:1.3em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
	margin-top:20px;
}
</style>
	</head>
	<body>
		<div align="center"><h1>&lt;현금 결제&gt;</h1></div>
		<div align="center"><h1>정산하실 금액을 넣어주세요</h1></div>
		<div align="center"><img src="../image/cashinsert.png" style="width:400px; height:300px;"></div>
		<div align="center"><hr style="width:300px"></div><br>
		<%
		//출차 했을때 요금
		if(!vo.getEntertime().equals(vo.getExittime()))
		{ 	//주차시간 10분 미만일 경우
			if(exit_enter < 10)
			{
			%>
				<div align="center"><h2>주차 요금 : 0원<br><br>투입한 금액 : 0원</h2></div>
			<%
			}
			//주차시간 10분 이상 30분 미만일 경우
			else if(10 <= exit_enter && exit_enter < 30)
			{
			%>
				<div align="center"><h2>주차 요금 : 600원<br><br>투입한 금액 : <%= insert_money %>원</h2></div>
			<%
			}
			//주차시간 30분 이상일 경우
			else
			{
			%>
				<div align="center"><h2>주차 요금 : <%= payamount %>원<br><br>투입한 금액 : <%= insert_money %>원</h2></div>
			<%
			}
		} 
		%>
		<div align="center"><a href="pay_cashok.jsp?cmno=<%=cmno%>"><input type="button" value="다음" class="next_btn"></a></div>
	</body>
</html>