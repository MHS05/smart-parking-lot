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

String enterpic = (String)multi.getFilesystemName("enter_image");

if (enterpic != null)
{
	//������ ������ �̸����� �����Ѵ�.
	
	//���� �̸� ����
	String orgImage = uploadPath + "\\" + enterpic;
	
	File srcFile    = new File(orgImage);
	
	out.println("���� ���ϸ� : " + orgImage + "<br>");
}

CarinfoVO vo = new CarinfoVO();
vo.setEnterpic(enterpic);

CarinfoDTO dto = new CarinfoDTO();
dto.Insert(vo);

response.sendRedirect("camera.jsp");

%>