<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
String cmno = request.getParameter("cmno");
if( cmno == null || cmno.equals("") )
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

int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
int timecal = exit_enter / 30;
int payamount = timecal * 600;

//���� ���ڸ� �� ���� ,
DecimalFormat formatter = new DecimalFormat("#,###");
String comma = formatter.format(timecal);

//�����ݾ׿� ���� ���� �ݾ� 
int insert_money = 0;

if(payamount == 0){
	insert_money = 0;
}else if(payamount > 0 && payamount <= 1000){
	insert_money += 1000;
}else if(payamount > 1000 && payamount <= 5000){
	insert_money += 5000;
}else if(payamount > 5000 && payamount <= 10000){
	insert_money += 10000;
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���� ����</title>
<style>
.next_btn
{
	width:150px;
	height:50px;
	font-size:1.3em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
	margin-top:20px;
}
</style>
	</head>
	<body>
		<div align="center"><h1>&lt;���� ����&gt;</h1></div>
		<div align="center"><h1>�����Ͻ� �ݾ��� �־��ּ���</h1></div>
		<div align="center"><img src="../image/cashinsert.png" style="width:400px; height:300px;"></div>
		<div align="center"><hr style="width:300px"></div><br>
		<%
		//���� ������ ���
		if(!vo.getEntertime().equals(vo.getExittime()))
		{ 	//�����ð� 10�� �̸��� ���
			if(exit_enter < 10)
			{
			%>
				<div align="center"><h2>���� ��� : 0��<br><br>������ �ݾ� : 0��</h2></div>
			<%
			}
			//�����ð� 10�� �̻� 30�� �̸��� ���
			else if(10 <= exit_enter && exit_enter < 30)
			{
			%>
				<div align="center"><h2>���� ��� : 600��<br><br>������ �ݾ� : <%= insert_money %>��</h2></div>
			<%
			}
			//�����ð� 30�� �̻��� ���
			else
			{
			%>
				<div align="center"><h2>���� ��� : <%= payamount %>��<br><br>������ �ݾ� : <%= insert_money %>��</h2></div>
			<%
			}
		} 
		%>
		<div align="center"><a href="pay_cashok.jsp?cmno=<%=cmno%>"><input type="button" value="����" class="next_btn"></a></div>
	</body>
</html>