<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
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
</style>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>스마트 주차장 관리 시스템</title>
	<link rel="stylesheet" type="text/css" href="css/sps.css">
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

function EnterList()
{
	$.ajax({
		type : "get",
		url: "table03.jsp",
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
		<table border="1" width="1500px" height="75px" align="center" style="background-color:#e0e0e0">
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
				<td align="center"><a href="javascript:EnterList();"><button class=btn>입차 현황</button></a></td>
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
		<table border="1" width="1000px" height="700px" align="center">
			<tr>
				<td width="500px" align="center" id="table03">
					<table class="table01" border="1" width="500px" height="700px">
						<tr>
							<th colspan="4">출차</th>
						</tr>
						<tr>
							<td class="td1">일반</td>
							<td class="td1">회차</td>
							<td class="td1">사전정산</td>
							<td class="td1">합계</td>
						</tr>
						<tr>
							<td height="30px">10</td>
							<td>10</td>
							<td>5</td>
							<td>25</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
						<tr>
							<th colspan="4">결제내역</th>
						</tr>
						<tr>
							<td class="td1">현금</td>
							<td class="td1">건수</td>
							<td class="td1" colspan="2">금액</td>
						</tr>
						<tr>
							<td height="30px">현금</td>
							<td>9</td>
							<td colspan="2">1,150,000 원</td>
						</tr>
						<tr>
							<td height="30px">카드</td>
							<td>15</td>
							<td colspan="2">2,800,000 원</td>
						</tr>
						<tr>
							<td height="30px">합계</td>
							<td>24</td>
							<td colspan="2">3,950,000 원</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
						<tr>
							<th colspan="4">입출차 리스트</th>
						</tr>
			
						<tr>
							<td class="td1">차량번호</td>
							<td class="td1">시각</td>
							<td class="td1" colspan="2">차량구분</td>
						</tr>
						<tr>
							<td height="30px">61아 1234</td>
							<td>2019-01-01 00:00</td>
							<td colspan="2">입차</td>
						</tr>
						<tr>
							<td height="30px">61아 1234</td>
							<td>2019-01-01 00:00</td>
							<td colspan="2">출차</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table02" border="0" align="right">
						<tr>
							<td height="40px">현재 주차 중인 차량 수</td>
							<td width="20px"></td>
							<td height="40px">주차 가능한 자리 수</td>
						</tr>
						<tr>
							<td height="80px" style="background-color:#e0e0e0">10대</td>
							<td></td>
							<td height="80px" style="background-color:#e0e0e0">20자리</td>
						</tr>
						<tr>
							<td height="10px"></td>
						</tr>
						<tr>
							<td colspan="3" height="250px" style="background-color:#e0e0e0">주차장 맵</td>
						</tr>
						<tr>
							<td colspan="3"><hr></td>
						</tr>
						<tr>
							<td colspan="3" height="250px" style="background-color:#e0e0e0">주차장 CCTV</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>