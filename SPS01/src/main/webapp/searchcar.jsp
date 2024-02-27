<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
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
%>
<table class="table05">
	<tr>
		<td rowspan="3" width="50px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
						<span id="span1"><font size="4"><b>��������</b></font></span>
						<a href="javascript:openinfo();"><font size="6" color="red"><b><%= vo.getCarnum() %></b></font></a>
					</td>
				</tr>
				<tr>
					<%
						if( vo.getExittime() != null )
						{
							%>
								<td colspan="2" style="text-align:left">&emsp;<font size="4">�����ð� : <%= vo.getExittime() %><br><br>&emsp;�����ð� : <%= vo.getEntertime() %></font><br><br>
							<%
						} else {
							
							%>
								<td colspan="2" style="text-align:left">&emsp;<font size="4">�����ð� : <br><br>&emsp;�����ð� : <%= vo.getEntertime() %></font><br><br>
							<%
						}
						//������������ '�����ð� ~ ����ð�' ���
						int time = Integer.parseInt(dto.timeDiff(cmno));
						if(time < 60)
						{
							%><font size="6">&emsp;&emsp;00�� 00�ð� <%= dto.timeDiff(cmno) %>��</font><%
						} else
						{
							int hour = time / 60;
							int min  = time - (hour * 60);
							%><font size="6">&emsp;&emsp;00�� <%= hour %>�ð� <%= min %>��</font><%
						}
						//���� ������ '�����ð� ~ �����ð�' ���ؾ���
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
						
						
							if(vo.getExittime() != null)
							{ //���� ������ ���
									int exittime = Integer.parseInt(dto.exittimeDiff(cmno));
									if(exittime < 30)
									{
										%><font size="6" color="#2ecc71"><b>600��</b></font>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:left">&emsp;<font size="4">������� : 600��<br><br><br>&emsp;������� : 600��</font></td>
									</tr>
										<%
									} else
									{
									 	int timecal = exittime / 30;
										timecal = timecal * 600;
										%><font size="6" color="#2ecc71"><b><%= timecal %>��</b></font>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:left">&emsp;<font size="4">������� : <%= timecal %>��<br><br><br>&emsp;������� : <%= timecal %>��</font></td>
									</tr>
										<%
									}
							} else 
							{ //���� �������� ���
								if(time < 30)
								{
									%><font size="6" color="#2ecc71"><b>600��</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:left">&emsp;<font size="4">������� : 600��<br><br><br>&emsp;������� : </font></td>
								</tr>
									<%
								} else
								{
								 	int timecal = time / 30;
									timecal = timecal * 600;
									%><font size="6" color="#2ecc71"><b><%= timecal %>��</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:left">&emsp;<font size="4">������� : <%= timecal %>��<br><br><br>&emsp;������� : </font></td>
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