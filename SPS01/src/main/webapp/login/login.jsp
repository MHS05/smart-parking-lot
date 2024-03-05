<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>스마트 주차장 관리 시스템</title>
	<script src="../js/jquery-3.7.1.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/background.css">
<style>
table
{
	width:600px;
	height:600px;
	background-color:white;
	opacity:0.9;
	margin-top:150px;
	border-radius:15px;
}
td
{
	text-align:center;
}
.login_btn
{
	width:150px;
	height:80px;
	font-size:1.2em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
}
.btn
{
	width:150px;
	height:80px;
	font-size:1.2em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
}
#id 
{	
	height:60px;
	width:380px;
	font-size:1.2em;
}
#pw
{	
	height:60px;
	width:380px;
	font-size:1.2em;
}
</style>
</head>
	<body>
	<form id="loginform" name="loginform" method="get" action="loginok.jsp">
		<table border="0" align="center">
			<tr>
				<td colspan="2" height="80px"><h1>스마트 주차장 관리 시스템</h1></td>
			</tr>
			<tr>
				<td colspan="2" height="50px"><h2>관리자 모드</h2></td>
			</tr>
			<tr>
				<td colspan="2" height="100px"><img src="../image/key.jpg" style="width:70px; height:70px"></td>
			</tr>
			<tr>
				<td width="120px" height="100px"><h1>ID&nbsp; :</h1></td>
				<td><input type="text" placeholder="아이디를 입력해주세요" id="id" name="id" maxlength="12"></td>
			</tr>
			<tr>
				<td width="120px" height="100px"><h1>PW :</h1></td>
				<td><input type="password" placeholder="비밀번호를 입력해주세요" id="pw" name="pw" maxlength="12"></td>
			</tr>
			<tr height="25px">
				<td colspan="2">
				<div id="msg" style="color:#ff6600"></div>
				</td>	
			</tr>
			<tr>
				<td colspan="2" height="100px">
					<a href="javascript:DoLogin();"><input type="button" value="로그인" class="login_btn"></a>&emsp;&emsp;
					<a href="../camera.jsp"><input type="button" value="취소" class="btn"></a>
				</td>
			</tr>
		</table>
	</form>
	</body>
<script>
window.onload = function()
{
	$("#id").focus();
	
	$("#id,#pw").keyup(function (event)
	{
		if (event.keyCode == 13) 
		{
			DoLogin();
		}	
	});
}
function DoLogin()
{	
	if( $("#id").val() == "")
	{
		//alert("아이디를 입력하세요.");
		$("#msg").html("아이디를 입력하세요.");
		$("#id").focus();
		return;
	}
	if( $("#pw").val() == "")
	{
		//alert("비밀번호를 입력하세요.");
		$("#msg").html("비밀번호를 입력하세요.");
		$("#pw").focus();
		return;
	}		
	  	$("#loginform").submit();
}
</script>
</html>