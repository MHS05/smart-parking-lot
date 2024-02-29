<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
String cmno = request.getParameter("cmno");
if( cmno == null || cmno.equals("") )
{
	response.sendRedirect("main.jsp");
	return;
}

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);
if( vo == null )
{
	response.sendRedirect("main.jsp");
	return;	
}
//�����ð� - �����ð� = �����ð� 
int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
int timecal = exit_enter / 30;
timecal = timecal * 600;

//���� ���ڸ� �� ���� , ��� payamount�� �̸� ����
DecimalFormat formatter = new DecimalFormat("#,###");
String payamount = formatter.format(timecal);

int hour = exit_enter / 60;
int min  = exit_enter - (hour * 60);
int day  = hour / 24;
%>
<style>
font
{
	text-align:center;
}
</style>
<table class="table05">
	<tr>
		<td rowspan="3" width="50px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
						<span id="span1"><font size="4"><b>��������</b></font></span>
						<a href="javascript:openinfo();">
						<font size="6" color="red"><b><%= vo.getCarnum() %></b></font></a>
					</td>
				</tr>
				<tr>
					<%
					//���� X ������ ���
					if( vo.getExitpic() == null )
					{
					%>
						<td colspan="2">
							<font size="4">
							�����ð� : <%= vo.getEntertime() %><br><br>
							�����ð� : x
							</font><br><br>
					<%
					}
					//���� O ���� ���
					else 
					{	
					%>
						<td colspan="2">
							<font size="4">
							�����ð� : <%= vo.getEntertime() %><br><br>
							�����ð� : <%= vo.getExittime() %>
							</font><br><br>
					<%
					}
					//���� X ������ ���(Now_Enter) '����ð� - �����ð� = �����ð�' 
					int now_enter = Integer.parseInt(dto.Now_Enter(cmno));
					
					if( vo.getExitpic() == null )
					{	//60�� �̸��� ���
						if(now_enter < 60)
						{
						%>
							<font size="6">0�� 0�ð� <%= dto.Now_Enter(cmno) %>��</font>
						<%
						}
						//60�� �̻��� ���
						else
						{	
						%>
							<font size="6"><%= day %>�� <%= hour %>�ð� <%= min %>��</font>
						<%
						}
					}
					%>
					<%
					//���� O ���� ��� '�����ð� - �����ð� = �����ð�'
					if( vo.getExitpic() != null )
					{	//60�� �̸��� ��� �и� ǥ��
						if(exit_enter < 60)
						{
						%>
							<font size="6">0�� 0�ð� <%= dto.Exit_Enter(cmno) %>��</font>
						<%
						}
						//60�� �̻��� ��� ��¥, �ð�, �� ǥ��
						else
						{
						%>	
							<font size="6"><%= day %>�� <%= hour %>�ð� <%= min %>��</font>
						<%
						} 
					}
					%>
					</td>
				</tr>
			</table>
		</td>
		<td width="90px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
					<span id="span2"><font size="4"><b>�������</b></font></span>
					<% 
					//���� X �������� ���
					if( vo.getExitpic() == null )
					{ 	//�����ð� 10�� �̸��� ���
						if(now_enter < 10)
						{
						%>
							<font size="6" color="#2ecc71"><b>0��</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">������� : 0��<br><br>������� : </font></td>
						</tr>
						<%
						}
						//�����ð� 30�� �̸��� ���
						if(now_enter < 30)	
						{
						%>
							<font size="6" color="#2ecc71"><b>600��</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">������� : 600��<br><br>������� : </font></td>
						</tr>
						<%
						}
						//�����ð� 30�� �̻��� ���
						else 
						{
							%>
							<font size="6" color="#2ecc71"><b><%= payamount %>��</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">������� : <%= payamount %>��<br><br>������� : </font></td>
						</tr>
						<%
						}
					}
					%>
					<%
					//���� O ������ ���
					if(vo.getExitpic() != null)
					{ 	//�����ð� 10�� �̸��� ���
						if(exit_enter < 10)
						{
						%>
							<font size="6" color="#2ecc71"><b>0��(ȸ��)</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">������� : 0��<br><br>������� : 0��</font></td>
						</tr>
						<%
						}
						//�����ð� 10�� �̻� 30�� �̸��� ���
						else if(10 <= exit_enter && exit_enter < 30)
						{
						%>
							<font size="6" color="#2ecc71"><b>600��</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">������� : 600��<br><br>������� : 600��</font></td>
						</tr>
						<%
						}
						//�����ð� 30�� �̻��� ���
						else
						{
						%>
							<font size="6" color="#2ecc71"><b><%= payamount %>��</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">������� : <%= payamount %>��<br><br>������� : <%= payamount %>��</font></td>
						</tr>
						<%
						}
					} 
					%>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="3" height="30px"></td>
	</tr>
	<tr>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td height="100px" align="center"><font size="5"><b>������ ����</b></font></td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="imgList">
					<%
					if( vo.getEnterpic() != null)
					{
					%>
						<img style="width:400px;height:240px;" src="enter_imagedown.jsp?cmno=<%= cmno %>"><br>
					<%
					}
					else
					{
					%>
						<div>���� ���� X</div>
					<%
					}
					%>
					</td>
				</tr>
			</table>
		</td>
		<td width="50px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td height="100px" align="center"><font size="5"><b>������ ����</b></font></td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="imgList">
					<%
					if( vo.getExitpic() != null)
					{
					%>
						<img style="width:400px; height:240px;" src="exit_imagedown.jsp?cmno=<%= cmno %>"><br>
					<%
					}
					else
					{
					%>
						<div>���� ���� X</div>
					<%
					}
					%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>