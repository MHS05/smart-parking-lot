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

String exitpic = (String)multi.getFilesystemName("exit_image");

if (exitpic != null)
{
	//논리명을 물리명 이름으로 변경한다.
	
	//파일 이름 변경
	String orgImage = uploadPath + "\\" + exitpic;
	
	File srcFile    = new File(orgImage);
	
	out.println("원래 파일명 : " + orgImage + "<br>");
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