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

//���� ���ڸ� �� ���� ,
DecimalFormat formatter = new DecimalFormat("#,###");
String payamount = formatter.format(timecal);
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
			for(int i=1; i<20; i++)
			{
			%>
			<tr>
				<td height="40px"><%= vo.getExittime() %></td>
				<td><%= vo.getCarnum() %></td>
				<td>����</td>
				<td><%= payamount %></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</table>