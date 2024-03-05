<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo   = dto.Read(cmno);

//결제요금
dto.UpdateTimecal(vo);

dto.UpdatePayamount(vo);

//결제방법
String paymethod = request.getParameter("paymethod");
vo.setPaymethod(paymethod);
dto.UpdatePaymethod(cmno, vo);

int payamountInt = 0;
try
{
	payamountInt = Integer.parseInt(vo.getPayamount());
} catch(Exception e){}


//출차시간 - 입차시간 = 주차시간
int exit_enter = 0;
try
{
exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
} catch(Exception e){}
int hour = exit_enter / 60;
int min  = exit_enter - (hour * 60);
int day  = hour / 24;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>스마트 주차장 관리 시스템</title>
		<link rel="stylesheet" type="text/css" href="../css/sps.css">
		<link rel="stylesheet" type="text/css" href="../css/background.css">
	</head>
<style>
#call
{	
	margin-left:900px;
}
</style>
	<body>
		<table class="fee_table" border="0">
			<tr height="20px"></tr>
			<tr>
				<td colspan="3" height="100px">
					<font size="7"><b>무인 정산기</b></font>
					<a href="tel:010-1234-5678">
					<img id="call" src="../image/call.png" title="관리자 문의하기" style="width:100px; height:100px" onclick="document.location.href='tel:010-1234-5678'">
					</a>
				</td>
			<tr>
				<td class="marquee" colspan="3">
					<MARQUEE><%= vo.getCarnum() %> 고객님, 저희 주차장을 이용해주셔서 감사합니다. 안녕히 가십시오.</MARQUEE>
				</td>
			</tr>
			<tr>
				<td height="400px">
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
								<span id="span2"><font size="4"><b>차량정보</b></font></span>
								<font size="6" color="#2ecc71"><b><%= vo.getCarnum() %></b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">입차시간 : <%= vo.getEntertime() %><br><br>
							출차시간 : <%= vo.getExittime() %></font><br><br>
							<% 
							//출차 O 했을 경우 '출차시간 - 입차시간 = 주차시간'
								
							if( !vo.getEntertime().equals(vo.getExittime()) )
							{	//60분 미만일 경우 분만 표현 
								if(exit_enter < 60)
								{
								%>
									<font size="6">0일 0시간 <%= dto.Exit_Enter(cmno) %>분</font>
								<%
								}
								//60분 이상일 경우 날짜, 시간, 분 표현
								else
								{
								%>
									<font size="6"><%= day %>일 <%= hour %>시간 <%= min %>분</font>
								<%
								}
							}
							%>
							</td>
						</tr>
					</table>
				</td>
				<td width="10px"></td>
				<td>
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
							<span id="span2"><font size="4"><b>주차요금</b></font></span>
							<%
							//출차 O 했을때 요금
							if(!vo.getEntertime().equals(vo.getExittime()))
							{ 	//주차시간 10분 미만일 경우
								if(exit_enter < 10)
								{
								%>
									<font size="6" color="#2ecc71"><b>0원(회차)</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">주차요금 : 0원<br><br>결제요금 : 0원</font></td>
								</tr>
								<%
								}
								//주차시간 10분 이상 30분 미만일 경우
								else if(10 <= exit_enter && exit_enter < 30)
								{
								%>
									<font size="6" color="#2ecc71"><b>600원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">주차요금 : 600원<br><br>결제요금 : 600원</font></td>
								</tr>
								<%
								}
								//주차시간 30분 이상일 경우
								else
								{
								%>
									<font size="6" color="#2ecc71"><b><%= payamountInt %>원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">주차요금 : <%= payamountInt %>원<br><br>결제요금 : <%= payamountInt %>원</font></td>
								</tr>
								<%
								}
							} 
							%>
							<% 
							//출차 X 안했을때 요금
							int now_enter = Integer.parseInt(dto.Now_Enter(cmno));
							
							if( vo.getEntertime().equals(vo.getExittime()) )
							{ 	//주차시간 10분 미만일 경우
								if(now_enter < 10)
								{
								%>
									<font size="6" color="#2ecc71"><b>0원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">주차요금 : 0원<br><br>결제요금 : </font></td>
								</tr>
								<%
								}
								//주차시간 30분 미만일 경우
								else if(now_enter < 30)	
								{
								%>
									<font size="6" color="#2ecc71"><b>600원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">주차요금 : 600원<br><br>결제요금 : </font></td>
								</tr>
								<%
								}
								//주차시간 30분 이상일 경우
								else 
								{
									%>
									<font size="6" color="#2ecc71"><b><%= payamountInt %>원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">주차요금 : <%= payamountInt %>원<br><br>결제요금 : </font></td>
								</tr>
								<%
								}
							}
							%>
					</table>
				</td>
			</tr>
			<tr>
			<% 
			//주차시간 10분 이상일 경우에만 결제하기 버튼 표시
			if(exit_enter > 10)
			{ 
			%>
				<td colspan="3">
					<a href="parkingfee02.jsp?cmno=<%= cmno %>"><input type="button" value="결제하기" class="pay_btn"></a>
				</td>
			<%
			}
			%>
			</tr>
		</table>
	</body>
</html>