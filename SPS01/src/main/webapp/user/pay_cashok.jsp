<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);

int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));

//결제방법
String paymethod = request.getParameter("paymethod");
vo.setPaymethod(paymethod);
dto.UpdatePaymethod(cmno, vo);

//결제요금
dto.UpdatePayamount(cmno, vo);

int payamountInt = Integer.parseInt(vo.getPayamount());

//주차금액에 따른 지불 금액 
int insert_money = 0;

if(payamountInt == 0){
	insert_money = 0;
}else if(payamountInt > 0 && payamountInt <= 1000){
	insert_money += 1000;
}else if(payamountInt > 1000 && payamountInt <= 5000){
	insert_money += 5000;
}else if(payamountInt > 5000 && payamountInt <= 10000){
	insert_money += 10000;
}

//거스름 돈
int change = insert_money - payamountInt;
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
		<div align="center"><h2>거스름 돈이 반환되고 있습니다.<br>잠시만 기다려 주세요.</h2></div>
		<div align="center"><img src="../image/cashback.png" style="width:400px; height:200px;"></div>
		<div align="center"><hr style="width:300px"></div><br>
		<div align="center"><h2>결제금액 : <%= payamountInt %>원<br><br>투입한 금액 : <%= insert_money %>원<br><br>거스름 돈 : <%= change %>원</h2></div>
		<div class="popup_close" align="center"><h3>결제 화면은 <span id="countdown" style="color:red">10</span>초 후에 자동으로 닫힙니다.</h3></div>
<script>
// 카운트다운 시작
var timeleft = 10; 
var countdownTimer = setInterval(function(){
    document.getElementById('countdown').innerHTML = timeleft;
    timeleft -= 1;
    if(timeleft < 0){
        clearInterval(countdownTimer);
    	window.close(); // 10초 후에 팝업 창이 닫히도록 설정
    	window.opener.location.href="parkingfee02.jsp?cmno=<%=cmno%>";
    }
}, 1000); // 1초마다 갱신
</script>
	</body>
</html>