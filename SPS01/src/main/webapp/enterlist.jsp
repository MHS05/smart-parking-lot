<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div style="height:735px; overflow: scroll;">
<table class="table02" border="1" align="center">
	<tr>
		<th class="th3" colspan="4">입차 리스트</th>
	</tr>
	<tr>
		<td class="td3">차량번호</td>
		<td class="td3">시각</td>
		<td class="td3" colspan="2">차량구분</td>
	</tr>
	<%
	for(int i=1; i<20; i++)
	{
	%>
	<tr>
		<td height="40px"></td>
		<td></td>
		<td colspan="2">입차</td>
	</tr>
	<%
	}
	%>
</table>
</div>