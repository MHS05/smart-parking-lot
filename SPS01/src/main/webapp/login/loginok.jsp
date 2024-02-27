<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.*" %>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String id = request.getParameter("id"); //입력받은 id 값을 가져옴
String pw = request.getParameter("pw"); //입력받은 pw 값을 가져옴

if( id == null || pw == null) //id가 널이거나 pw가 널이면
{
	%>
	<script>
		window.close();
	</script>
	<%
}
%>
<%
AdminDTO dto = new AdminDTO(); //객체 생성
AdminVO  vo  = dto.Login(id,pw); //UserVO에 아이디와 패스워드를 넣음
if( vo == null) //UserVO 값이 널이라면
{
	//아이디 비번 틀림
	%>
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
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