<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
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
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����Ʈ ������ ���� �ý���</title>
		<link rel="stylesheet" type="text/css" href="../css/sps.css">
		<link rel="stylesheet" type="text/css" href="../css/background.css">
<style>
.fee_table
{
	width:1000px;
	height:800px;
	background-color:white;
	opacity:0.9;
	border-radius:15px;
	margin: 0 auto;
	margin-top:30px;
	text-align:center;
}
.fee_table01
{
	width:400px;
	height:350px;
	border-collapse:collapse;
	margin: 0 auto;
}
.pay_btn
{
	width:150px;
	height:80px;
	font-size:1.3em;
	font-weight:bold;
	border-radius: 15px;
	border: none;
	cursor:pointer;
	background-color:#fff2a5;
}
.marquee
{	
	height:50px;
	font-size:1.4em;
	font-weight:bold;
}
</style>
	</head>
	<body>
		<table class="fee_table" border="0">
			<tr>
				<td colspan="3"><h1>���� �����</h1></td>
			</tr>
			<tr>
				<td class="marquee" colspan="3"><MARQUEE><%= vo.getCarnum() %> ���� ���� �������� �̿����ּż� �����մϴ�.</MARQUEE></td>
			</tr>
			<tr>
				<td>
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
								<span id="span2"><font size="4"><b>��������</b></font></span>
								<a href="javascript:openinfo();"><font size="6" color="#2ecc71"><b><%= vo.getCarnum() %></b></font></a>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left">&emsp;<font size="4">�����ð� :<%= vo.getExittime() %> <br><br>&emsp;�����ð� :<%= vo.getEntertime() %> </font><br><br>
							 <% 
								int time = Integer.parseInt(dto.timeDiff(cmno));
								if(time < 60)
								{
									%><font size="6">&emsp;&emsp;00�� 00�ð� <%= dto.timeDiff(cmno) %>��</font><%
								} else
								{
									int hour = time / 60;
									int min  = time - (hour * 60);
									%><font size="6">&emsp;&emsp;00�� <%= hour %>�ð� <%= min %>��</font><%
								}
							%>
							</td>
						</tr>
					</table>
				</td>
				<td width="50px"></td>
				<td>
					<table class="fee_table01" border="1">
						<tr style="background-color:#fff2a5">
							<td align="center" height="100px">
								<span id="span2"><font size="4"><b>�������</b></font></span>
								<%
									if(time < 30)
									{
										%><font size="6" color="#2ecc71"><b>600��</b></font><%
									} else
									{
									 	int timecal = time / 30;
										timecal = timecal * 600;
										%><font size="6" color="#2ecc71"><b><%= timecal %>��</b></font><%
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left">&emsp;<font size="4">������� :<%= vo.getPayamount() %> <br><br><br>&emsp;������� : <%= vo.getPayamount() %></font></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="parkingfee02.jsp?cmno=<%= cmno %>"><input type="button" value="�����ϱ�" class="pay_btn"></a>
				</td>
			</tr>
		</table>
	</body>
</html>