<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����Ʈ ������ ���� �ý���</title>
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
				<th colspan="4">����</th>
			</tr>
			<tr>
				<td class="td1">�Ϲ�</td>
				<td class="td1">ȸ��</td>
				<td class="td1">��������</td>
				<td class="td1">�հ�</td>
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
				<th colspan="4">��������</th>
			</tr>
			<tr>
				<td class="td1">����</td>
				<td class="td1">�Ǽ�</td>
				<td class="td1" colspan="2">�ݾ�</td>
			</tr>
			<tr>
				<td height="30px">����</td>
				<td>9</td>
				<td colspan="2">1,150,000 ��</td>
			</tr>
			<tr>
				<td height="30px">ī��</td>
				<td>15</td>
				<td colspan="2">2,800,000 ��</td>
			</tr>
			<tr>
				<td height="30px">�հ�</td>
				<td>24</td>
				<td colspan="2">3,950,000 ��</td>
			</tr>
			<tr style="border:none">
				<td colspan="4" style="height:20px"></td>
			</tr>
			<tr>
				<th colspan="4">������ ����Ʈ</th>
			</tr>
			<tr>
				<td class="td1">������ȣ</td>
				<td class="td1">�ð�</td>
				<td class="td1" colspan="2">��������</td>
			</tr>
			<tr>
				<td height="30px">61�� 1234</td>
				<td>2019-01-01 00:00</td>
				<td colspan="2">����</td>
			</tr>
			<tr>
				<td height="30px">61�� 1234</td>
				<td>2019-01-01 00:00</td>
				<td colspan="2">����</td>
			</tr>
		</table>
		<table class="table02" border="0" align="right">
			<tr>
				<td height="40px">���� ���� ���� ���� ��</td>
				<td width="20px"></td>
				<td height="40px">���� ������ �ڸ� ��</td>
			</tr>
			<tr>
				<td height="80px" style="background-color:#e0e0e0">10��</td>
				<td></td>
				<td height="80px" style="background-color:#e0e0e0">20�ڸ�</td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td colspan="3" height="250px" style="background-color:#e0e0e0">������ ��</td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
				<td colspan="3" height="250px" style="background-color:#e0e0e0">������ CCTV</td>
			</tr>
		</table>
	</body>
</html>