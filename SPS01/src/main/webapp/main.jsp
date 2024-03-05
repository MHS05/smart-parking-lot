<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "sps.vo.*" %>
<%@ page import = "sps.dto.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%
//���� ��¥ �޾ƿ���
Date d = new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String today = simpleDate.format(d);

String date = request.getParameter("date");
if(date == null) date = today;

ListDTO dto = new ListDTO();

//�ش糯¥ ��� ���� ����
ArrayList<CarinfoVO> list = dto.getCarInfoList(date);

//���� ��������
ArrayList<CarinfoVO> list2 = dto.getExitInfoList(date);
//��� ������
int allCar  = list2.size();
//ȸ�� ������
int turning = dto.getTruning(date);
//�Ϲ� ������
int general = dto.getGeneral(date);

//����Ʈ�� ���ݰ��� �Ǽ�,�� �ݾ� ������(ù��° ���Ұ� �Ǽ�, �ι�°�� �ݾ�)
ArrayList<Integer> cashlist = dto.getCash(date);

//����Ʈ�� ī����� �Ǽ�,�� �ݾ� ������(ù��° ���Ұ� �Ǽ�, �ι�°�� �ݾ�)
ArrayList<Integer> cardlist = dto.getCard(date);

//���� ���ڸ� �� ���� ,
DecimalFormat formatter = new DecimalFormat("#,###");

String managecctv = request.getParameter("managecctv");
if(managecctv == null) 
{
	managecctv = "a";
};
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
.btn_upload 
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color:#gray;
	border: none;
	margin: 0 auto;
}
#cctv_image
{
  	display: none;
}
#cctv_imageok
{	
	align:center;
}
.btn_cctvok
{	
	width: 130px;
	height: 40px;
	background: #fff;
	border: 1px solid rgb(77,77,77);
	border-radius: 10px;
	font-size:17px;
	font-weight: 400;
	cursor: pointer;
	background-color:#gray;
	border: none;
}	
.btn_upload:hover 
{
	background: rgb(77,77,77);
	color: #fff;
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
				<td width="550px" height="200px;" align="center" id="leftside">
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
							<td height="30px"><%= general %></td><!-- ��ü���� - ȸ������ -->
							<td><%= turning %></td><!--ȸ������ -->
							<td><%= allCar %></td><!-- ��ü���� -->
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
							<td><%= cashlist.get(0) %></td>
							<td colspan="2"><%= formatter.format(cashlist.get(1)) %> ��</td>
						</tr>
						<tr>
							<td height="30px">ī��</td>
							<td><%= cardlist.get(0) %></td>
							<td colspan="2"><%= formatter.format(cardlist.get(1)) %> ��</td>
						</tr>
						<tr>
							<td height="30px">�հ�</td>
							<td><%= cardlist.get(0) + cashlist.get(0) %></td>
							<td colspan="2"><%= formatter.format(cardlist.get(1) + cashlist.get(1)) %> ��</td>
						</tr>
						<tr style="border:none">
							<td colspan="4" style="height:20px"></td>
						</tr>
					</table>
					<div style="height:440px; overflow: scroll;">
						<table class="table01_1" border="1">
							<tr>
								<th class="th1_1" colspan="4">������ ����Ʈ</th>
							</tr>
				
							<tr>
								<td class="td1_1" width="70px">������ȣ</td>
								<td class="td1_1" width="300px">�ð�</td>
								<td class="td1_1" width="70px" colspan="2">��������</td>
							</tr>
							<% 
								if(!list.isEmpty())
								{
									for(CarinfoVO cvo : list)
									{
										if( !cvo.getEntertime().equals(cvo.getExittime()))
										{
											
											%>
											<tr>
												<td height="40px"><%= cvo.getCarnum() %></td>
												<td><%= cvo.getEntertime() %></td>
												<td colspan="2">����</td>
											</tr>
											<tr>
												<td height="40px"><%= cvo.getCarnum() %></td>
												<td><%= cvo.getExittime() %></td>
												<td colspan="2">����</td>
											</tr>
											<%
										} else 
										{
											%>
												<tr>
													<td height="40px"><%= cvo.getCarnum() %></td>
													<td><%= cvo.getEntertime() %></td>
													<td colspan="2">����</td>
												</tr>
											<% 
										}
									}
								} else
								{
									%>
										<tr>
											<td height="40px" colspan="3">��.������ ������ �����ϴ�.</td>
										</tr>	
									<%
								}
							%>
						</table>
					</div>
				</td>
				<td width="800px" align="center" id="rightside"></td>
			</tr>
		</table>
<script src="./js/jquery-3.7.1.js"></script>
<script src="./js/jquery-ui.js"></script>
<script>

$(document).ready(function() 
{
	$('#cctv_image').on('change', function(e) 
	{
		var file = e.target.files[0];
		var reader = new FileReader();
		reader.onload = function() 
		{
			$('#cctv_image_preview').html('<img src="' + reader.result + '" style="width:800px; height:600px">');
		}
		reader.readAsDataURL(file);
		$('#btn_enterupload').css('display','none')
	});
});

window.onload = function()
{
	$.ajax({
		type : "get",
		url: "parkingmap.jsp?managecctv=<%= managecctv %>",
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
		url: "enterlist.jsp?date=<%= date %>",
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
		url: "exitlist.jsp?date=<%= date %>",
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
		url: "paylist.jsp?date=<%= date %>",
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
        	// ������ ��¥�� URL �Ķ���ͷ� �߰��Ͽ� �������� ���ΰ�ħ���� �ʰ� ������Ʈ
            //history.replaceState(null, null, "?date=" + dateText);
            window.location.href = "main.jsp?date=" + dateText;
        }
    });    
    // �ʱⰪ�� ���� ��¥�� ����
    $('#datepicker').datepicker('setDate', '<%= date %>');
});


function openinfo() {
    var cmno = $("#carnumber").val();
    var _width = '1100';
    var _height = '700';
    var _left = Math.ceil((window.screen.width - _width )/2);
    var _top = '400';
    window.open('info.jsp?cmno=' + cmno, '', 'width=1100, height=700, left=' + _left +', top=' + (_top - 250));
    return false;
}


</script>
	</body>
</html>