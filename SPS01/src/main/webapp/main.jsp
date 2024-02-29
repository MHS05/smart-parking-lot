<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%
/*
CarinfoVO vo = new CarinfoVO();
vo.setEntertime(vo.getEntertime());
String date = vo.EntertimeAsDate();
*/

String date = "2024-02-28";

ListDTO dto = new ListDTO();

ArrayList<CarinfoVO> list = new ArrayList<CarinfoVO>();

list = dto.getCarInfoList("2024-02-28");

%>
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
</head>
	<body>
		<!-- 헤더 영역 시작 -->
		<table border="0" width="1500px" height="75px" align="center" style="background-color:#e0e0e0">
			<tr>
				<td width="80px" height="65px">
					<a href="main.jsp"><img style="width:80px; height:60px;" src="image/logo.png"></a>
				</td>
				<td width="400px" style="text-align:left"><font size="5"><b><a href="main.jsp">스마트 주차장 관리 시스템</a></b></font></td>
				<td width="200px"></td>
				<td colspan="6" align="right" style="text-align:right">
				<button class=btn_logout onclick="document.location.href='./login/login.jsp'">로그아웃</button></td>
			</tr>
		</table>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:3498db">
			<tr>
				<td align="center"><img src="image/calender.png" style="width:60px; height:60px"></td>
				<td><input type="text" id="datepicker"></td>
				<td width="200px"></td>
				<td align="center"><a href="camera.jsp"><button class=btn>입출차 카메라</button></a></td>
				<td align="center"><a href="javascript:EnterList();"><button class=btn>입차 현황</button></a></td>
				<td align="center"><a href="javascript:ExitList();"><button class=btn>출차 현황</button></a></td>
				<td align="center"><a href="javascript:PayList();"><button class=btn>결제 내역</button></a></td>
				<td align="center"><a href="javascript:ParkingMap();"><button class=btn>주차장 맵</button></a></td>
				<td align="center"><button class="btn" id="carsearch" onclick="carSearch();">차량 검색</button>
				<div id="searchinput" align="right" style="position:absolute; margin-top:20px;">
		        	<input type="text" id="carnumber" name="carnumber" value="" placeholder="차량 번호 입력">
			        <button onclick="SearchCar()"><font size="3">검색</font></button></a>
	     		</div>
			</tr>
		</table>
		<!-- 헤더 영역 끝 -->
		<table border="0" align="center" style="width:1400px; height:600px;">
			<tr>
				<td width="550px" height="700px;" align="center" id="leftside">
					<table class="table01" border="1">
						<tr>
							<th class="th1" colspan="3">출차</th>
						</tr>
						<tr>
							<td class="td1">일반</td>
							<td class="td1">회차</td>
							<td class="td1">합계</td>
						</tr>
						<tr>
							<td height="30px">10</td>
							<td>10</td>
							<td>25</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
						<tr>
							<th class="th1" colspan="4">결제내역</th>
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
					</table>
					<div style="height:220px; overflow: scroll;">
						<table class="table01_1" border="1">
							<tr>
								<th class="th1_1" colspan="4">입출차 리스트</th>
							</tr>
				
							<tr>
								<td class="td1_1" width="70px">차량번호</td>
								<td class="td1_1" width="300px">시각</td>
								<td class="td1_1" width="70px" colspan="2">차량구분</td>
							</tr>
							<tr>
								<td height="40px">입차시간</td>
								<td>입차시간</td>
								<td colspan="2">입차</td>
							</tr>
							<tr>
								<td height="40px">차번호</td>
								<td>출차시간</td>
								<td colspan="2">출차</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="800px" align="center" id="rightside">
					<table border="0" align="center" width=800px;>
						<tr>
							<td width="100px" height="30px"><font size="4"><b>총 주차 자리 수</b></font></td>
							<td width="20px"></td>
							<td width="100px" height="30px"><font size="4"><b>현재 주차 중인 차량 수</b></font></td>
							<td width="20px"></td>
							<td width="100px" height="30px"><font size="4"><b>주차 가능한 자리 수</b></font></td>
						</tr>
						<tr>
							<td height="80px" style="background-color:#e0e0e0"><font size="5"><b>30대</b></font></td>
							<td></td>
							<td height="80px" style="background-color:#e0e0e0"><font size="5" color="red"><b>10대</b></font></td>
							<td></td>
							<td height="80px" style="background-color:#e0e0e0"><font size="5" color="green"><b>20자리</b></font></td>
						</tr>
						<tr>
							<td height="10px"></td>
						</tr>
						<tr>
							<td colspan="5" height="550px" style="background-color:#e0e0e0">주차장 CCTV</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
<script src="./js/jquery-3.7.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<script>
window.onload = function()
{
	$("#carnumber").keyup(function (event)
		{	
			if (event.keyCode == 13)
			{
				SearchCar();
			}
			
		});
}

function carSearch() {
    var searchinput = document.getElementById('searchinput');
    if (searchinput.style.display == 'none') {
        searchinput.style.display = 'block';
    } else {
        searchinput.style.display = 'none';
    }
}

function SearchCar()
{
	carnumber = $("#carnumber").val();
	$.ajax({
		type : "get",
		data : { cmno : carnumber },
 		url: "searchcar.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$("#rightside").html(data);
			$("#searchinput").css('display','none');
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

function EnterList()
{
	$.ajax({
		type : "get",
		url: "enterlist.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$("#leftside").html(data);
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

function ExitList()
{
	$.ajax({
		type : "get",
		url: "exitlist.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$("#leftside").html(data);
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

function PayList()
{
	$.ajax({
		type : "get",
		url: "paylist.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$("#leftside").html(data);
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

function ParkingMap()
{
	$.ajax({
		type : "get",
		url: "parkingmap.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
			$("#rightside").html(data);
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
        maxDate: "+today",
        onSelect: function(dateText, inst) {
        	// 선택한 날짜를 URL 파라미터로 추가하여 페이지를 새로고침
            window.location.href = "main.jsp?date=" + dateText;
        }
    });    
    // 초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today');
});


function openinfo() 
{	
	var _width = '1100';
	var _height = '700';
		
	var _left = Math.ceil((window.screen.width - _width )/2);
	var _top = '400';
	
	window.open('info.jsp', '', 'width=1100, height=700, left=' + _left +', top=' + (_top - 250)); return false;
}

</script>
	</body>
</html>