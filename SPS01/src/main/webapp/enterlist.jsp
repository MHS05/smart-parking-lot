<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);
%>
<div style="height:735px; overflow: scroll;">
<table class="table02" border="1" align="center">
	<tr>
		<th class="th3" colspan="4">���� ����Ʈ</th>
	</tr>
	<tr>
		<td class="td3">������ȣ</td>
		<td class="td3">�ð�</td>
		<td class="td3" colspan="2">��������</td>
	</tr>
	<%
	for(int i=1; i<20; i++)
	{
	%>
	<tr>
		<td height="40px"><%= vo.getCarnum() %></td>
		<td><%= vo.getEntertime() %></td>
		<td colspan="2">����</td>
	</tr>
	<%
	}
	%>
</table>
</div>