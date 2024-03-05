<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();

cmno = dto.SearchCar(cmno);


CarinfoVO vo  = dto.Read(cmno);

//�����ð�
int now_enter=0;
int exit_enter=0;
try{
	now_enter = Integer.parseInt(dto.Now_Enter(cmno));
	exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
}catch(Exception e){
	
}
%>
<style>
.td5
{
	text-align:center;
	height:60px;
	font-weight:bold;
	font-size:20;
}
th
{	
	font-size:20;
	height:50px;
	background-color:#3498db;
}
.carnumber
{	
	margin-left:50px;
	margin-top:10px;
	color:red;
	font-size: 36;
}
</style>
<div style="height:600px; overflow: scroll;">
	<table border="1" width="1000px" align="center" style="border-collapse: collapse; overflow: scroll;">
		<div class="carnumber"><b>������ȣ : <%= vo.getCarnum() %></b></div>
		<div align="center"><h1>��������</h1></div>
		<tr style="background-color:#eaeaea;">
			<th>�����ð�</th>
			<th>�����ð�</th>
			<th>�������</th>
			<th>�������</th>
			<th>��������</th>
			<th>����</th>
		</tr>
		<tr>
			<td class="td5"><%= vo.getEntertime() %></td>
			<td class="td5"><%= vo.getExittime()  %></td>
			<%
			//���� X �������� ���
			if( vo.getEntertime().equals(vo.getExittime()) )
			{ 	//�����ð� 10�� �̸��� ���
				if(now_enter < 10)
				{
				%>
					<td class="td5">������� : 0��(ȸ��)</td>
					<td class="td5">������� : 0��</td>
				<%
				}
				//�����ð� 30�� �̸��� ���
				else if(now_enter < 30)	
				{
				%>
					<td class="td5">������� : 600��</td>
					<td class="td5">������� :    ��</td>
				<%
				}
				//�����ð� 30�� �̻��� ���
				else 
				{
					%>
					<td class="td5">������� : <%= vo.getPayamount() %>��</td>
					<td class="td5">������� : <%= vo.getPayamount() %>��</td>
				<%
				}
			}
			//���� O ������ ���
			if( !vo.getEntertime().equals(vo.getExittime()) )
			{ 	//�����ð� 10�� �̸��� ���
				if(exit_enter < 10)
				{
				%>
					<td class="td5">������� : 0��(ȸ��)</td>
					<td class="td5">������� : 0��</td>
				<%
				}
				//�����ð� 10�� �̻� 30�� �̸��� ���
				else if(10 <= exit_enter && exit_enter < 30)
				{
				%>
					<td class="td5">������� : 600��</td>
					<td class="td5">������� : 600��</td>
				<%
				}
				//�����ð� 30�� �̻��� ���
				else
				{
				%>
					<td class="td5">������� : <%= vo.getPayamount() %>��</td>
					<td class="td5">������� : <%= vo.getPayamount() %>��</td>
				<%
				}
			} 
			%>
			<td class="td5"><%= vo.getPaymethod() %></td>
			<td class="td5"><%= vo.getPayclassifi() %></td>
		</tr>
	</table>	
</div>	