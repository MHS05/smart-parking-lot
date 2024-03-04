<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%
CarinfoVO vo = new CarinfoVO();
vo.setEntertime(vo.getEntertime());
String date = vo.EntertimeAsDate();
String cmno = request.getParameter("cmno");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����Ʈ ������ ���� �ý���</title>
		<link rel="stylesheet" type="text/css" href="./css/background.css">
		<link rel="stylesheet" type="text/css" href="./css/camera.css">
		<link rel="stylesheet" type="text/css" href="css/loading-bar.css"/> 
		<script type="text/javascript" src="js/loading-bar.js"></script>
	</head>
	<body>
		<div class="admin" align="right">
			<a href="main.jsp?date=<%= date %>"><img src="image/admin.png" id="admin_img"><br><font color="white">������ ������</font></a>
		</div>
		<span class="money">
			<a href="user/parkingfee01.jsp?cmno=<%=cmno%>"><img src="image/money.png" style="width:100px; height:80px;"><br><font color="white">&emsp;�����ϱ�</font></a>
		</span>
		<table border="0" align="center" style="opacity: 0.93;">
			<tr>
				<td align="center" height="80px" width="600px"><h2>������ ī�޶�</h2></td>
				<td width="100px"></td>
				<td align="center" width="600px"><h2>������ ī�޶�</h2></td>
			</tr>
			<tr>
				<td align="center" height="300px">
					<div id="enter_image_preview">
						<img src="image/icon_enter_car.png" style="width:600px; height:600px">
					</div>
				</td>
				<td>
					<div id="loading" class="IdBar" style="height:50px; margin-top:200px; z-index:9000;"></div>
				</td>
				<td align="center">
					<div id="exit_image_preview">
						<img src="image/icon_exit_car.png" style="width:600px; height:600px">
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" width="135px">
					<form id="enter" name="enter" method="post" action="enter_uploadok.jsp" enctype="multipart/form-data" onsubmit="return DoSubmitEnter();">
						<label for="enter_image">
							<span class="btn_upload" id="btn_enterupload" style="padding: 0px 0px">���ε�</span>
						</label>
						<input type="file" name="enter_image" id="enter_image" accept="image/*">
						<span style="display:none;" id="enter_imageok"><input type="submit" value="Ȯ��" class="btn_enterok"></span>
					</form>
				</td>
				<td>
				</td>
				<td align="center" width="135px">
					<form id="exit" name="exit" method="post" action="exit_uploadok.jsp" enctype="multipart/form-data" onsubmit="return DoSubmitExit();">
						<label for="exit_image">
							<span class="btn_upload" id="btn_exitupload" style="padding: 0px 0px">���ε�</span>
						</label>
						<input type="file" name="exit_image" id="exit_image" accept="image/*">
							<span style="display:none;" id="exit_imageok"><input type="submit" value="Ȯ��" class="btn_exitok"></span>
					</form>
				</td>
			</tr>
		</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function DoSubmitEnter()
		{
			if(confirm("�����Ͻðڽ��ϱ�?"))
			{
				return true;
			}
			return false;
		}
		function DoSubmitExit()
		{
			if(confirm("�����Ͻðڽ��ϱ�?"))
			{
				$.ajax({
					type : "get",
					url: "loading.jsp",
					dataType: "html",
					success : function(data) 
					{	
						// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
						$("#loading").html(data);
						$('#loading').css('display','none')
						$('#loading').css('width','50px')
						$('#loading').css('display','')
					},
					complete : function(data) 
					{	
						// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
					},
					error : function(xhr, status, error) 
					{
						// ��� ���� �߻���	
					}
				});			
				return true;
			}
			return false;
		}
		$(document).ready(function() {
			$('#enter_image').on('change', function(e) {
				var file = e.target.files[0];
				var reader = new FileReader();
				reader.onload = function() {
					$('#enter_image_preview').html('<img src="' + reader.result + '" style="width:600px; height:600px">');
				}
				reader.readAsDataURL(file);
				$('#btn_enterupload').css('display','none')
				$('#enter_imageok').css('display','')
			});
		
			$('#exit_image').on('change', function(e) {
				var file = e.target.files[0];
				var reader = new FileReader();
				reader.onload = function() {
					$('#exit_image_preview').html('<img src="' + reader.result + '" style="width:600px; height:600px">');
				}
				reader.readAsDataURL(file);
				$('#btn_exitupload').css('display','none')
				$('#exit_imageok').css('display','')
			});
		});
	</script>
	</body>
</html>