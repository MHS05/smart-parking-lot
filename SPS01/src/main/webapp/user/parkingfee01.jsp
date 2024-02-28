<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
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
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>스마트 주차장 관리 시스템</title>
		<link rel="stylesheet" type="text/css" href="../css/sps.css">
		<link rel="stylesheet" type="text/css" href="../css/background.css">
<style>
.fee_table
{
	width:1000px;
	height:800px;
	background-color:white;
	opacity:0.9;
	border-radius:15px;
	margin: 0 auto;
	margin-top:30px;
	text-align:center;
}
.fee_table01
{
	width:400px;
	height:350px;
	border-collapse:collapse;
	margin: 0 auto;
}
.pay_btn
{
	width:150px;
	height:80px;
	font-size:1.3em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
}
.marquee
{	
	height:50px;
	font-size:1.4em;
	font-weight:bold;
}
</style>
	</head>
	<body>
		<table class="fee_table" border="0">
			<tr>
				<td colspan="3"><h1>무인 정산기</h1></td>
			</tr>
			<tr>
				<td class="marquee" colspan="3"><MARQUEE><%= vo.getCarnum() %> 고객님 저희 주차장을 이용해주셔서 감사합니다.</MARQUEE></td>
			</tr>
			<tr>
				<td>
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
								<span id="span2"><font size="4"><b>차량정보</b></font></span>
								<a href="javascript:openinfo();"><font size="6" color="#2ecc71"><b><%= vo.getCarnum() %></b></font></a>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left">&emsp;<font size="4">출차시간 :<%= vo.getExittime() %> <br><br>&emsp;입차시간 :<%= vo.getEntertime() %> </font><br><br>
							 <% 
								int time = Integer.parseInt(dto.timeDiff(cmno));
								if(time < 60)
								{
									%><font size="6">&emsp;&emsp;00일 00시간 <%= dto.timeDiff(cmno) %>분</font><%
								} else
								{
									int hour = time / 60;
									int min  = time - (hour * 60);
									%><font size="6">&emsp;&emsp;00일 <%= hour %>시간 <%= min %>분</font><%
								}
							%>
							</td>
						</tr>
					</table>
				</td>
				<td width="50px"></td>
				<td>
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
								<span id="span2"><font size="4"><b>주차요금</b></font></span>
								<%
									if(time < 30)
									{
										%><font size="6" color="#2ecc71"><b>600원</b></font><%
									} else
									{
									 	int timecal = time / 30;
										timecal = timecal * 600;
										%><font size="6" color="#2ecc71"><b><%= timecal %>원</b></font><%
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left">&emsp;<font size="4">주차요금 :<%= vo.getPayamount() %> <br><br><br>&emsp;결제요금 : <%= vo.getPayamount() %></font></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="parkingfee02.jsp?cmno=<%= cmno %>"><input type="button" value="결제하기" class="pay_btn"></a>
				</td>
			</tr>
		</table>
	</body>
</html>