<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<title>���� �Ϸ�</title>
<style>
.ok_btn
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
.popup_close
{
	font-size:1.3em;
	background-color:#fff2a5;
	margin-top:50px;
}
</style>
	</head>
	<body>
		<div align="center"><h1>&lt;���� �Ϸ�&gt;</h1></div>
		<div align="center"><h1>�������� ��µ˴ϴ�.</h1></div>
		<div align="center"><img src="../image/receipt.png" style="width:400px; height:300px;"></div>
		<div align="center"><h2>������ �Ϸ�Ǿ����ϴ�.<br><br>�̿����ּż� �����մϴ�.</h2></div>
		<div class="popup_close" align="center"><h3>���� ȭ���� <span id="countdown" style="color:red">10</span>�� �Ŀ� �ڵ����� �����ϴ�.</h3></div>
<script>
// ī��Ʈ�ٿ� ����
var timeleft = 10;
var countdownTimer = setInterval(function(){
    document.getElementById('countdown').innerHTML = timeleft;
    timeleft -= 1;
    if(timeleft < 0){
        clearInterval(countdownTimer);
        window.close(); // 5�� �Ŀ� �˾� â�� �������� ����
        window.opener.location.href="../main.jsp";
    }
}, 1000); // 1�ʸ��� ����
</script>
	</body>
</html>