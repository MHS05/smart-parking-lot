<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
.td5
{
	text-align:center;
	height:60px;
	font-weight:bold;
	font-size:20;
}
th
{	
	font-size:20;
	height:50px;
	background-color:#3498db;
}
.carnumber
{	
	margin-left:50px;
	margin-top:10px;
	color:red;
	font-size: 36;
}
</style>
<div style="height:600px; overflow: scroll;">
	<table border="1" width="1000px" align="center" style="border-collapse: collapse; overflow: scroll;">
		<div class="carnumber">������ȣ : <b>16��1234</b></div>
		<div align="center"><h1>��������</h1></div>
		<tr style="background-color:#eaeaea;">
			<th width="200px">��¥</th>
			<th>�����ð�</th>
			<th>�����ð�</th>
			<th>�������</th>
			<th>�������</th>
			<th>��������</th>
			<th>����</th>
		</tr>
		<% for(int i=0; i<20; i++)
		{ 
		%>
		<tr>
			<td class="td5">2024-01-01</td>
			<td class="td5">15:30</td>
			<td class="td5">16:00</td>
			<td class="td5">1000��</td>
			<td class="td5">1000��</td>
			<td class="td5">ī��</td>
			<td class="td5">�Ϲ�</td>
		</tr>
		<%
		} 
		%>
	</table>	
</div>	