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
var bar1 = new ldBar("#myItem1"); // �ε� �� �ν��Ͻ� ����
var bar2 = document.getElementById('myItem1').ldBar; // ��ҿ� ����� �ε� �� �ν��Ͻ�

var totalTime = 40000; // �� �ð� (40��)
var totalFrames = 100; // �� ������ ��

var currentFrame = 0; // ���� ������

var interval = setInterval(function() {
    // �ε� ���� ���� ������Ű��
    bar1.set((currentFrame / totalFrames) * 100);

    // ���� ������ ����
    currentFrame++;

    // ���� �������� �� ������ ���� ���ų� ũ�� ���͹� ����
    if (currentFrame >= totalFrames) {
        clearInterval(interval);
    }
}, totalTime / totalFrames); // �� ������ ���� ���
</script>
	</body>
</html>