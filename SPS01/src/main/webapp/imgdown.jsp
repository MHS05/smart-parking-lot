<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./common/common.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="sps.vo.*" %>
<%@ page import="sps.dto.*" %>   
<%
String no = request.getParameter("no");
if( no == null || no.equals("") )
{
	response.sendRedirect("main.jsp");
	return;
}

TestDTO dto = new TestDTO();
TestVO  vo  = dto.Read(no);
if( vo == null )
{
	response.sendRedirect("main.jsp");
	return;	
}

//ÀÌ¹ÌÁö
String image    = vo.getImage();
String phyimage = vo.getPhyimage();

String imageName = uploadPath + "\\" + phyimage;

image = URLEncoder.encode(image,"utf-8");	//
response.setContentType("application/octet-stream");   //
response.setHeader("Content-Disposition","attachment; filename=" + image);	//

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