<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 

<html>

<head>

	<meta charset="utf-8" />

	<title>WebSocket 테스트</title>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<script language="javascript" type="text/javascript">
	  google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
 

		var wsUri = "wss://api.upbit.com/websocket/v1";

		var output;
		var price=0;
 

		function init()

		{

			output = document.getElementById("output");

			testWebSocket();

		}

	 

		function testWebSocket()

		{

			websocket = new WebSocket(wsUri);

			  websocket.binaryType = 'arraybuffer';  

			//websocket.binaryType = 'Blob';

			//websocket.binaryType = 'String';

			websocket.onopen = function(evt) { onOpen(evt) ;};

			websocket.onclose = function(evt) { onClose(evt) };

			websocket.onmessage = function(evt) { onMessage(evt) };

			websocket.onerror = function(evt) { onError(evt) };

		}

	 

		function onOpen(evt)

		{

			writeToScreen("연결완료");

			var msg = [

				{

					"ticket"	: "TEST",

				},

				{

					"type"		: "ticker",

					"codes"		: ["KRW-BTC"]

				}

			];

			msg = JSON.stringify(msg);

			doSend(msg);

		}

	 

		function onClose(evt)

		{

			writeToScreen("연결해제");

		}

	 

		function onMessage(evt)

		{

			console.log(evt);

 
 
			var enc = new TextDecoder("utf-8");

			var arr = new Uint8Array(evt.data);
			
			var decodeValue=enc.decode(arr); 
			
			/*  $.each(decodeValue,function(idx,value){
				 console.log(value);
			});  */
			
			 console.log(evt.data); 
			
			
			 var obj = JSON.parse(decodeValue);
			 

			/* writeToScreen('<span style="color: blue;">수신: ' +obj.trade_price+'</span>'); */
			/* price= obj.trade_price; */
			price= parseInt(obj.trade_price); 
			  console.log(price)  

			/*   websocket.close();   */

		}

	 

		function onError(evt)

		{

			writeToScreen('<span style="color: red;">에러:</span> ' + evt.data);

		}

	 

		function doSend(message)

		{

			console.log("발신: " + message);

			websocket.send(message);

		}

	 

		function writeToScreen(message)

		{

			var pre = document.createElement("p");

			pre.style.wordWrap = "break-word";

			pre.innerHTML = message;

			output.appendChild(pre);

		}

	 

		window.addEventListener("load", init, false);
		
		
		function drawChart() {
			  var data = google.visualization.arrayToDataTable([
				  	['Mon', 0, 28, 38, 700],
				    ['Tue', 31, 38, 55, 66],
				    ['Wed', 50, 55, 77, 80],
				    ['Thu', 77, 77, 66, 50],
				    ['Fri', 62, 66, 22, 15],
				    ['Fri', 62, 66, 22, 15]
			    // Treat first row as data as well.
			  ], true);
			
			  var options = {
			    legend:'none'
			  };

			  var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

			  chart.draw(data, options);
			}

	 

	</script>

</head>

<body>

	<h2>WebSocket Test</h2>

	<div id="output"></div>
	
	<div id="chart_div" style="width: 900px; height: 500px;"></div>

</body>

</html>


