<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%

String date = request.getParameter("date");
ListDTO dto = new ListDTO();

//리스트로 현금결제 건수,총 금액 가져옴(첫번째 원소가 건수, 두번째가 금액)
ArrayList<Integer> cashlist = dto.getCash(date);

//리스트로 카드결제 건수,총 금액 가져옴(첫번째 원소가 건수, 두번째가 금액)
ArrayList<Integer> cardlist = dto.getCard(date);

//출차정보 가져오기
ArrayList<CarinfoVO> list = dto.getExitInfoList(date);

//숫자 세자리 수 마다 ,
DecimalFormat formatter = new DecimalFormat("#,###");
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
		<td><%= cashlist.get(0) %></td>
		<td colspan="2"><%= formatter.format(cashlist.get(1)) %> 원</td>
	</tr>
	<tr>
		<td height="30px">카드</td>
		<td><%= cardlist.get(0) %></td>
		<td colspan="2"><%= formatter.format(cardlist.get(1)) %> 원</td>
	</tr>
	<tr>
		<td height="30px">합계</td>
		<td><%= cardlist.get(0) + cashlist.get(0) %></td>
		<td colspan="2"><%= formatter.format(cardlist.get(1) + cashlist.get(1)) %> 원</td>
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
			for(CarinfoVO vo : list)
			{
			%>
			<tr>
				<td height="40px"><%= vo.getExittime() %></td>
				<td><%= vo.getCarnum() %></td>
				<td><%= vo.getPayclassifi() %></td>
				<% int amount = Integer.parseInt(vo.getPayamount()); %>
				<td><%= formatter.format(amount) %></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="4"></td>
			</tr>
		</table>
	</div>
</table>