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
		<title>결제 완료</title>
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
		<div align="center"><h1>&lt;결제 완료&gt;</h1></div>
		<div align="center"><h1>영수증이 출력됩니다.</h1></div>
		<div align="center"><img src="../image/receipt.png" style="width:400px; height:300px;"></div>
		<div align="center"><h2>결제가 완료되었습니다.<br><br>이용해주셔서 감사합니다.</h2></div>
		<div class="popup_close" align="center"><h3>결제 화면은 <span id="countdown" style="color:red">10</span>초 후에 자동으로 닫힙니다.</h3></div>
<script>
// 카운트다운 시작
var timeleft = 10;
var countdownTimer = setInterval(function(){
    document.getElementById('countdown').innerHTML = timeleft;
    timeleft -= 1;
    if(timeleft < 0){
        clearInterval(countdownTimer);
        window.close(); // 5초 후에 팝업 창이 닫히도록 설정
        window.opener.location.href="../main.jsp";
    }
}, 1000); // 1초마다 갱신
</script>
	</body>
</html>