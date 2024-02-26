<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<div align="center"><h2>거스름 돈이 반환되고 있습니다.<br>잠시만 기다려 주세요.</h2></div>
		<div align="center"><img src="../image/cashback.png" style="width:400px; height:200px;"></div>
		<div align="center"><hr style="width:300px"></div><br>
		<div align="center"><h2>결제금액 : 14,000원<br><br>투입한 금액 : 20,000원<br><br>거스름 돈 : 6,000원</h2></div>
		<div class="popup_close" align="center"><h3>결제 화면은 <span id="countdown">10</span>초 후에 자동으로 닫힙니다.</h3></div>
<script>
// 카운트다운 시작
var timeleft = 10;
var countdownTimer = setInterval(function(){
    document.getElementById('countdown').innerHTML = timeleft;
    timeleft -= 1;
    if(timeleft < 0){
        clearInterval(countdownTimer);
        window.close(); // 5초 후에 팝업 창이 닫히도록 설정
    }
}, 1000); // 1초마다 갱신
</script>
	</body>
</html>