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
</style>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="EUC-KR">
		<title>스마트 주차 관리 시스템</title>
	</head>
	<body>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:#e0e0e0">
			<tr>
				<td width="80px" height="65px">
					<img style="width:80px; height:60px;" src="image/logo.png">
				</td>
				<td width="400px" style="text-align:left"><font size="5"><b>스마트 주차 관리 시스템</b></font></td>
				<td width="200px"></td>
				<td colspan="6" align="right" style="text-align:right"><button class=btn_logout>로그아웃</button></td>
			</tr>
		</table>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:3498db">
			<tr>
				<td align="center"><img src="image/calender.png" style="width:60px; height:60px"></td>
				<td><font size="6"><b>2024-02-15</b></font></td>
				<td width="200px"></td>
				<td align="center"><button class=btn>입출차 카메라</button></td>
				<td align="center"><button class=btn>입차 현황</button></td>
				<td align="center"><button class=btn>출차 현황</button></td>
				<td align="center"><button class=btn>결제 내역</button></td>
				<td align="center"><button class=btn>주차장 맵</button></td>
				<td align="center"><button class=btn>차량 검색</button></td>
			</tr>
		</table>
	</body>
</html>