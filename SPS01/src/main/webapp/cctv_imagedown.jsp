<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../common/common.jsp" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %> 
<%@ page import="sps.vo.*" %> 
<%@ page import="sps.dto.*" %> 
<%
String managecctv = request.getParameter("managecctv");
if( managecctv == null || managecctv.equals(""))
{
	response.sendRedirect("main.jsp");
	return;
}


CctvDTO dto = new CctvDTO();
CctvVO vo  = dto.read(managecctv);
if( vo == null )
{
	response.sendRedirect("main.jsp");
	return;	
}

String cctv = vo.getCctv();

//ÀÌ¹ÌÁö
String imageName = uploadPath + "\\" + cctv;

cctv = URLEncoder.encode(cctv,"utf-8");	//
response.setContentType("application/octet-stream");   //
response.setHeader("Content-Disposition","attachment; filename=" + cctv);	//

File file = new File(imageName);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}

fileIn.close();
ostream.flush();
ostream.close();
%>