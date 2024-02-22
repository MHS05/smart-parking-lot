<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../common/common.jsp" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %> 
<%@ page import="sps.vo.*" %> 
<%@ page import="sps.dto.*" %> 
<%
String cmno = request.getParameter("cmno");
if( cmno == null || cmno.equals(""))
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

String enterpic = vo.getEnterpic();

//ÀÌ¹ÌÁö
String imageName = uploadPath + "\\" + enterpic;

enterpic = URLEncoder.encode(enterpic,"utf-8");	//
response.setContentType("application/octet-stream");   //
response.setHeader("Content-Disposition","attachment; filename=" + enterpic);	//

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