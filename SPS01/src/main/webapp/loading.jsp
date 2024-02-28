<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/loading-bar.css"/> 
		<script type="text/javascript" src="js/loading-bar.js"></script>
	</head>
	<body>
		<div id="myItem1" class="IdBar" style="width:400px; height:50px; margin-top:400px; z-index:9000;"></div>
<script>
var bar1 = new ldBar("#myItem1"); // 로딩 바 인스턴스 생성
var bar2 = document.getElementById('myItem1').ldBar; // 요소에 저장된 로딩 바 인스턴스

var totalTime = 40000; // 총 시간 (40초)
var totalFrames = 100; // 총 프레임 수

var currentFrame = 0; // 현재 프레임

var interval = setInterval(function() {
    // 로딩 바의 값을 증가시키기
    bar1.set((currentFrame / totalFrames) * 100);

    // 현재 프레임 증가
    currentFrame++;

    // 현재 프레임이 총 프레임 수와 같거나 크면 인터벌 중지
    if (currentFrame >= totalFrames) {
        clearInterval(interval);
    }
}, totalTime / totalFrames); // 각 프레임 간격 계산
</script>
	</body>
</html>