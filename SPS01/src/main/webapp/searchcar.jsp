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
						<span id="span1"><font size="4"><b>차량정보</b></font></span>
						<a href="javascript:openinfo();"><font size="6" color="red"><b>16저 1234</b></font></a>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left">&emsp;<font size="4">출차시간 : <br><br>&emsp;입차시간 :</font><br><br>
						<font size="6">&emsp;&emsp;00일 00시간 00분</font>
					</td>
				</tr>
			</table>
		</td>
		<td width="90px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
						<span id="span2"><font size="4"><b>주차요금</b></font></span>
						<font size="6" color="#2ecc71"><b>14,000원</b></font>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left">&emsp;<font size="4">주차요금 : <br><br><br>&emsp;결제요금 :</font></td>
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
					<td height="100px" align="center"><font size="5"><b>입차시 사진</b></font></td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="imgList">업로드한 입차 사진
					<%
					if( vo.getEnterpic() != null)
					{
						%>
							<img style="width:40%;height:40%;" src="enterok.jsp?cmno=<%= cmno %>"><br>
						<%
					}else
					{
						%>
							<div>오류 발생</div>
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
					<td height="100px" align="center"><font size="5"><b>출차시 사진</b></font></td>
				</tr>
				<tr>
					<td colspan="2" align="center">업로드한 출차 사진</td>
				</tr>
			</table>
		</td>
	</tr>
</table>