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
.pay_btn
{
	width:150px;
	height:100px;
	font-size:1.5em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
}
</style>
</head>
	<body>
		<table class="fee_table" border="0">
			<tr>
				<td colspan="3" height="200px"><h1>결제수단을 선택해주세요</h1></td>
			</tr>
			<tr>
				<td>
					<a href="javascript:openCash();">
					<img src="../image/cash.png" style="width:300px; height:250px"><br><br>
					<input type="button" value="현금 결제" class="pay_btn"></a>
				</td>
				<td width="10px"></td>
				<td>
					<a href="javascript:openCard();">
					<img src="../image/card.png" style="width:300px; height:250px"><br>
					<input type="button" value="카드 결제" class="pay_btn"></a>
				</td>
			</tr>
			<tr>
				<td colspan="3" height="100px"></td>
			</tr>
		</table>
	</body>
<script>
function openCash() 
{	
	var _width = '700';
	var _height = '740';
		
	var _left = Math.ceil((window.screen.width - _width )/2);
	var _top = '400';
	
	window.open('pay_cash.jsp?cmno=<%= cmno %>', '', 'width=700, height=740, left=' + _left +', top=' + (_top - 250)); return false;
}

function openCard() 
{	
	var _width = '700';
	var _height = '740';
		
	var _left = Math.ceil((window.screen.width - _width )/2);
	var _top = '400';
	
	window.open('pay_card.jsp?cmno=<%= cmno %>', '', 'width=700, height=740, left=' + _left +', top=' + (_top - 250)); return false;
}
</script>
</html>