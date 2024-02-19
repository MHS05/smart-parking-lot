<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>스마트 주차 관리 시스템</title>
	<link rel="stylesheet" type="text/css" href="background.css">
<script>
window.onload=function()
{
	target=document.getElementById('image'); // file 아이디 선언
	target.addEventListener('change',function(){ // change 함수
		
		if(target.value.length){ // 파일 첨부인 상태일경우 파일명 출력
			$('#originName').html("<ins>"+target.files[0].name+"</ins>");
		}else{ //버튼 클릭후 취소(파일 첨부 없을 경우)할때 파일명값 안보이게
			$('#originName').html("");
		}
	});
}
</script>
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
}
.btn-upload 
{	
	width: 130px;
	height: 30px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-weight: 200;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	&:hover 
	{
		background: rgb(77,77,77);
		color: #fff;
	}
}	
#image 
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
		<table border="0" align="center">
			<tr>
				<td align="center" height="80px" width="600px"><h2>입차시 카메라</h2></td>
				<td width="100px"></td>
				<td align="center" width="600px"><h2>출차시 카메라</h2></td>
				<div class="admin" align="right"><a href="main.jsp">
					<img src="image/admin.png" style="width:100px; height:80px"><br><font color="white">관리자페이지</font>
				</a></div>
			</tr>
			<tr>
				<td align="center" height="300px"><img src="image/car_enter.jpg" style="width:600px; height:600px"></td>
				<td><div class="updown"></div></td>
				<td align="center"><img src="image/car_exit.jpg" style="width:600px; height:600px"></td>
			</tr>
			<tr>
				<td align="center" width="135px">
					<label for="image">
					  <span class="btn-upload" style="padding: 0px 0px">업로드</span>
					</label>
					<input type="file" name="image" id="image" accept="image/*">
				</td>
				<td>
				</td>
				<td align="center" width="135px">
					<label for="image">
					  <span class="btn-upload" style="padding: 0px 0px">업로드</span>
					</label>
					<input type="file" name="image" id="image" accept="image/*">
				</td>
			</tr>
		</table>
	</body>
</html>