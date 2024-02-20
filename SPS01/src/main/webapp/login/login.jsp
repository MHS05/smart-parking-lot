<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>����Ʈ ������ ���� �ý���</title>
	<script src="../js/jquery-3.7.1.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/background.css">
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
		//alert("���̵� �Է��ϼ���.");
		$("#msg").html("���̵� �Է��ϼ���.");
		$("#id").focus();
		return;
	}
	if( $("#pw").val() == "")
	{
		//alert("��й�ȣ�� �Է��ϼ���.");
		$("#msg").html("��й�ȣ�� �Է��ϼ���.");
		$("#pw").focus();
		return;
	}		
	  	$("#loginform").submit();
}
</script>
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
.btn
{
	width:150px;
	height:80px;
	font-size:1.2em
}
#id, #pw
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
				<td colspan="2" height="80px"><h1>����Ʈ ������ ���� �ý���</h1></td>
			</tr>
			<tr>
				<td colspan="2" height="50px"><h2>������ ���</h2></td>
			</tr>
			<tr>
				<td colspan="2" height="100px"><img src="../image/key.jpg" style="width:70px; height:70px"></td>
			</tr>
			<tr>
				<td width="120px" height="100px"><h1>ID :</h1></td>
				<td><input type="text" placeholder="���̵� �Է����ּ���" id="id" name="id" maxlength="12"></td>
			</tr>
			<tr>
				<td width="120px" height="100px"><h1>PW :</h1></td>
				<td><input type="text" placeholder="��й�ȣ�� �Է����ּ���" id="pw" name="pw" maxlength="12"></td>
			</tr>
			<tr height="25px">
				<td colspan="2">
				<div id="msg" style="color:#ff6600"></div>
				</td>	
			</tr>
			<tr>
				<td colspan="2" height="100px">
					<a href="javascript:DoLogin();"><input type="button" value="�α���" class="btn"></a>&emsp;&emsp;
					<input type="button" value="���" class="btn" onclick="window.close()">
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>