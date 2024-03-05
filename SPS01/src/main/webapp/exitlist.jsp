<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String date = request.getParameter("date");

ListDTO dto = new ListDTO();

ArrayList<CarinfoVO> list = dto.getCarInfoList(date);

list = dto.getExitInfoList(date);
int turning = dto.getTruning(date);
int general = dto.getGeneral(date);

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
		<td height="40px"><%= general %></td>
		<td><%= turning %></td>
		<td><%= turning + general %></td>
	</tr>
	<tr style="border:none">
		<td colspan="4" style="height:20px"></td>
	</tr>
</table>
<div style="height:554px; overflow: scroll;">
	<table class="table03_1" border="1" align="center">
		<tr>
			<th class="th3" colspan="4">���� ����Ʈ</th>
		</tr>
		<tr>
			<td class="td3">������ȣ</td>
			<td class="td3">�ð�</td>
			<td class="td3" colspan="2">��������</td>
		</tr>
		<%
			if(!list.isEmpty())
			{
				for(CarinfoVO vo : list)
				{
					%>
					<tr>
						<td height="40px"><%= vo.getCarnum() %></td>
						<td height="40px" colspan="2"><%= vo.getExittime() %></td>
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