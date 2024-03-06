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
//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,
		"euc-kr",new DefaultFileRenamePolicy());

String cctv_image = (String)multi.getFilesystemName("cctv_image");


if (cctv_image != null)
{
	//논리명을 물리명 이름으로 변경한다.
	
	//파일 이름 변경
	String orgImage = uploadPath + "\\" + cctv_image;
	
	File srcFile    = new File(orgImage);
	
	out.println("원래 파일명 : " + orgImage + "<br>");
}

CctvVO vo = new CctvVO();
vo.setCctv(cctv_image);
vo.setTotalspace("29");
CctvDTO dto = new CctvDTO();
dto.Insert(vo);
Thread.sleep(5000);


response.sendRedirect("main.jsp?managecctv=" + vo.getManagecctv());

%>