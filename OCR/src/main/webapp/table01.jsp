<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="head.jsp" %>
<style>
td
{
	text-align:center;
	height:30px;
}
th
{	
	height:30px;
	background-color:#3498db;
}
.td1
{
	font-weight:bold;
	background-color:#eaeaea;
}
</style>
<!DOCTYPE html>
<html>
	<body>
		<table border="1" width="500px" height="700px" align="center" style="border-collapse: collapse; margin-top:15px">
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
				<td>10</td>
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
				<td>현금</td>
				<td>9</td>
				<td colspan="2">1,150,000 원</td>
			</tr>
			<tr>
				<td>카드</td>
				<td>15</td>
				<td colspan="2">2,800,000 원</td>
			</tr>
			<tr>
				<td>합계</td>
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
				<td>61아 1234</td>
				<td>2019-01-01 00:00</td>
				<td colspan="2">입차</td>
			</tr>
			<tr>
				<td>61아 1234</td>
				<td>2019-01-01 00:00</td>
				<td colspan="2">출차</td>
			</tr>
		</table>
	</body>
</html>