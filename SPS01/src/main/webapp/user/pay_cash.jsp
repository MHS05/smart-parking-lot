<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<div align="center"><h2>주차 요금 : 14,000원<br><br>투입한 금액 : 20,000원</h2></div>
		<div align="center"><a href="pay_cashok.jsp"><input type="button" value="다음" class="next_btn"></a></div>
	</body>
</html>