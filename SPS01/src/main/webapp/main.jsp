<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%
/*
CarinfoVO vo = new CarinfoVO();
vo.setEntertime(vo.getEntertime());
String date = vo.EntertimeAsDate();
*/

String date = "2024-02-28";

ListDTO dto = new ListDTO();

ArrayList<CarinfoVO> list = new ArrayList<CarinfoVO>();

list = dto.getCarInfoList("2024-02-28");

%>
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
				<td colspan="6" align="right" style="text-align:right">
				<button class=btn_logout onclick="document.location.href='./login/login.jsp'">�α׾ƿ�</button></td>
			</tr>
		</table>
		<table border="0" width="1500px" height="75px" align="center" style="background-color:3498db">
			<tr>
				<td align="center"><img src="image/calender.png" style="width:60px; height:60px"></td>
				<td><input type="text" id="datepicker"></td>
				<td width="200px"></td>
				<td align="center"><a href="camera.jsp"><button class=btn>������ ī�޶�</button></a></td>
				<td align="center"><a href="javascript:EnterList();"><button class=btn>���� ��Ȳ</button></a></td>
				<td align="center"><a href="javascript:ExitList();"><button class=btn>���� ��Ȳ</button></a></td>
				<td align="center"><a href="javascript:PayList();"><button class=btn>���� ����</button></a></td>
				<td align="center"><a href="javascript:ParkingMap();"><button class=btn>������ ��</button></a></td>
				<td align="center"><button class="btn" id="carsearch" onclick="carSearch();">���� �˻�</button>
				<div id="searchinput" align="right" style="position:absolute; margin-top:20px;">
		        	<input type="text" id="carnumber" name="carnumber" value="" placeholder="���� ��ȣ �Է�">
			        <button onclick="SearchCar()"><font size="3">�˻�</font></button></a>
	     		</div>
			</tr>
		</table>
		<!-- ��� ���� �� -->
		<table border="0" align="center" style="width:1400px; height:600px;">
			<tr>
				<td width="550px" height="700px;" align="center" id="leftside">
					<table class="table01" border="1">
						<tr>
							<th class="th1" colspan="3">����</th>
						</tr>
						<tr>
							<td class="td1">�Ϲ�</td>
							<td class="td1">ȸ��</td>
							<td class="td1">�հ�</td>
						</tr>
						<tr>
							<td height="30px">10</td>
							<td>10</td>
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
					</table>
					<div style="height:220px; overflow: scroll;">
						<table class="table01_1" border="1">
							<tr>
								<th class="th1_1" colspan="4">������ ����Ʈ</th>
							</tr>
				
							<tr>
								<td class="td1_1" width="70px">������ȣ</td>
								<td class="td1_1" width="300px">�ð�</td>
								<td class="td1_1" width="70px" colspan="2">��������</td>
							</tr>
							<tr>
								<td height="40px">�����ð�</td>
								<td>�����ð�</td>
								<td colspan="2">����</td>
							</tr>
							<tr>
								<td height="40px">����ȣ</td>
								<td>�����ð�</td>
								<td colspan="2">����</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="800px" align="center" id="rightside">
					<table border="0" align="center" width=800px;>
						<tr>
							<td width="100px" height="30px"><font size="4"><b>�� ���� �ڸ� ��</b></font></td>
							<td width="20px"></td>
							<td width="100px" height="30px"><font size="4"><b>���� ���� ���� ���� ��</b></font></td>
							<td width="20px"></td>
							<td width="100px" height="30px"><font size="4"><b>���� ������ �ڸ� ��</b></font></td>
						</tr>
						<tr>
							<td height="80px" style="background-color:#e0e0e0"><font size="5"><b>30��</b></font></td>
							<td></td>
							<td height="80px" style="background-color:#e0e0e0"><font size="5" color="red"><b>10��</b></font></td>
							<td></td>
							<td height="80px" style="background-color:#e0e0e0"><font size="5" color="green"><b>20�ڸ�</b></font></td>
						</tr>
						<tr>
							<td height="10px"></td>
						</tr>
						<tr>
							<td colspan="5" height="550px" style="background-color:#e0e0e0">������ CCTV</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
<script src="./js/jquery-3.7.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<script>
window.onload = function()
{
	$("#carnumber").keyup(function (event)
		{	
			if (event.keyCode == 13)
			{
				SearchCar();
			}
			
		});
}

function carSearch() {
    var searchinput = document.getElementById('searchinput');
    if (searchinput.style.display == 'none') {
        searchinput.style.display = 'block';
    } else {
        searchinput.style.display = 'none';
    }
}

function SearchCar()
{
	carnumber = $("#carnumber").val();
	$.ajax({
		type : "get",
		data : { cmno : carnumber },
 		url: "searchcar.jsp",
		dataType: "html",
		success : function(data) 
		{	
			// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
			$("#rightside").html(data);
			$("#searchinput").css('display','none');
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
        maxDate: "+today",
        onSelect: function(dateText, inst) {
        	// ������ ��¥�� URL �Ķ���ͷ� �߰��Ͽ� �������� ���ΰ�ħ
            window.location.href = "main.jsp?date=" + dateText;
        }
    });    
    // �ʱⰪ�� ���� ��¥�� ����
    $('#datepicker').datepicker('setDate', 'today');
});


function openinfo() 
{	
	var _width = '1100';
	var _height = '700';
		
	var _left = Math.ceil((window.screen.width - _width )/2);
	var _top = '400';
	
	window.open('info.jsp', '', 'width=1100, height=700, left=' + _left +', top=' + (_top - 250)); return false;
}

</script>
	</body>
</html>