<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
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
</style>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>����Ʈ ������ ���� �ý���</title>
	<link rel="stylesheet" type="text/css" href="css/sps.css">
	<link rel="stylesheet" href="css/jquery-ui.css">

</head>
	<body>
		<!-- ��� ���� ���� -->
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
				<td align="center"><a href="javascript:EnterList();"><button class=btn>���� ��Ȳ</button></a></td>
				<td align="center"><a href="javascript:ExitList();"><button class=btn>���� ��Ȳ</button></a></td>
				<td align="center"><a href="javascript:PayList();"><button class=btn>���� ����</button></a></td>
				<td align="center"><a href="javascript:ParkingMap();"><button class=btn>������ ��</button></a></td>
				<td align="center"><a href="javascript:SearchCar();"><button class="btn" id="carsearch" onclick="carSearch();">���� �˻�</button></a>
				<div id="searchinput" align="right" style="position:absolute; margin-top:20px;">
		        	<input type="text" id="key" name="key" value="" placeholder="���� ��ȣ �Է�">
			        <button onclick="doSearch();">�˻�</button>
	     		</div>
			</tr>
		</table>
		<!-- ��� ���� �� -->
		<table border="0" width="1400px" height="720px" align="center">
			<tr>
				<td width="500px" align="center" id="leftside">
					<table class="table01" border="1">
						<tr>
							<th class="th1" colspan="4">����</th>
						</tr>
						<tr>
							<td class="td1">�Ϲ�</td>
							<td class="td1">ȸ��</td>
							<td class="td1">��������</td>
							<td class="td1">�հ�</td>
						</tr>
						<tr>
							<td height="30px">10</td>
							<td>10</td>
							<td>5</td>
							<td>25</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
						<tr>
							<th class="th1" colspan="4">��������</th>
						</tr>
						<tr>
							<td class="td1">����</td>
							<td class="td1">�Ǽ�</td>
							<td class="td1" colspan="2">�ݾ�</td>
						</tr>
						<tr>
							<td height="30px">����</td>
							<td>9</td>
							<td colspan="2">1,150,000 ��</td>
						</tr>
						<tr>
							<td height="30px">ī��</td>
							<td>15</td>
							<td colspan="2">2,800,000 ��</td>
						</tr>
						<tr>
							<td height="30px">�հ�</td>
							<td>24</td>
							<td colspan="2">3,950,000 ��</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
						<tr>
							<th class="th1" colspan="4">������ ����Ʈ</th>
						</tr>
			
						<tr>
							<td class="td1">������ȣ</td>
							<td class="td1">�ð�</td>
							<td class="td1" colspan="2">��������</td>
						</tr>
						<tr>
							<td height="30px">61�� 1234</td>
							<td>2019-01-01 00:00</td>
							<td colspan="2">����</td>
						</tr>
						<tr>
							<td height="30px">61�� 1234</td>
							<td>2019-01-01 00:00</td>
							<td colspan="2">����</td>
						</tr>
					</table>
				</td>
				<td width="800px" align="center" id="rightside">
					<table border="0" align="center" width="800px">
						<tr>
							<td height="40px">���� ���� ���� ���� ��</td>
							<td width="20px"></td>
							<td height="40px">���� ������ �ڸ� ��</td>
						</tr>
						<tr>
							<td height="80px" style="background-color:#e0e0e0">10��</td>
							<td></td>
							<td height="80px" style="background-color:#e0e0e0">20�ڸ�</td>
						</tr>
						<tr>
							<td height="10px"></td>
						</tr>
						<tr>
							<td colspan="3" height="250px" style="background-color:#e0e0e0">������ ��</td>
						</tr>
						<tr>
							<td colspan="3"><hr></td>
						</tr>
						<tr>
							<td colspan="3" height="250px" style="background-color:#e0e0e0">������ CCTV</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
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

function EnterList()
{
	$.ajax({
		type : "get",
		url: "enterlist.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#leftside").html(data);
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
function ExitList()
{
	$.ajax({
		type : "get",
		url: "exitlist.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#leftside").html(data);
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
function PayList()
{
	$.ajax({
		type : "get",
		url: "paylist.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#leftside").html(data);
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
function ParkingMap()
{
	$.ajax({
		type : "get",
		url: "parkingmap.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#rightside").html(data);
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
function SearchCar()
{
	$.ajax({
		type : "get",
		url: "searchcar.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#rightside").html(data);
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
	</body>
</html>