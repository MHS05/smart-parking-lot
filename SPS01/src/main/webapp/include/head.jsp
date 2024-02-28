<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
.btn
{
	width:150px;
	height:45px;
	font-size:1.2em;
	font-weight:bold;
	background-color:skyblue;
	border-radius: 15px;
	border: none;
	cursor:pointer;
}
.btn_logout
{
	width:120px;
	height:30px;
	font-size:1.1em;
	font-weight:bold;
	border-radius: 15px;
	margin-right: 10px;
}
#datepicker
{
	width:160px;
	height:80px;
	font-size:30;
	font-weight:bold;
	border:none;
	background:transparent;
	cursor:pointer;
}
#searchinput 
{
    display: none;
}
#key
{
	width:170px;
	height: 30px;
	font-size:1.1em;
}
a
{
	text-decoration-line: none;
	color : black;
}
</style>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>스마트 주차장 관리 시스템</title>
	<link rel="stylesheet" href="css/jquery-ui.css">
	<script src="js/jquery-3.7.1.js"></script>
	<script src="js/jquery-ui.js"></script>
<script>
window.onload = function()
{
	$("#key").keyup(function (event)
		{	
			if (event.keyCode == 13)
			{
				doSearch();
			}
			
		});
}
$(function() {
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeYear: true,
        changeMonth: true,
        showOn: "both",
        buttonImageOnly: true,
        buttonText: "",
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        minDate: "-5Y",
        maxDate: "+today"               
    });    
    
    // 초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today');
});
function carSearch() {
    var searchinput = document.getElementById('searchinput');
    if (searchinput.style.display == 'none') {
        searchinput.style.display = 'block';
    } else {
        searchinput.style.display = 'none';
    }
}
function doSearch() 
{
}
function EnterList()
{
	$.ajax({
		type : "get",
		url: "table03.jsp,
		dataType: "html",
		success : function(data) 
		{	
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$("#table03").html(data);
		},
		complete : function(data) 
		{	
			// 통신이 성공하거나 실패했어도 이 함수를 타게된다.
		},
		error : function(xhr, status, error) 
		{
			// 통신 오류 발생시	
		}
	});			
}
</script>
</head>
	<body>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:#e0e0e0">
			<tr>
				<td width="80px" height="65px">
					<a href="main.jsp"><img style="width:80px; height:60px;" src="image/logo.png"></a>
				</td>
				<td width="400px" style="text-align:left"><font size="5"><b><a href="main.jsp">스마트 주차장 관리 시스템</a></b></font></td>
				<td width="200px"></td>
				<td colspan="6" align="right" style="text-align:right"><button class=btn_logout>로그아웃</button></td>
			</tr>
		</table>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:3498db">
			<tr>
				<td align="center"><img src="image/calender.png" style="width:60px; height:60px"></td>
				<td><input type="text" id="datepicker"></td>
				<td width="200px"></td>
				<td align="center"><button class=btn onclick="location.href='camera.jsp'">입출차 카메라</button></td>
				<td align="center"><a href="javascript:EnterList();">입차 현황</a></td>
				<!-- <td align="center"><div class=btn onclick="EnterList();">입차 현황</div></td> -->
				<!-- <td align="center"><button class=btn onclick="EnterList();">입차 현황</button></td> -->
				<td align="center"><button class=btn>출차 현황</button></td>
				<td align="center"><button class=btn>결제 내역</button></td>
				<td align="center"><button class=btn>주차장 맵</button></td>
				<td align="center"><button class="btn" id="carsearch" onclick="carSearch();">차량 검색</button>
				<div id="searchinput" align="right" style="position:absolute; margin-top:20px;">
		        	<input type="text" id="key" name="key" value="" placeholder="차량 번호 입력">
			        <button onclick="doSearch();">검색</button>
	     		</div>
			</tr>
		</table>
