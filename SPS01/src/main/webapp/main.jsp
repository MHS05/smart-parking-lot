<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%
//현재 날짜 받아오기
Date d = new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String today = simpleDate.format(d);

String date = request.getParameter("date");
if(date == null) date = today;

ListDTO dto = new ListDTO();

//해당날짜 모든 차량 정보
ArrayList<CarinfoVO> list = dto.getCarInfoList(date);

//출차 차량정보
ArrayList<CarinfoVO> list2 = dto.getExitInfoList(date);
//출고 차량수
int allCar  = list2.size();
//회차 차량수
int turning = dto.getTruning(date);
//일반 차량수
int general = dto.getGeneral(date);

//리스트로 현금결제 건수,총 금액 가져옴(첫번째 원소가 건수, 두번째가 금액)
ArrayList<Integer> cashlist = dto.getCash(date);

//리스트로 카드결제 건수,총 금액 가져옴(첫번째 원소가 건수, 두번째가 금액)
ArrayList<Integer> cardlist = dto.getCard(date);

//숫자 세자리 수 마다 ,
DecimalFormat formatter = new DecimalFormat("#,###");

String managecctv = request.getParameter("managecctv");
if(managecctv == null) 
{
	managecctv = "a";
};
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
.btn_upload 
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color:#gray;
	border: none;
	margin: 0 auto;
}
#cctv_image
{
  	display: none;
}
#cctv_imageok
{	
	align:center;
}
.btn_cctvok
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	background-color:#gray;
	border: none;
}	
.btn_upload:hover 
{
	background: rgb(77,77,77);
	color: #fff;
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
				<td width="550px" height="200px;" align="center" id="leftside">
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
							<td height="30px"><%= general %></td><!-- 전체차량 - 회차차량 -->
							<td><%= turning %></td><!--회차차량 -->
							<td><%= allCar %></td><!-- 전체차량 -->
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
							<td><%= cashlist.get(0) %></td>
							<td colspan="2"><%= formatter.format(cashlist.get(1)) %> 원</td>
						</tr>
						<tr>
							<td height="30px">카드</td>
							<td><%= cardlist.get(0) %></td>
							<td colspan="2"><%= formatter.format(cardlist.get(1)) %> 원</td>
						</tr>
						<tr>
							<td height="30px">합계</td>
							<td><%= cardlist.get(0) + cashlist.get(0) %></td>
							<td colspan="2"><%= formatter.format(cardlist.get(1) + cashlist.get(1)) %> 원</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
					</table>
					<div style="height:440px; overflow: scroll;">
						<table class="table01_1" border="1">
							<tr>
								<th class="th1_1" colspan="4">입출차 리스트</th>
							</tr>
				
							<tr>
								<td class="td1_1" width="70px">차량번호</td>
								<td class="td1_1" width="300px">시각</td>
								<td class="td1_1" width="70px" colspan="2">차량구분</td>
							</tr>
							<% 
								if(!list.isEmpty())
								{
									for(CarinfoVO cvo : list)
									{
										if( !cvo.getEntertime().equals(cvo.getExittime()))
										{
											
											%>
											<tr>
												<td height="40px"><%= cvo.getCarnum() %></td>
												<td><%= cvo.getEntertime() %></td>
												<td colspan="2">입차</td>
											</tr>
											<tr>
												<td height="40px"><%= cvo.getCarnum() %></td>
												<td><%= cvo.getExittime() %></td>
												<td colspan="2">출차</td>
											</tr>
											<%
										} else 
										{
											%>
												<tr>
													<td height="40px"><%= cvo.getCarnum() %></td>
													<td><%= cvo.getEntertime() %></td>
													<td colspan="2">입차</td>
												</tr>
											<% 
										}
									}
								} else
								{
									%>
										<tr>
											<td height="40px" colspan="3">입.출차한 차량이 없습니다.</td>
										</tr>	
									<%
								}
							%>
						</table>
					</div>
				</td>
				<td width="800px" align="center" id="rightside"></td>
			</tr>
		</table>
<script src="./js/jquery-3.7.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<script>

$(document).ready(function() 
{
	$('#cctv_image').on('change', function(e) 
	{
		var file = e.target.files[0];
		var reader = new FileReader();
		reader.onload = function() 
		{
			$('#cctv_image_preview').html('<img src="' + reader.result + '" style="width:800px; height:600px">');
		}
		reader.readAsDataURL(file);
		$('#btn_enterupload').css('display','none')
	});
});

window.onload = function()
{
	$.ajax({
		type : "get",
		url: "parkingmap.jsp?managecctv=<%= managecctv %>",
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
		url: "enterlist.jsp?date=<%= date %>",
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
		url: "exitlist.jsp?date=<%= date %>",
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
		url: "paylist.jsp?date=<%= date %>",
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
        	// 선택한 날짜를 URL 파라미터로 추가하여 페이지를 새로고침하지 않고 업데이트
            //history.replaceState(null, null, "?date=" + dateText);
            window.location.href = "main.jsp?date=" + dateText;
        }
    });    
    // 초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', '<%= date %>');
});


function openinfo() {
    var cmno = $("#carnumber").val();
    var _width = '1100';
    var _height = '700';
    var _left = Math.ceil((window.screen.width - _width )/2);
    var _top = '400';
    window.open('info.jsp?cmno=' + cmno, '', 'width=1100, height=700, left=' + _left +', top=' + (_top - 250));
    return false;
}


</script>
	</body>
</html>