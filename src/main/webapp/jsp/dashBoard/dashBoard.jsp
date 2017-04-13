<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge, chrome=1">
<meta name="title" content="">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/jquery-ui.css" media="all">
<link rel="stylesheet" href="/css/wCommon.css" media="all">
<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common.ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="https://d3js.org/d3.v4.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<style>
h3.title {
	color: #4178be;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
		"Helvetica Neue", "HelvNeueLightforIBM", Arial, sans-serif;
	margin-left: 20px;
	margin-top: 10px;
}

div {
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
		"Helvetica Neue", "HelvNeueLightforIBM", Arial, sans-serif;
}

.rt3:hover {
	text-decoration: underline;
	cursor: pointer;
}

.tcnt td:hover {
	text-decoration: underline;
	cursor: pointer;
}
div.tab {
    overflow: hidden;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    height: 320px;
}
</style>
<%
	Gson gsonObj = new Gson();
	Map<Object, Object> map = null;
	List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

	map = new HashMap<Object, Object>();
	map.put("x", 10);
	map.put("y", 71);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 20);
	map.put("y", 55);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 30);
	map.put("y", 50);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 40);
	map.put("y", 65);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 50);
	map.put("y", 95);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 60);
	map.put("y", 68);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 70);
	map.put("y", 28);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 80);
	map.put("y", 34);
	list.add(map);
	map = new HashMap<Object, Object>();
	map.put("x", 90);
	map.put("y", 14);
	list.add(map);
	String dataPoints = gsonObj.toJson(list);
