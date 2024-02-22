<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>����Ʈ ������ ���� �ý���</title>
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
	font-weight: 400;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color:#fff2a5;
	border: none;
}	
.btn-uploadok 
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-weight: 400;
	cursor: pointer;
	align-items: center;
	justify-content: center;
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
				<td align="center" height="80px" width="600px"><h2>������ ī�޶�</h2></td>
				<td width="100px"></td>
				<td align="center" width="600px"><h2>������ ī�޶�</h2></td>
				<div class="admin" align="right" onclick="document.location.href='main.jsp'">
					<img src="image/admin.png" style="width:100px; height:80px;"><br><font color="white">������ ������</font>
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
					<form id="enter" name="enter" method="post" action="imgdown.jsp" enctype="multipart/form-data">
						<label for="enter_image">
							<span class="btn-upload" style="padding: 0px 0px">���ε�</span>
						</label>
						<input type="file" name="enter_image" id="enter_image" accept="image/*">
							<span style="display:none;" id="enter_imageok"><input type="submit" value="Ȯ��" class="btn-uploadok"></span>
					</form>
				</td>
				<td>
				</td>
				<td align="center" width="135px">
					<form id="exit" name="exit" method="post" action="exitok.jsp" enctype="multipart/form-data" onsubmit="return DoWrite();">
						<label for="exit_image">
							<span class="btn-upload" style="padding: 0px 0px">���ε�</span>
						</label>
						<input type="file" name="exit_image" id="exit_image" accept="image/*">
							<span style="display:none;" class="btn-uploadok" id="exit_imageok"><input type="submit" value="Ȯ��"></span>
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
				$('#enter_imageok').css('display','')
			});
			
			
			
			$('#exit_image').on('change', function(e) {
				var file = e.target.files[0];
				var reader = new FileReader();
				reader.onload = function() {
					$('#exit_image_preview').html('<img src="' + reader.result + '" style="width:600px; height:600px">');
				}
				reader.readAsDataURL(file);
				$('#exit_imageok').css('display','')
			});
		});
	</script>
	</body>
</html>