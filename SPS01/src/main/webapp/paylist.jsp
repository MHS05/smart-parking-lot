<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<table class="table04" border="1" align="center">
	<tr>
		<th class="th4" colspan="4">��������</th>
	<tr>
	</tr>
		<td class="td4">����</td>
		<td class="td4">�Ǽ�</td>
		<td class="td4" colspan="2">�ݾ�</td>
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
</table>
	<div style="height:500px; overflow: scroll;">
		<table class="table04_1" border="1" align="center">
			<tr>
				<th class="th4" colspan="4">���� ���� ����Ʈ</th>
			</tr>
			<tr>
				<td class="td4">�����ð�</td>
				<td class="td4">������ȣ</td>
				<td class="td4">����</td>
				<td class="td4">�ݾ�</td>
			</tr>
			<%
			for(int i=1; i<20; i++)
			{
			%>
			<tr>
				<td height="40px">02:00</td>
				<td>61�� 1234</td>
				<td>����</td>
				<td>15,000��</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</table>