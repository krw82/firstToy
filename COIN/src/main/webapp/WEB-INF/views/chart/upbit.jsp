<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 

<html>

<head>

	<meta charset="utf-8" />

	<title>CHART</title>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<script language="javascript" type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(onMessage);
    var dataArray= [['trade_date','low_price','opening_price', 'trade_price', 'high_price']];
    
    <c:forEach items="${list}" var="item">        
    dataArray.push(['${item.candle_date_time_kst}' , ${item.low_price}, ${item.opening_price} ,${item.trade_price},${item.high_price} ]);
	</c:forEach>
 
	
		var wsUri = "wss://api.upbit.com/websocket/v1";

		var output;
		var price=0;
		var candleTime;
		
 

		function init()

		{

			/* output = document.getElementById("chart_div"); */

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

					"codes"		: ["${coinSelect}"]

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
			var enc = new TextDecoder("utf-8");

			var arr = new Uint8Array(evt.data);
			
			var decodeValue=enc.decode(arr); 
			
			 var obj = JSON.parse(decodeValue);
		
			 
			  
			 
			
			 

			price= parseInt(obj.trade_price); 
			
			if(price<dataArray[dataArray.length-1][1]){
				dataArray[dataArray.length-1][1]=price;
			}
			if(price>dataArray[dataArray.length-1][4]){
				dataArray[dataArray.length-1][4]=price;
			}
			
			dataArray[dataArray.length-1][3]=price;
			
			
			  var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));
			  
		      var data = google.visualization.arrayToDataTable(dataArray);

		      var options = {
		     	 legend:'none'
		  		  };
		      
		    chart.draw(data, options);
		    
		    

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

			

		}

	 

		window.addEventListener("load", init, false);
		
		function addLow(){
			var inn=Math.round(new Date() / 1000);
			
			if(inn%60==0){
			 dataArray.push([new Date() ,price, price ,price,price]); 
			}
			
			
		}
		setInterval(addLow, 1000);
		
		
		
		
		
		
		

		
	
		
		
		
		
		
		
	</script>

</head>

<body>






	<div style="height: 1000px; width : 20%; float: left;" >
	<h1>${coinSelect}</h1>
	<h4>${scalee }</h4>
	
	</div>
	
	<div id="chart_div" style="height: 1000px; width : 60%; float: left;" ></div>
	
	<form action="chart" method="get" name="frm">
	
	<select name="scale" onchange="location.href = '/coin/chart?scale='+this.value+'&coin=${coinSelect}';" >
	<option selected  disabled>SCALE</option>
	<option value="60">1분봉</option>
	<option value="300">5분봉</option>
	<option value="900">15분봉</option>
	<option value="3600">1시간봉</option>
	<option value="14400">4시간봉</option>
	<option value="86400">일봉</option>
	<option value="604800">주봉</option>
	</select>
	
	
	<select name="coin" onchange="location.href = '/coin/chart?scale=${scaleNumber}&coin='+this.value;" >
	<option value="선택" selected  disabled>COIN</option>
	<option value="비트코인">KRW-BTC</option>
	<option value="이더리움">KRW-ETH</option>
	<option value="리플">KRW-XRP</option>
	</select>
	</form>
	<div id="news" style="width : 20%; float: left;">
	<table border="1">
		<c:forEach var="news" items="${news}" varStatus="status">
		        <tr onclick="window.open('${news.link}','','')">
		 		 <td>${news.title}</td>
		        </tr>
		        
	        </c:forEach>
	</table>
	</div>
	
	

</body>

</html>


