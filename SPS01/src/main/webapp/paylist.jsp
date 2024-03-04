<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%

String date = request.getParameter("date");
ListDTO dto = new ListDTO();

//����Ʈ�� ���ݰ��� �Ǽ�,�� �ݾ� ������(ù��° ���Ұ� �Ǽ�, �ι�°�� �ݾ�)
ArrayList<Integer> cashlist = dto.getCash(date);

//����Ʈ�� ī����� �Ǽ�,�� �ݾ� ������(ù��° ���Ұ� �Ǽ�, �ι�°�� �ݾ�)
ArrayList<Integer> cardlist = dto.getCard(date);

//�������� ��������
ArrayList<CarinfoVO> list = dto.getExitInfoList(date);

//���� ���ڸ� �� ���� ,
DecimalFormat formatter = new DecimalFormat("#,###");
%>
<table class="table04" border="1" align="center">
	<tr>
		<th class="th4" colspan="4">���� ���� �Ѱ�</th>
	<tr>
	</tr>
		<td class="td4">����</td>
		<td class="td4">�Ǽ�</td>
		<td class="td4" colspan="2">�ݾ�</td>
	</tr>
	<tr>
		<td height="30px">����</td>
		<td><%= cashlist.get(0) %></td>
		<td colspan="2"><%= formatter.format(cashlist.get(1)) %> ��</td>
	</tr>
	<tr>
		<td height="30px">ī��</td>
		<td><%= cardlist.get(0) %></td>
		<td colspan="2"><%= formatter.format(cardlist.get(1)) %> ��</td>
	</tr>
	<tr>
		<td height="30px">�հ�</td>
		<td><%= cardlist.get(0) + cashlist.get(0) %></td>
		<td colspan="2"><%= formatter.format(cardlist.get(1) + cashlist.get(1)) %> ��</td>
	</tr>
	<tr style="border:none">
		<td colspan="4" style="height:20px"></td>
	</tr>
</table>
	<div style="height:509px; overflow: scroll;">
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