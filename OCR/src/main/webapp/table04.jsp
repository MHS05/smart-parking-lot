<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="head.jsp" %>
<style>
#span1
{	
	padding: 7px 30px;
	background-color : red;
	border-radius: 5px;
	text-align: center;
	display:inline-block;
	width:100px;
	padding: 0px 0px;
}
#span2
{
	padding: 7px 30px;
	background-color : #2ecc71;
	border-radius: 5px;
	text-align: center;
	display:inline-block;
	width:100px;
	padding: 0px 0px;
}
.table05
{
	border-collapse: collapse;
	width:1200px;
	height:800px;
	margin-top:50px;
}
</style>
<html>
<body>
	<table class="table05" border="0"  align="center">
		<tr>
			<td>
				<table border="1" width="500px" height="400px" align="center">
					<tr style="background-color:#3498db">
						<td align="center" height="100px">
							<span id="span1">차량정보</span>
							<font size="6" color="red"><b>16저 1234</b></font>
						</td>
					</tr>
					<tr>
						<td colspan="2">&emsp;출차시간 : <br><br>&emsp;입차시간 : <br><br>
							<font size="7">&emsp;&emsp;00일 00시간 00분</font>
						</td>
					</tr>
				</table>
			</td>
			<td width="50px"></td>
			<td>
				<table border="1" width="500px" height="400px" align="center">
					<tr style="background-color:#3498db">
						<td align="center" height="100px">
							<span id="span2">주차요금</span>
							<font size="6" color="#2ecc71"><b>14,000원</b></font>
						</td>
					</tr>
					<tr>
						<td colspan="2">&emsp;주차요금 : <br><br><br>&emsp;결제요금 :</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" height="50px"></td>
		</tr>
		<tr>
			<td>
				<table border="1" width="500px" height="400px" align="center">
					<tr style="background-color:#3498db">
						<td height="100px" align="center">입차시 사진</td>
					</tr>
					<tr>
						<td colspan="2" align="center">사진</td>
					</tr>
				</table>
			</td>
			<td width="50px"></td>
			<td>
				<table border="1" width="500px" height="400px" align="center">
					<tr style="background-color:#3498db">
						<td height="100px" align="center">출차시 사진</td>
					</tr>
					<tr>
						<td colspan="2" align="center">사진</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>