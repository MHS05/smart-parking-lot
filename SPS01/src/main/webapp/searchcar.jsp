<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%

String cmno = "1";

TestDTO dto = new TestDTO();
TestVO vo  = dto.Read(cmno);
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
						<a href="javascript:openinfo();"><font size="6" color="red"><b>16�� 1234</b></font></a>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left">&emsp;<font size="4">�����ð� : <br><br>&emsp;�����ð� :</font><br><br>
						<font size="6">&emsp;&emsp;00�� 00�ð� 00��</font>
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
						<font size="6" color="#2ecc71"><b>14,000��</b></font>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left">&emsp;<font size="4">������� : <br><br><br>&emsp;������� :</font></td>
				</tr>
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
					<td colspan="2" align="center" id="imgList">���ε��� ���� ����
					<%
					if( vo.getEnterpic() != null)
					{
						%>
							<img style="width:40%;height:40%;" src="enterok.jsp?cmno=<%= cmno %>"><br>
						<%
					}else
					{
						%>
							<div>���� �߻�</div>
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
					<td colspan="2" align="center">���ε��� ���� ����</td>
				</tr>
			</table>
		</td>
	</tr>
</table>