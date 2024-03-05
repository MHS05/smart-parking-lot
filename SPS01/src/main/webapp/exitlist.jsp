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
		<th class="th3" colspan="3">출차</th>
	</tr>
	<tr>
		<td class="td3">일반</td>
		<td class="td3">회차</td>
		<td class="td3">합계</td>
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
			<th class="th3" colspan="4">출차 리스트</th>
		</tr>
		<tr>
			<td class="td3">차량번호</td>
			<td class="td3">시각</td>
			<td class="td3" colspan="2">차량구분</td>
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
						<td height="40px">출차</td>
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
					<td height="40px" colspan="4" >해당 날짜에 출차한 차량이 없습니다.</td>
				</tr>
				<tr>
					<td colspan="4"></td>
				</tr>
				<%
			}
		%>
	</table>
</div>