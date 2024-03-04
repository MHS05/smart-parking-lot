<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%
String cmno = request.getParameter("cmno");

CarinfoDTO dto = new CarinfoDTO();
CarinfoVO vo  = dto.Read(cmno);

int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));

//�������
dto.UpdatePayamount(vo);

int payamountInt = Integer.parseInt(vo.getPayamount());


//�����ݾ׿� ���� ���� �ݾ� 
int insert_money = 0;

if(payamountInt == 0){
	insert_money = 0;
}else if(payamountInt > 0 && payamountInt <= 1000){
	insert_money += 1000;
}else if(payamountInt > 1000 && payamountInt <= 5000){
	insert_money += 5000;
}else if(payamountInt > 5000 && payamountInt <= 10000){
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
				<div align="center"><h2>���� ��� : <%= payamountInt %>��<br><br>������ �ݾ� : <%= insert_money %>��</h2></div>
			<%
			}
			//�����ð� 30�� �̻��� ���
			else
			{
			%>
				<div align="center"><h2>���� ��� : <%= payamountInt %>��<br><br>������ �ݾ� : <%= insert_money %>��</h2></div>
			<%
			}
		} 
		%>
		<div align="center"><a href="pay_cashok.jsp?cmno=<%=cmno%>&paymethod=cash"><input type="button" value="����" class="next_btn"></a></div>
	</body>
</html>