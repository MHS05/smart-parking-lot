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
	//�������� ������ �̸����� �����Ѵ�.
	
	//���� �̸� ����
	String orgImage = uploadPath + "\\" + exitpic;
	
	File srcFile    = new File(orgImage);
	
	out.println("���� ���ϸ� : " + orgImage + "<br>");
}

CarinfoVO vo = new CarinfoVO();
vo.setExitpic(exitpic);

CarinfoDTO dto = new CarinfoDTO();
dto.Insert(vo);

response.sendRedirect("main.jsp?cmno="+vo.getCmno());

%>