<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>스마트 주차장 관리 시스템</title>
	<link rel="stylesheet" type="text/css" href="./css/background.css">
<style>
.btn
{
	width:150px;
	height:60px;
	font-size:1.2em;
}
table
{	
	width:1500px;
	height:780px;
	background-color:white;
	border-radius:15px;
}
.admin
{	
	margin-top:10px;
	margin-right:60px;
	cursor:pointer;
}
.btn-upload 
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
	background-color:#fff2a5;
	border: none;
}	
.btn_enterok, .btn_exitok
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	background-color:#fff2a5;
	border: none;
}	
.btn-upload:hover 
{
	background: rgb(77,77,77);
	color: #fff;
}
#enter_image, #exit_image
{
  	display: none;
}
#enter_imageok
{	
	align:center;
}
a
{
	text-decoration-line: none;
	color : black;
}
</style>
	</head>
	<body>
		<table border="0" align="center" style="opacity: 0.93;">
			<tr>
				<td align="center" height="80px" width="600px"><h2>입차시 카메라</h2></td>
				<td width="100px"></td>
				<td align="center" width="600px"><h2>출차시 카메라</h2></td>
				<div class="admin" align="right">
					<a href="main.jsp"><img src="image/admin.png" style="width:100px; height:80px;"><br><font color="white">관리자 페이지</font></a>
				</div>
			</tr>
			<tr>
				<td align="center" height="300px">
					<div id="enter_image_preview">
						<img src="image/icon_enter_car.png" style="width:600px; height:600px">
					</div>
				</td>
				<td>
				</td>
				<td align="center">
					<div id="exit_image_preview">
						<img src="image/icon_exit_car.png" style="width:600px; height:600px">
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" width="135px">
					<form id="enter" name="enter" method="post" action="enter_uploadok.jsp" enctype="multipart/form-data">
						<label for="enter_image">
							<span class="btn-upload" id="btn-enterupload" style="padding: 0px 0px">업로드</span>
						</label>
						<input type="file" name="enter_image" id="enter_image" accept="image/*">
							<span style="display:none;" id="enter_imageok"><input type="submit" value="확인" class="btn_enterok"></span>
					</form>
				</td>
				<td>
				</td>
				<td align="center" width="135px">
					<form id="exit" name="exit" method="post" action="exit_uploadok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
						<label for="exit_image">
							<span class="btn-upload" id="btn-exitupload" style="padding: 0px 0px">업로드</span>
						</label>
						<input type="file" name="exit_image" id="exit_image" accept="image/*">
							<span style="display:none;" id="exit_imageok"><input type="submit" value="확인" class="btn_exitok"></span>
					</form>
				</td>
			</tr>
		</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#enter_image').on('change', function(e) {
				var file = e.target.files[0];
				var reader = new FileReader();
				reader.onload = function() {
					$('#enter_image_preview').html('<img src="' + reader.result + '" style="width:600px; height:600px">');
				}
				reader.readAsDataURL(file);
				$('#btn-enterupload').css('display','none')
				$('#enter_imageok').css('display','')
			});
			
			
			
			$('#exit_image').on('change', function(e) {
				var file = e.target.files[0];
				var reader = new FileReader();
				reader.onload = function() {
					$('#exit_image_preview').html('<img src="' + reader.result + '" style="width:600px; height:600px">');
				}
				reader.readAsDataURL(file);
				$('#btn-exitupload').css('display','none')
				$('#exit_imageok').css('display','')
			});
		});
	</script>
	</body>
</html>