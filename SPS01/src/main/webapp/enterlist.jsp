<%@page import="sps.vo.CarinfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sps.dto.ListDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String date = request.getParameter("date");

ListDTO dto = new ListDTO();

ArrayList<CarinfoVO> list = dto.getCarInfoList(date);

%>
<div style="height:735px; overflow: scroll;">
<table class="table02" border="1" align="center">
	<tr>
		<th class="th3" colspan="4">���� ����Ʈ</th>
	</tr>
	<tr>
		<td class="td3" width="150px">������ȣ</td>
		<td class="td3" colspan="2">�ð�</td>
		<td class="td3" width="100px">��������</td>
	</tr>
	<%
	if(!list.isEmpty())
	{
		for(CarinfoVO vo : list)
		{
			%>
			<tr>
				<td height="40px"><%= vo.getCarnum() %></td>
				<td height="40px" colspan="2"><%= vo.getEntertime() %></td>
				<td height="40px">����</td>
			</tr>
			<%
		}
			%>
			<tr>
				<td></td>
				<td colspan="2"></td>
				<td></td>
			</tr>
			<%
	} else 
	{
		%>
		<tr>
			<td height="40px" colspan="4" >�ش� ��¥�� ������ ������ �����ϴ�.</td>
		</tr>
		<tr>
			<td colspan="4"></td>
		</tr>

		<%
	}
	%>
</table>
</div>