<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
.btn
{
	width:150px;
	height:45px;
	font-size:1.2em;
	font-weight:bold;
	background-color:skyblue;
	border-radius: 15px;
	border: none;
	cursor:pointer;
}
.btn_logout
{
	width:120px;
	height:30px;
	font-size:1.1em;
	font-weight:bold;
	border-radius: 15px;
	margin-right: 10px;
}
#datepicker
{
	width:160px;
	height:80px;
	font-size:30;
	font-weight:bold;
	border:none;
	background:transparent;
	cursor:pointer;
}
#searchinput 
{
    display: none;
}
#key
{
	width:170px;
	height: 30px;
	font-size:1.1em;
}
a
{
	text-decoration-line: none;
	color : black;
}
</style>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>����Ʈ ������ ���� �ý���</title>
	<link rel="stylesheet" href="css/jquery-ui.css">
	<script src="js/jquery-3.7.1.js"></script>
	<script src="js/jquery-ui.js"></script>
<script>
window.onload = function()
{
	$("#key").keyup(function (event)
		{	
			if (event.keyCode == 13)
			{
				doSearch();
			}
			
		});
}
$(function() {
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeYear: true,
        changeMonth: true,
        showOn: "both",
        buttonImageOnly: true,
        buttonText: "",
        monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
        monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
        dayNamesMin: ['��','��','ȭ','��','��','��','��'],
        dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'],
        minDate: "-5Y",
        maxDate: "+today"               
    });    
    
    // �ʱⰪ�� ���� ��¥�� ����
    $('#datepicker').datepicker('setDate', 'today');
});
function carSearch() {
    var searchinput = document.getElementById('searchinput');
    if (searchinput.style.display == 'none') {
        searchinput.style.display = 'block';
    } else {
        searchinput.style.display = 'none';
    }
}
function doSearch() 
{
}
function EnterList()
{
	$.ajax({
		type : "get",
		url: "table03.jsp,
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#table03").html(data);
		},
		complete : function(data) 
		{	
			// ����� �����ϰų� �����߾ �� �Լ��� Ÿ�Եȴ�.
		},
		error : function(xhr, status, error) 
		{
			// ��� ���� �߻���	
		}
	});			
}
</script>
</head>
	<body>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:#e0e0e0">
			<tr>
				<td width="80px" height="65px">
					<a href="main.jsp"><img style="width:80px; height:60px;" src="image/logo.png"></a>
				</td>
				<td width="400px" style="text-align:left"><font size="5"><b><a href="main.jsp">����Ʈ ������ ���� �ý���</a></b></font></td>
				<td width="200px"></td>
				<td colspan="6" align="right" style="text-align:right"><button class=btn_logout>�α׾ƿ�</button></td>
			</tr>
		</table>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:3498db">
			<tr>
				<td align="center"><img src="image/calender.png" style="width:60px; height:60px"></td>
				<td><input type="text" id="datepicker"></td>
				<td width="200px"></td>
				<td align="center"><button class=btn onclick="location.href='camera.jsp'">������ ī�޶�</button></td>
				<td align="center"><a href="javascript:EnterList();">���� ��Ȳ</a></td>
				<!-- <td align="center"><div class=btn onclick="EnterList();">���� ��Ȳ</div></td> -->
				<!-- <td align="center"><button class=btn onclick="EnterList();">���� ��Ȳ</button></td> -->
				<td align="center"><button class=btn>���� ��Ȳ</button></td>
				<td align="center"><button class=btn>���� ����</button></td>
				<td align="center"><button class=btn>������ ��</button></td>
				<td align="center"><button class="btn" id="carsearch" onclick="carSearch();">���� �˻�</button>
				<div id="searchinput" align="right" style="position:absolute; margin-top:20px;">
		        	<input type="text" id="key" name="key" value="" placeholder="���� ��ȣ �Է�">
			        <button onclick="doSearch();">�˻�</button>
	     		</div>
			</tr>
		</table>
