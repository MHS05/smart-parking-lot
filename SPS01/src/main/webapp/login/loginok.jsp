<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.*" %>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String id = request.getParameter("id"); //�Է¹��� id ���� ������
String pw = request.getParameter("pw"); //�Է¹��� pw ���� ������

if( id == null || pw == null) //id�� ���̰ų� pw�� ���̸�
{
	%>
	<script>
		window.close();
	</script>
	<%
}
%>
<%
AdminDTO dto = new AdminDTO(); //��ü ����
AdminVO  vo  = dto.Login(id,pw); //UserVO�� ���̵�� �н����带 ����
if( vo == null) //UserVO ���� ���̶��
{
	//���̵� ��� Ʋ��
	%>
	<script>
		alert("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.location = "login.jsp";
	</script>
	<%
}else
{
	session.setAttribute("login", vo);
	%>
	<script>
		document.location = "../camera.jsp";
	</script>
	<%
}
%>