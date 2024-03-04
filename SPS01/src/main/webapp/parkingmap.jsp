<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%
String managecctv = request.getParameter("managecctv");

CctvDTO dto2 = new CctvDTO();
CctvVO vo = dto2.read(managecctv);
 %>
<table border="0" align="center" width=800px;>
	<tr>
		<td width="100px" height="30px"><font size="4"><b>총 주차 자리 수</b></font></td>
		<td width="20px"></td>
		<td width="100px" height="30px"><font size="4"><b>현재 주차 중인 차량 수</b></font></td>
		<td width="20px"></td>
		<td width="100px" height="30px"><font size="4"><b>주차 가능한 자리 수</b></font></td>
	</tr>
	<tr>
		<%
		if(managecctv != null)
		{
		%>
			<td height="80px" style="background-color:#e0e0e0"><font size="5"><b><%= vo.getTotalspace() %></b></font></td>
			<td></td>
			<td height="80px" style="background-color:#e0e0e0"><font size="5" color="red"><b><%= vo.getTotalcar() %></b></font></td>
			<td></td>
			<%Integer result = Integer.parseInt(vo.getTotalspace()) - Integer.parseInt(vo.getTotalcar()); %>
			<td height="80px" style="background-color:#e0e0e0"><font size="5" color="green"><b><%= result %></b></font></td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td colspan="5">
					<div id="cctv_image_preview" style="background-color:#e0e0e0;border:1px solid lightgrey;width:800px;height:600px;">
						<img style="width:800px; height:600px;" src="cctv_imagedown.jsp?managecctv=<%= managecctv %>">
					</div>
				</td>
			</tr>
		<%
		} 
		else
		{
		%>
			<td height="80px" style="background-color:#e0e0e0"><font size="5"><b>0</b></font></td>
			<td></td>
			<td height="80px" style="background-color:#e0e0e0"><font size="5" color="red"><b>0</b></font></td>
			<td></td>
			<td height="80px" style="background-color:#e0e0e0"><font size="5" color="green"><b>0</b></font></td>
			</tr>
			<tr>
				<td height="10px"></td>
			</tr>
			<tr>
				<td colspan="5" height="600px" style="background-color:white;">
					<form id="cctv" name="cctv" method="post" action="cctv_uploadok.jsp" enctype="multipart/form-data">
					<div id="cctv_image_preview" style="background-color:#e0e0e0;border:1px solid lightgrey;width:800px;height:600px;"></div>
						<label for="cctv_image">
							<span class="btn_upload" id="btn_enterupload" style="padding: 0px 0px;position:absolute;top:590px;left:1200px" >업로드</span>
						</label>
						<input type="file" name="cctv_image" id="cctv_image" accept="image/*">
					</form>
				</td>
			</tr>
		<%
		}
		%>
	</table>
	<%
	if(managecctv == null)
	{
	%>
	<input type="button" id="upload" onclick="DoWrite()" value="cctv 등록">
	<%
	}
	else
	{
	%>
	<div></div>
	<% 
	}
	%>