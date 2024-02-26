<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>카드 결제</title>
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
	margin-top:10px;
}
</style>
	</head>
	<body>
		<div align="center"><h1>&lt;카드 결제&gt;</h1></div>
		<div align="center"><h1>카드를 투입구 끝까지 넣어주세요.</h1></div>
		<div align="center"><img src="../image/cardinsert.png" style="width:400px; height:500px;"></div>
		<div align="center"><a href="pay_cardok.jsp"><input type="button" value="다음" class="next_btn"></a></div>
	</body>
</html>