%>
<script type="text/javascript">
	var chartdata1 = "";
	var chartdata2 = "";
	var chartdata3 = "";
	var chartdata4 = "";
	
	var d1 = "";
	var d2 = "";
	var d3 = "";
	var d4 = "";
	var d5 = "";
	
	var c1 = "";
	var c2 = "";
	var c3 = "";
	var c4 = "";
	var c5 = "";
	
	function openCity(evt, cityName) {
	    // Declare all variables
	    var i, tabcontent, tablinks;

	    // Get all elements with class="tabcontent" and hide them
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }

	    // Get all elements with class="tablinks" and remove the class "active"
	     tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }

	    // Show the current tab, and add an "active" class to the button that opened the tab
	     document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	    if(cityName =='Day'){
	    	drawP();	    	
	    }
	    else if(cityName =='Intent'){
	    	drawP2();	    	
	    }
	    else if(cityName =='Sex'){
	    	drawP3();	    	
	    }
	    else {
	    	drawP4();	    	
	    }
	}
	
	$.ajax({
		type : "POST",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		url : "/HkmcDashBoard",
		dataType : "json",
		error : function() {
			alert('통신실패3333!!');
		},
		success : function(data) {
			chartdata1 = data.cnt1.replace(/[^0-9]/g, '');
			chartdata2 = data.cnt2.replace(/[^0-9]/g, '');
			chartdata3 = data.cnt3.replace(/[^0-9]/g, '');
			chartdata4 = data.cnt4.replace(/[^0-9]/g, '');
			drawD();
		}
	});
	
	var cnt1 = "";
	var cnt2 = "";
	var cnt3 = "";
	
	$.ajax({
		type : "POST",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		url : "/timeCnt",
		dataType : "json",
		error : function() {
			alert('통신실패444!!');
		},
		success : function(data) {
			cnt1=data.cnt0.replace(/[^0-9]/g, '');
			cnt2=data.cnt1.replace(/[^0-9]/g, '');
		    cnt3=data.cnt2.replace(/[^0-9]/g, '');
			drawB();
		}
	});
	

	drawP= function(){
		var chart = new CanvasJS.Chart("chartContainerD1",
				{
					title:{
						text: "Daily"
					},
					exportFileName: "Pie Chart",
					exportEnabled: true,
			                animationEnabled: true,
					legend:{
						verticalAlign: "bottom",
						horizontalAlign: "center"
					},
					data: [
					{       
						type: "pie",
						showInLegend: true,
						toolTipContent: "{name}: <strong>{y}%</strong>",
						indexLabel: "{name} {y}%",
						dataPoints: [
							{  y: 35, name: "Angry"},
							{  y: 20, name: "Satisfy"},
							{  y: 45, name: "Normal"}
						]
				}
				]
				});
				chart.render();
				
				var chart2 = new CanvasJS.Chart("chartContainerD2",
						{
							title:{
								text: "Monthly"
							},
							exportFileName: "Pie Chart",
							exportEnabled: true,
					                animationEnabled: true,
							legend:{
								verticalAlign: "bottom",
								horizontalAlign: "center"
							},
							data: [
							{       
								type: "pie",
								showInLegend: true,
								toolTipContent: "{name}: <strong>{y}%</strong>",
								indexLabel: "{name} {y}%",
								dataPoints: [
									{  y: 15, name: "Angry"},
									{  y: 50, name: "Satisfy"},
									{  y: 35, name: "Normal"}
								]
						}
						]
						});
						chart2.render();
	};
	
	drawP2= function(){
		var chart = new CanvasJS.Chart("chartContainerI1",
				{
					title:{
						text: "Price"
					},
					exportFileName: "Pie Chart",
					exportEnabled: true,
			                animationEnabled: true,
					legend:{
						verticalAlign: "bottom",
						horizontalAlign: "center"
					},
					data: [
					{       
						type: "pie",
						showInLegend: true,
						toolTipContent: "{name}: <strong>{y}%</strong>",
						indexLabel: "{name} {y}%",
						dataPoints: [
							{  y: 35, name: "Angry"},
							{  y: 20, name: "Satisfy"},
							{  y: 45, name: "Normal"}
						]
				}
				]
				});
				chart.render();
				
				var chart2 = new CanvasJS.Chart("chartContainerI2",
						{
							title:{
								text: "Specifications"
							},
							exportFileName: "Pie Chart",
							exportEnabled: true,
					                animationEnabled: true,
							legend:{
								verticalAlign: "bottom",
								horizontalAlign: "center"
							},
							data: [
							{       
								type: "pie",
								showInLegend: true,
								toolTipContent: "{name}: <strong>{y}%</strong>",
								indexLabel: "{name} {y}%",
								dataPoints: [
									{  y: 15, name: "Angry"},
									{  y: 50, name: "Satisfy"},
									{  y: 35, name: "Normal"}
								]
						}
						]
						});
						chart2.render();
	};
	
	drawP3= function(){
		var chart = new CanvasJS.Chart("chartContainerS1",
				{
					title:{
						text: "Female"
					},
					exportFileName: "Pie Chart",
					exportEnabled: true,
			                animationEnabled: true,
					legend:{
						verticalAlign: "bottom",
						horizontalAlign: "center"
					},
					data: [
					{       
						type: "pie",
						showInLegend: true,
						toolTipContent: "{name}: <strong>{y}%</strong>",
						indexLabel: "{name} {y}%",
						dataPoints: [
							{  y: 35, name: "Angry"},
							{  y: 20, name: "Satisfy"},
							{  y: 45, name: "Normal"}
						]
				}
				]
				});
				chart.render();
				
				var chart2 = new CanvasJS.Chart("chartContainerS2",
						{
							title:{
								text: "Male"
							},
							exportFileName: "Pie Chart",
							exportEnabled: true,
					                animationEnabled: true,
							legend:{
								verticalAlign: "bottom",
								horizontalAlign: "center"
							},
							data: [
							{       
								type: "pie",
								showInLegend: true,
								toolTipContent: "{name}: <strong>{y}%</strong>",
								indexLabel: "{name} {y}%",
								dataPoints: [
									{  y: 15, name: "Angry"},
									{  y: 50, name: "Satisfy"},
									{  y: 35, name: "Normal"}
								]
						}
						]
						});
						chart2.render();
	};
	
	drawP4= function(){
		var chart = new CanvasJS.Chart("chartContainerA1",
				{
					title:{
						text: "20s-30s"
					},
					exportFileName: "Pie Chart",
					exportEnabled: true,
			                animationEnabled: true,
					legend:{
						verticalAlign: "bottom",
						horizontalAlign: "center"
					},
					data: [
					{       
						type: "pie",
						showInLegend: true,
						toolTipContent: "{name}: <strong>{y}%</strong>",
						indexLabel: "{name} {y}%",
						dataPoints: [
							{  y: 35, name: "Angry"},
							{  y: 20, name: "Satisfy"},
							{  y: 45, name: "Normal"}
						]
				}
				]
				});
				chart.render();
				
				var chart2 = new CanvasJS.Chart("chartContainerA2",
						{
							title:{
								text: "40s-50s"
							},
							exportFileName: "Pie Chart",
							exportEnabled: true,
					                animationEnabled: true,
							legend:{
								verticalAlign: "bottom",
								horizontalAlign: "center"
							},
							data: [
							{       
								type: "pie",
								showInLegend: true,
								toolTipContent: "{name}: <strong>{y}%</strong>",
								indexLabel: "{name} {y}%",
								dataPoints: [
									{  y: 15, name: "Angry"},
									{  y: 50, name: "Satisfy"},
									{  y: 35, name: "Normal"}
								]
						}
						]
						});
						chart2.render();
	};

	drawD = function() {
		var chart = new CanvasJS.Chart(
				"chartContainer1",
				{
					title : {
						text : "Real Time"
					},
					animationEnabled : true,
					data : [ {
						type : "doughnut",
						startAngle : 60,
						toolTipContent : "{legendText}: {y} - <strong>#percent% </strong>",
						showInLegend : true,
						dataPoints : [ {
							y : chartdata1,
							indexLabel : "Pass #percent%",
							legendText : "Pass"
						}, {
							y : chartdata2,
							indexLabel : "Fail #percent%",
							legendText : "Fail"
						} ]
					} ]
				});
		chart.render();

		$(".rt1").text(chartdata1 * 1 + chartdata2 * 1);
		$(".rt2").text(chartdata1);
		$(".rt3").text(chartdata2)
		.click(function() {
        $.ajax({
				type : "POST",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				url : "/FailureList",
				dataType : "json",
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {
					var leng=Object.keys(data.results).length;
					
					for(var i=0;i<leng;i++)
					{	
						var list = data.results[i];
						c1=list.LogSeq;
						c2=list.LogDate;
						c3=list.UserCd;
						c5=list.WatsonRetrainYn;
						if(c5 == 'Y'){
							c5 = '<img alt="" src="/img/Picture1.png" />';
						}
						var row='<tr>';
						row += '<td style="text-align:center">'+c1+'</td>';
						row += '<td style="text-align:center;width:100px;"><div style="width:100px;display:inline-block;white-space:nowrap;text-overflow:ellipsis;overflow:hidden">질문인식불가</div></td>';
						row += '<td style="text-align:center">'+c3+'</td>';
						row += '<td style="text-align:center">'+c2+'</td>';
						row += '<td style="text-align:center">'+c5+'</td>';
						row += '</tr>';
	
						$("#fList").append(row);
						
					}
				}
		});
		
    });
		var chart2 = new CanvasJS.Chart(
				"chartContainer2",
				{
					title : {
						text : "Total"
					},
					animationEnabled : true,
					data : [ {
						type : "doughnut",
						startAngle : 60,
						toolTipContent : "{legendText}: {y} - <strong>#percent% </strong>",
						showInLegend : true,
						dataPoints : [ {
							y : chartdata3,
							indexLabel : "Pass #percent%",
							legendText : "Pass"
						}, {
							y : chartdata4,
							indexLabel : "Fail #percent%",
							legendText : "Fail"
						} ]
					} ]
				});

		chart2.render();

		$(".total1").text(chartdata3 * 1 + chartdata4 * 1);
		$(".total2").text(chartdata3);
		$(".total3").text(chartdata4);
		$("#chartContainer").click(function(){alert(this)});

	}
	drawB = function(){
		var chart3 = new CanvasJS.Chart("chartContainer", {

			title : {
				text : "Communication Time"

			},
			animationEnabled : true,
			axisX : {
				interval : 1,
				gridThickness : 0,
				labelFontSize : 10,
				labelFontStyle : "normal",
				labelFontWeight : "normal",
				labelFontFamily : "Lucida Sans Unicode"

			},
			axisY2 : {
				interlacedColor : "rgba(1,77,101,.2)",
				gridColor : "rgba(1,77,101,.1)"

			},

			data : [ {
				type : "bar",
				name : "companies",
				axisYType : "secondary",
				color : "#014D65",
				dataPoints : [

				{
					y : cnt3*1,
					label : "5min"
				}, {
					y : cnt2*1,
					label : "3min"
				}, {
					y : cnt1*1,
					label : "1min"
				} ]
			}

			]
		});

		chart3.render();
		
		$(".tcnt3").text(cnt3)
				.click(function() {
        		$.ajax({
						type : "POST",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						url : "/keyword",
						dataType : "json",
						error : function() {
							alert('통신실패!!222');
						},
						success : function(data) {
							var leng=Object.keys(data.results).length;
							
							for(var i=0;i<leng;i++)
							{	
								var list = data.results[i];
								c1=list.intent;
								c2=list.cnt;

								var row='<tr>';
								row += '<td style="text-align:center">'+c1+'</td>';
								row += '<td>'+c2+'</td>';
								row += '</tr>';
			
								$("#iList").append(row);
								
							}			            
						}
				});
				});
		$(".tcnt2").text(cnt2)
		.click(function() {
		   $(".cnt1").text('');
 		   $(".cnt2").text('');
 		   $(".cnt3").text('');
 		   $(".cnt4").text('');
 		   $(".cnt5").text('');
 		   
 		   $(".intent1").text('');
 		   $(".intent2").text('');
 		   $(".intent3").text('');
 		   $(".intent4").text('');
 		   $(".intent5").text('');
		});
		
		$(".tcnt1").text(cnt1)
		.click(function() {
		   $(".cnt1").text('');
 		   $(".cnt2").text('');
 		   $(".cnt3").text('');
 		   $(".cnt4").text('');
 		   $(".cnt5").text('');
 		   
 		   $(".intent1").text('');
 		   $(".intent2").text('');
 		   $(".intent3").text('');
 		   $(".intent4").text('');
 		   $(".intent5").text('');
		});
	}
