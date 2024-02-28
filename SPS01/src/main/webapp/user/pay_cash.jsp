<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");
if( cmno == null || cmno.equals("") )
{
	response.sendRedirect("main.jsp");
	return;
}

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);
if( vo == null )
{
	response.sendRedirect("main.jsp");
	return;	
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���� ����</title>
<style>
.next_btn
{
	width:150px;
	height:50px;
	font-size:1.3em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
	margin-top:20px;
}
</style>
	</head>
	<body>
		<div align="center"><h1>&lt;���� ����&gt;</h1></div>
		<div align="center"><h1>�����Ͻ� �ݾ��� �־��ּ���</h1></div>
		<div align="center"><img src="../image/cashinsert.png" style="width:400px; height:300px;"></div>
		<div align="center"><hr style="width:300px"></div><br>
		<div align="center"><h2>���� ��� : <%= vo.getPayamount() %><br><br>������ �ݾ� : 20,000��</h2></div>
		<div align="center"><a href="pay_cashok.jsp"><input type="button" value="����" class="next_btn"></a></div>
	</body>
</html>