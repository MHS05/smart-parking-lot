<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>스마트 주차장 관리 시스템</title>
<script>
function EnterList()
		{
			$.ajax({
				type : "get",
				url: "table03.jsp",
				dataType: "html",
				success : function(data) 
				{	
					// 통신이 성공적으로 이루어졌을때 이 함수를 타게된다.
					$("#table03").html(data);
				}
			});				
		}
</script>
	</head>
	<body>
		<table border="1" style="width:1000px" align="center">
			<tr>
				<td width="500px" valign="top" id="table03">
					이곳에 목록이 표시됩니다.			
				</td>
			</tr>
		</table>
	</body>
</html>