</script>
<body>
	<div class="mp-wrap">
		<div class="mp-header">
			<div class="mp-gnb">
				<input type="image" src='/img/header.png'
					style="width: 100%; height: 35px;">
			</div>
			<!-- //mp-gnb -->
		</div>
		<!-- //mp-header -->
		<div style="width: 100%; height: 100%;">
			<div style="width: 100%; height: 10px"></div>
			<div style="width: 98%; height: 315px; display: inline-block; margin-left: 10px">
				<div style="width: 50%; height: 315px; margin: 0; border: 1px solid #e8e8e8; border-radius: 10px; display: inline-block;">
					<h3 class="title">HYUNDAI WPC Record</h3>
					<div style="width: 40%; margin-left: 7%; display: inline-block">
						<div id="chartContainer1" style="height: 200px"></div>
						<table style="width: 100%; text-align: center">
							<tr>
								<td style="text-decoration: underline">CALL</td>
								<td style="text-decoration: underline">PASS</td>
								<td style="text-decoration: underline">FAIL</td>
							<tr>
							<tr>
								<td class="rt1"></td>
								<td class="rt2"></td>
								<td class="rt3"></td>
							<tr>
						</table>
					</div>
					<div style="width: 40%; margin-left: 7%; display: inline-block">
						<div id="chartContainer2" style="height: 200px"></div>
						<table style="width: 100%; text-align: center">
							<tr>
								<td style="text-decoration: underline">CALL</td>
								<td style="text-decoration: underline">PASS</td>
								<td style="text-decoration: underline">FAIL</td>
							<tr>
							<tr>
								<td class="total1"></td>
								<td class="total2"></td>
								<td class="total3"></td>
							<tr>
						</table>
					</div>
				</div>
				<div
					style="width: 49%; height: 315px; border: 1px solid #e8e8e8; border-radius: 10px; float: right;overflow: auto">
					<table id="fList" style="width: 100%;">
					    <thead>
						<tr style="height: 45px;">
							<td colspan=4 style="border-bottom: solid 1px #e8e8e8;text-align:center;color: #4178be;font-size:15px;font-weight:bold">
									Failure List</td>
							<td style="border-bottom: solid 1px #e8e8e8;text-align:center;color: #4178be;font-size:15px;font-weight:bold">Re-Training</td>
						</tr>
						</thead>
					</table>
				</div>
			</div>
			<div
				style="width: 98%; height: 450px; display: inline-block; margin-top: 10px; margin-bottom: 30px; margin-left: 10px;">
				<div style="width: 30%; height: 80%; display: inline-block; border: 1px solid #e8e8e8; border-radius: 10px;">
					<div id="chartContainer" style="height: 300px; width: 98%;">
					</div>
					<table style="width: 100%; text-align: center">
						<tr>
							<td style="text-decoration: underline">1min</td>
							<td style="text-decoration: underline">3min</td>
							<td style="text-decoration: underline">5min</td>
						<tr>
						<tr class="tcnt">
							<td class="tcnt1"></td>
							<td class="tcnt2"></td>
							<td class="tcnt3"></td>
						<tr>
					</table>
				</div>
				<div style="width: 20%; height: 80%; border: 1px solid #e8e8e8; border-radius: 10px;  display: inline-block;overflow: auto">
				   <div style="width: 98%;height:100%;display: inline-block;">
					<table id="iList" style="width: 100%;height:100%; text-align: center; vertical-align: middle;">
						<thead>
						<tr>
							<td style="border-bottom: solid 1px #e8e8e8"><h3 class="title">Keyword</h3></td>
							<td
								style="border-bottom: solid 1px #e8e8e8"><h3 class="title">Count</h3></td>
						</tr>
						</thead>
					</table>
					</div>
				</div>
				<div  style="width: 49%; height: 80%; border: 1px solid #e8e8e8; border-radius: 10px;  float:right">
				<div>
				<div class="tab">
				  <button class="tablinks" onclick="openCity(event, 'Day')">Day</button>
				  <button class="tablinks" onclick="openCity(event, 'Intent')">Intent</button>
				  <button class="tablinks" onclick="openCity(event, 'Sex')">Sex</button>
				  <button class="tablinks" onclick="openCity(event, 'Age')">Age</button>
				</div>
				
				<div id="Day" class="tabcontent"  style="width: 100%;height:280px">
			      <h3>Day</h3>			  
				  <div id="chartContainerD1" style="width: 40%; height:80%; display: inline-block;"></div>		  
				  <div id="chartContainerD2" style="width: 40%; height:80%; display: inline-block;margin-left:100px"></div>
				</div>
				
				<div id="Intent" class="tabcontent" style="height:100%;height:280px">
				  <h3>Intent</h3>				  
				  <div id="chartContainerI1" style="width: 40%; height:80%;display: inline-block;"></div>				  
				  <div id="chartContainerI2" style="width: 40%; height:80%; display: inline-block;margin-left:100px"></div>
				</div>
				
				<div id="Sex" class="tabcontent" style="height:100%;height:280px">
				  <h3>Sex</h3>			  
				  <div id="chartContainerS1" style="width: 40%; height:80%; display: inline-block";></div>				  
				  <div id="chartContainerS2" style="width: 40%; height:80%; display: inline-block;margin-left:100px"></div>
				</div>
				
				<div id="Age" class="tabcontent" style="height:100%;height:280px">
				  <h3>Age</h3>			  
				  <div id="chartContainerA1" style="width: 40%; height:80%; display: inline-block;"></div>					  
				  <div id="chartContainerA2" style="width: 40%; height:80%; display: inline-block;margin-left:100px"></div>
				</div>
				
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>