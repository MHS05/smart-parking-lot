<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);
%>
<table class="table03" border="1" align="center">
	<tr>
		<th class="th3" colspan="3">����</th>
	</tr>
	<tr>
		<td class="td3">�Ϲ�</td>
		<td class="td3">ȸ��</td>
		<td class="td3">�հ�</td>
	</tr>
	<tr>
		<td height="40px">10</td>
		<td>10</td>
		<td>25</td>
	</tr>
	<tr style="border:none">
		<td colspan="4" style="height:20px"></td>
	</tr>
</table>
<div style="height:554px; overflow: scroll;">
	<table class="table03_1" border="1" align="center">
		<tr>
			<th class="th3" colspan="4">������ ����Ʈ</th>
		</tr>
		<tr>
			<td class="td3">������ȣ</td>
			<td class="td3">�ð�</td>
			<td class="td3" colspan="2">��������</td>
		</tr>
		<%
		for(int i=1; i<20; i++)
		{
			if(i%2==1)
			{
			%>
			<tr>
				<td height="40px"><%= vo.getCarnum() %></td>
				<td><%= vo.getEntertime() %></td>
				<td colspan="2">����</td>
			</tr>
			<%
			}
			else
			{
			%>
			<tr>
				<td height="40px"><%= vo.getCarnum() %></td>
				<td><%= vo.getExittime() %></td>
				<td colspan="2">����</td>
			</tr>
			<%
			}
		}
		%>
	</table>
</div>