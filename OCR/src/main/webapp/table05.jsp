<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
td
{
	text-align:center;
	height:20px;
	width:100px;
	font-weight:bold;
}
.carnumber
{	
	margin-left:450px;
	margin-top:10px;
	position:absolute;
	color:red;
	font-size: 36;
}
</style>
<!DOCTYPE html>
<html>
	<body>
		<table border="1" width="1000px" height="600px" align="center" style="border-collapse: collapse;">
			<div class="carnumber">16��1234</div>
			<div align="center"><h1>��������</h1></div>
			<tr style="background-color:#eaeaea">
				<td>��¥</td>
				<td>�����ð�</td>
				<td>�����ð�</td>
				<td>�������</td>
				<td>�������</td>
				<td>��������</td>
			</tr>
			<tr>
				<td>2024-01-01</td>
				<td>15:30</td>
				<td>16:00</td>
				<td>1000��</td>
				<td>1000��</td>
				<td>ī��</td>
			</tr>
			<% for(int i=0; i<10; i++)
			{ %><tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<%} %>
		</table>		
	</body>
</html>