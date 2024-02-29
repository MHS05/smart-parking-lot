<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
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
//출차시간 - 입차시간 = 주차시간 
int exit_enter = Integer.parseInt(dto.Exit_Enter(cmno));
int timecal = exit_enter / 30;
timecal = timecal * 600;

//숫자 세자리 수 마다 , 찍고 payamount로 이름 변경
DecimalFormat formatter = new DecimalFormat("#,###");
String payamount = formatter.format(timecal);

int hour = exit_enter / 60;
int min  = exit_enter - (hour * 60);
int day  = hour / 24;
%>
<style>
font
{
	text-align:center;
}
</style>
<table class="table05">
	<tr>
		<td rowspan="3" width="50px"></td>
		<td>
			<table class="table05_1" border="1">
				<tr style="background-color:#3498db">
					<td align="center" height="100px">
						<span id="span1"><font size="4"><b>차량정보</b></font></span>
						<a href="javascript:openinfo();">
						<font size="6" color="red"><b><%= vo.getCarnum() %></b></font></a>
					</td>
				</tr>
				<tr>
					<%
					//출차 X 안했을 경우
					if( vo.getExitpic() == null )
					{
					%>
						<td colspan="2">
							<font size="4">
							입차시간 : <%= vo.getEntertime() %><br><br>
							출차시간 : x
							</font><br><br>
					<%
					}
					//출차 O 했을 경우
					else 
					{	
					%>
						<td colspan="2">
							<font size="4">
							입차시간 : <%= vo.getEntertime() %><br><br>
							출차시간 : <%= vo.getExittime() %>
							</font><br><br>
					<%
					}
					//출차 X 안했을 경우(Now_Enter) '현재시간 - 입차시간 = 주차시간' 
					int now_enter = Integer.parseInt(dto.Now_Enter(cmno));
					
					if( vo.getExitpic() == null )
					{	//60분 미만일 경우
						if(now_enter < 60)
						{
						%>
							<font size="6">0일 0시간 <%= dto.Now_Enter(cmno) %>분</font>
						<%
						}
						//60분 이상일 경우
						else
						{	
						%>
							<font size="6"><%= day %>일 <%= hour %>시간 <%= min %>분</font>
						<%
						}
					}
					%>
					<%
					//출차 O 했을 경우 '출차시간 - 입차시간 = 주차시간'
					if( vo.getExitpic() != null )
					{	//60분 미만일 경우 분만 표현
						if(exit_enter < 60)
						{
						%>
							<font size="6">0일 0시간 <%= dto.Exit_Enter(cmno) %>분</font>
						<%
						}
						//60분 이상일 경우 날짜, 시간, 분 표현
						else
						{
						%>	
							<font size="6"><%= day %>일 <%= hour %>시간 <%= min %>분</font>
						<%
						} 
					}
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
					//출차 X 안했을때 요금
					if( vo.getExitpic() == null )
					{ 	//주차시간 10분 미만일 경우
						if(now_enter < 10)
						{
						%>
							<font size="6" color="#2ecc71"><b>0원</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">주차요금 : 0원<br><br>결제요금 : </font></td>
						</tr>
						<%
						}
						//주차시간 30분 미만일 경우
						if(now_enter < 30)	
						{
						%>
							<font size="6" color="#2ecc71"><b>600원</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">주차요금 : 600원<br><br>결제요금 : </font></td>
						</tr>
						<%
						}
						//주차시간 30분 이상일 경우
						else 
						{
							%>
							<font size="6" color="#2ecc71"><b><%= payamount %>원</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">주차요금 : <%= payamount %>원<br><br>결제요금 : </font></td>
						</tr>
						<%
						}
					}
					%>
					<%
					//출차 O 했을때 요금
					if(vo.getExitpic() != null)
					{ 	//주차시간 10분 미만일 경우
						if(exit_enter < 10)
						{
						%>
							<font size="6" color="#2ecc71"><b>0원(회차)</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">주차요금 : 0원<br><br>결제요금 : 0원</font></td>
						</tr>
						<%
						}
						//주차시간 10분 이상 30분 미만일 경우
						else if(10 <= exit_enter && exit_enter < 30)
						{
						%>
							<font size="6" color="#2ecc71"><b>600원</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">주차요금 : 600원<br><br>결제요금 : 600원</font></td>
						</tr>
						<%
						}
						//주차시간 30분 이상일 경우
						else
						{
						%>
							<font size="6" color="#2ecc71"><b><%= payamount %>원</b></font>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<font size="5">주차요금 : <%= payamount %>원<br><br>결제요금 : <%= payamount %>원</font></td>
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