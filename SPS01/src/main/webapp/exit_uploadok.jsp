<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="./common/common.jsp" %> 
<%@ page import="sps.vo.*" %>
<%@ page import="sps.dto.*" %>   
<%
//���ε尡 ������ �ִ� ���� ũ�⸦ �����Ѵ�.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String exitpic = (String)multi.getFilesystemName("exit_image");

if (exitpic != null)
{
	//������ ������ �̸����� �����Ѵ�.
	
	//���� �̸� ����
	String orgImage = uploadPath + "\\" + exitpic;
	
	File srcFile    = new File(orgImage);
	
	out.println("���� ���ϸ� : " + orgImage + "<br>");
}

ExitVO vo = new ExitVO();
vo.setExitpic(exitpic);

ExitpicDTO dto = new ExitpicDTO();
dto.Insert(vo);

Thread.sleep(10000);

CarinfoDTO cdto = new CarinfoDTO();
String cmno = cdto.exitcarcmno();

response.sendRedirect("camera.jsp?cmno="+cmno);

%>