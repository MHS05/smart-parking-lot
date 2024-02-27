<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
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
<table class="table05">
	<tr>
		<td rowspan="3" width="50px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
						<span id="span1"><font size="4"><b>차량정보</b></font></span>
						<a href="javascript:openinfo();"><font size="6" color="red"><b><%= vo.getCarnum() %></b></font></a>
					</td>
				</tr>
				<tr>
					<%
						if( vo.getExittime() != null )
						{
							%>
								<td colspan="2" style="text-align:left">&emsp;<font size="4">출차시간 : <%= vo.getExittime() %><br><br>&emsp;입차시간 : <%= vo.getEntertime() %></font><br><br>
							<%
						} else {
							
							%>
								<td colspan="2" style="text-align:left">&emsp;<font size="4">출차시간 : <br><br>&emsp;입차시간 : <%= vo.getEntertime() %></font><br><br>
							<%
						}
						//출차안했을때 '입차시간 ~ 현재시간' 계산
						int time = Integer.parseInt(dto.timeDiff(cmno));
						if(time < 60)
						{
							%><font size="6">&emsp;&emsp;00일 00시간 <%= dto.timeDiff(cmno) %>분</font><%
						} else
						{
							int hour = time / 60;
							int min  = time - (hour * 60);
							%><font size="6">&emsp;&emsp;00일 <%= hour %>시간 <%= min %>분</font><%
						}
						//출차 했을때 '입차시간 ~ 출차시간' 구해야함
					%>
					</td>
				</tr>
			</table>
		</td>
		<td width="90px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
						<span id="span2"><font size="4"><b>주차요금</b></font></span>
						<%
						
						
							if(vo.getExittime() != null)
							{ //출차 했을때 요금
									int exittime = Integer.parseInt(dto.exittimeDiff(cmno));
									if(exittime < 30)
									{
										%><font size="6" color="#2ecc71"><b>600원</b></font>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:left">&emsp;<font size="4">주차요금 : 600원<br><br><br>&emsp;결제요금 : 600원</font></td>
									</tr>
										<%
									} else
									{
									 	int timecal = exittime / 30;
										timecal = timecal * 600;
										%><font size="6" color="#2ecc71"><b><%= timecal %>원</b></font>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:left">&emsp;<font size="4">주차요금 : <%= timecal %>원<br><br><br>&emsp;결제요금 : <%= timecal %>원</font></td>
									</tr>
										<%
									}
							} else 
							{ //출차 안했을때 요금
								if(time < 30)
								{
									%><font size="6" color="#2ecc71"><b>600원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:left">&emsp;<font size="4">주차요금 : 600원<br><br><br>&emsp;결제요금 : </font></td>
								</tr>
									<%
								} else
								{
								 	int timecal = time / 30;
									timecal = timecal * 600;
									%><font size="6" color="#2ecc71"><b><%= timecal %>원</b></font>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:left">&emsp;<font size="4">주차요금 : <%= timecal %>원<br><br><br>&emsp;결제요금 : </font></td>
								</tr>
									
									<%
								}
							}
						%>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="3" height="30px"></td>
	</tr>
	<tr>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td height="100px" align="center"><font size="5"><b>입차시 사진</b></font></td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="imgList">
					<%
					if( vo.getEnterpic() != null)
					{
					%>
						<img style="width:400px;height:240px;" src="enter_imagedown.jsp?cmno=<%= cmno %>"><br>
					<%
					}
					else
					{
					%>
						<div>출차 사진 X</div>
					<%
					}
					%>
					</td>
				</tr>
			</table>
		</td>
		<td width="50px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td height="100px" align="center"><font size="5"><b>출차시 사진</b></font></td>
				</tr>
				<tr>
					<td colspan="2" align="center" id="imgList">
					<%
					if( vo.getExitpic() != null)
					{
					%>
						<img style="width:400px; height:240px;" src="exit_imagedown.jsp?cmno=<%= cmno %>"><br>
					<%
					}
					else
					{
					%>
						<div>출차 사진 X</div>
					<%
					}
					%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>