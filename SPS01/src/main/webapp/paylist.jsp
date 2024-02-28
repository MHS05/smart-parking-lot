<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);

int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
int timecal = exit_enter / 30;
timecal = timecal * 600;

//숫자 세자리 수 마다 ,
DecimalFormat formatter = new DecimalFormat("#,###");
String payamount = formatter.format(timecal);
%>
<table class="table04" border="1" align="center">
	<tr>
		<th class="th4" colspan="4">결제 내역 총계</th>
	<tr>
	</tr>
		<td class="td4">구분</td>
		<td class="td4">건수</td>
		<td class="td4" colspan="2">금액</td>
	</tr>
	<tr>
		<td height="30px">현금</td>
		<td>9</td>
		<td colspan="2">1,150,000 원</td>
	</tr>
	<tr>
		<td height="30px">카드</td>
		<td>15</td>
		<td colspan="2">2,800,000 원</td>
	</tr>
	<tr>
		<td height="30px">합계</td>
		<td>24</td>
		<td colspan="2">3,950,000 원</td>
	</tr>
	<tr style="border:none">
		<td colspan="4" style="height:20px"></td>
	</tr>
</table>
	<div style="height:509px; overflow: scroll;">
		<table class="table04_1" border="1" align="center">
			<tr>
				<th class="th4" colspan="4">결제 내역 리스트</th>
			</tr>
			<tr>
				<td class="td4">결제시간</td>
				<td class="td4">차량번호</td>
				<td class="td4">구분</td>
				<td class="td4">금액</td>
			</tr>
			<%
			for(int i=1; i<20; i++)
			{
			%>
			<tr>
				<td height="40px"><%= vo.getExittime() %></td>
				<td><%= vo.getCarnum() %></td>
				<td>현금</td>
				<td><%= payamount %></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</table>