<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo   = dto.Read(cmno);

//�������
dto.UpdateTimecal(vo);

dto.UpdatePayamount(vo);

//�������
String paymethod = request.getParameter("paymethod");
vo.setPaymethod(paymethod);
dto.UpdatePaymethod(cmno, vo);

int payamountInt = 0;
try
{
	payamountInt = Integer.parseInt(vo.getPayamount());
} catch(Exception e){}


//�����ð� - �����ð� = �����ð�
int exit_enter = 0;
try
{
exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
} catch(Exception e){}
int hour = exit_enter / 60;
int min  = exit_enter - (hour * 60);
int day  = hour / 24;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����Ʈ ������ ���� �ý���</title>
		<link rel="stylesheet" type="text/css" href="../css/sps.css">
		<link rel="stylesheet" type="text/css" href="../css/background.css">
	</head>
<style>
#call
{	
	margin-left:900px;
}
</style>
	<body>
		<table class="fee_table" border="0">
			<tr height="20px"></tr>
			<tr>
				<td colspan="3" height="100px">
					<font size="7"><b>���� �����</b></font>
					<a href="tel:010-1234-5678">
					<img id="call" src="../image/call.png" title="������ �����ϱ�" style="width:100px; height:100px" onclick="document.location.href='tel:010-1234-5678'">
					</a>
				</td>
			<tr>
				<td class="marquee" colspan="3">
					<MARQUEE><%= vo.getCarnum() %> ����, ���� �������� �̿����ּż� �����մϴ�. �ȳ��� ���ʽÿ�.</MARQUEE>
				</td>
			</tr>
			<tr>
				<td height="400px">
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
								<span id="span2"><font size="4"><b>��������</b></font></span>
								<font size="6" color="#2ecc71"><b><%= vo.getCarnum() %></b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">�����ð� : <%= vo.getEntertime() %><br><br>
							�����ð� : <%= vo.getExittime() %></font><br><br>
							<% 
							//���� O ���� ��� '�����ð� - �����ð� = �����ð�'
								
							if( !vo.getEntertime().equals(vo.getExittime()) )
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
				<td width="10px"></td>
				<td>
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
							<span id="span2"><font size="4"><b>�������</b></font></span>
							<%
							//���� O ������ ���
							if(!vo.getEntertime().equals(vo.getExittime()))
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
									<font size="6" color="#2ecc71"><b><%= payamountInt %>��</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">������� : <%= payamountInt %>��<br><br>������� : <%= payamountInt %>��</font></td>
								</tr>
								<%
								}
							} 
							%>
							<% 
							//���� X �������� ���
							int now_enter = Integer.parseInt(dto.Now_Enter(cmno));
							
							if( vo.getEntertime().equals(vo.getExittime()) )
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
								else if(now_enter < 30)	
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
									<font size="6" color="#2ecc71"><b><%= payamountInt %>��</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<font size="5">������� : <%= payamountInt %>��<br><br>������� : </font></td>
								</tr>
								<%
								}
							}
							%>
					</table>
				</td>
			</tr>
			<tr>
			<% 
			//�����ð� 10�� �̻��� ��쿡�� �����ϱ� ��ư ǥ��
			if(exit_enter > 10)
			{ 
			%>
				<td colspan="3">
					<a href="parkingfee02.jsp?cmno=<%= cmno %>"><input type="button" value="�����ϱ�" class="pay_btn"></a>
				</td>
			<%
			}
			%>
			</tr>
		</table>
	</body>
</html>