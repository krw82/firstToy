<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 

<html>

<head>

	<meta charset="utf-8" />

	<title>CHART</title>
	<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<script language="javascript" type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(onMessage);
    var dataArray= [['trade_date','low_price','opening_price', 'trade_price', 'high_price']];
    var optionArray=[];
    
    <c:forEach items="${list}" var="item" varStatus="index">   
   
    dataArray.push(['${item.candle_date_time_kst}' , ${item.low_price}, ${item.opening_price} ,${item.trade_price},${item.high_price} ]);
    
    
    
	</c:forEach>
 
	
		var wsUri = "wss://api.upbit.com/websocket/v1";

		var output;
		var price=0;
		var candleTime;
		
		 var options = {
	    		  legend: 'none',
	    		  candlestick: {
	                  fallingColor: { strokeWidth: 0, fill: 'blue' }, // red
	                  risingColor: { strokeWidth: 0, fill: 'red' }   // green
	               },
	               /* hAxis: {
	                   ticks:optionArray
	               }, */
	    	    
	    	        backgroundColor: '#E4E4E4'
	  		  };
		
 

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

			writeToScreen("????????????");

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

			writeToScreen("????????????");

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

		     
		      
		    chart.draw(data, options);
		    
		    

		}

	 

		function onError(evt)

		{

			writeToScreen('<span style="color: red;">??????:</span> ' + evt.data);

		}

	 

		function doSend(message)

		{

			console.log("??????: " + message);

			websocket.send(message);

		}

	 

		function writeToScreen(message)

		{

			

		}

	 

		window.addEventListener("load", init, false);
		
		function addLow(){
			var inn=Math.round(new Date() / 1000);
			
			if(inn%${coinSelect}==0){
			 dataArray.push([new Date() ,price, price ,price,price]); 
			}
			
			
		}
		setInterval(addLow, 1000);
		
		
		
		
		
		
		

		
	
		
		
		
		
		
		
	</script>

</head>

<body style="background-color:#E4E4E4;">





<div>
	<nav style="width:19%; float:left;">
    <h1>MBDTF</h1> <!-- h1?????? ?????????????????? ?????????. ???????????? 1?????? ?????? ?????? ????????????. -->
   <div class="list-group">
        <a  class="list-group-item list-group-item-action list-group-item-dark" href="chart?scale=60&coin=KRW-BTC" style=" background-color:#eee;">????????????</a>
       <a  class="list-group-item list-group-item-action list-group-item-dark" href="chart?scale=60&coin=KRW-ETH" style=" background-color:#eee;">????????????</a>
       <a  class="list-group-item list-group-item-action list-group-item-dark" href="chart?scale=60&coin=KRW-XRP" style=" background-color:#eee;">??????</a>
       <a  class="list-group-item list-group-item-action list-group-item-dark" href="board" style=" background-color:#eee;">?????????</a>
       
    </div>
    
    <p style="width:30%; margin-left: 20px; float:left;">${IDD}</p>
    <c:choose>
    <c:when test="${IDD eq '?????????????????????'}">
    	<a href="login"><input type="button" value="?????????" style="width:50%; float:left; margin-left: 50px;" > </a>
    </c:when>
	<c:otherwise>
	<a href="login"><input type="button" value="????????????" style="width:50%; float:left; margin-left: 50px;" > </a>
	</c:otherwise>
	</c:choose>
     
</nav>
</div>
	
	<div id="chart_div" style="height: 1000px; width : 60%; float: left;" ></div>
	
	<div id="news" style="width : 20%; float: left; ">
	<h1>${coinSelect}</h1>
	<h5 style="margin-left:25px;">${scalee}</h5>
	
	<form action="chart" method="get" name="frm">
	<select name="scale" onchange="location.href = '/coin/chart?scale='+this.value+'&coin=${coinSelect}';" class="form-select" aria-label="Default select example" >
	<option selected  disabled>SCALE</option>
	<option value="60">1??????</option>
	<option value="300">5??????</option>
	<option value="900">15??????</option>
	<option value="3600">1?????????</option>
	<option value="14400">4?????????</option>
	<option value="86400">??????</option>
	<option value="604800">??????</option>
	</select>
	
	
	<select name="coin" onchange="location.href = '/coin/chart?scale=${scaleNumber}&coin='+this.value;" class="selectpicker" >
	<option value="??????" selected  disabled>COIN</option>
	<option value="KRW-BTC">????????????</option>
	<option value="KRW-ETH">????????????</option>
	<option value="KRW-XRP">??????</option>
	</select>
	</form>
	
	
	
	<table border="1" class="table table-hover">
		<c:forEach var="news" items="${news}" varStatus="status">
		        <tr onclick="window.open('${news.link}','','')">
		 		 <td>${news.title}</td>
		        </tr>
		        
	        </c:forEach>
	</table>
	</div>
	
	
	

	 

</body>

	 <style>
	 
    nav{ 
       
        background-color:#eee; 
        border-right:1px solid #ddd;
        /* height:100% ?????? ?????? ??????. ??????????????? ????????? ????????? ??? ?????? */

        /* position:fixed; */  /*????????? ?????? ????????? ???????????? ??????*/
         height:1000px;  /*fixed??? ?????? ?????? 100%??? ????????????*/
    }
    h1{ font-size:18px;  padding:20px; }
    
</style>



</html>


