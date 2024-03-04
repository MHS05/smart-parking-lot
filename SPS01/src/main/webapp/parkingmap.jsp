<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%

String managecctv = request.getParameter("managecctv");

CctvDTO dto = new CctvDTO();
CctvVO vo = dto.read(managecctv);
%>
<style>
.btn_upload 
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color:#gray;
	border: none;
	margin: 0 auto;
}
#cctv_image
{
  	display: none;
}
#cctv_imageok
{	
	align:center;
}
.btn_cctvok
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	background-color:#gray;
	border: none;
}	
.btn_upload:hover 
{
	background: rgb(77,77,77);
	color: #fff;
}
</style>
<script>
$(document).ready(function() 
		{
			$('#cctv_image').on('change', function(e) 
			{
				var file = e.target.files[0];
				var reader = new FileReader();
				reader.onload = function() 
				{
					$('#cctv_image_preview').html('<img src="' + reader.result + '" style="width:800px; height:600px">');
				}
				reader.readAsDataURL(file);
				$('#btn_enterupload').css('display','none')
			});
		});
		
function DoWrite()
{
	$("#cctv").submit();
}
</script>
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
			<%int result = 0; 
			try
			{
			result = Integer.parseInt(vo.getTotalspace()) - Integer.parseInt(vo.getTotalcar());
			}
			catch(Exception e)
			{
				
			}
			%>
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