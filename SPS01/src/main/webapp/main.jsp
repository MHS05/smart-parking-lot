<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>스마트 주차장 관리 시스템</title>
<style>
td
{
	text-align:center;
}
th
{	
	height:30px;
	background-color:#3498db;
}
.td1
{	
	height:30px;
	font-weight:bold;
	background-color:#eaeaea;
}
.table01
{
	width:500px;
	height:700px;
	border-collapse:collapse;
	margin-top:15px;
	margin-left:240px;
	position:absolute;
}
.table02
{
	width:800px;
	height:700px;
	margin-top:15px;
	margin-right:250px;
}
</style>
</head>
	<body>
		<table class="table01" border="1">
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
	</body>
</html>