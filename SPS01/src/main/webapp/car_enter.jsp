<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����Ʈ ������ ���� �ý���</title>
<script>
function EnterList()
		{
			$.ajax({
				type : "get",
				url: "table03.jsp",
				dataType: "html",
				success : function(data) 
				{	
					// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
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
					�̰��� ����� ǥ�õ˴ϴ�.			
				</td>
			</tr>
		</table>
	</body>
</html>