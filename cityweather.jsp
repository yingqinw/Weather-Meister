<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%

String jsonData= request.getParameter("Searchname");

%>
<html>
	<input id="jsonData" value='<%=jsonData %>'>
	<head>
		<meta charset="UTF-8">
		<title>City Weather</title>
		<style>
			body {
		    	margin: 0;
		    }
			#header{
		    	background-color: black;
		    	font-family:savoye LET;
		    	color: white;
		    	top: 0;
		    	margin:0;
		    	padding:0;
		    	left:0;
		    	font-size:50px;
		    	position:absolute;
		    	width:1920px;
		    }
		    #Header{
		    	color:white;
		    	text-decoration: none;
		    }
		    .bg-img {
				background-image: url("Assignment2Images/Black Vignette.png"),url("Assignment 3 Images/background.jpg");
				position: fixed;
				z-index: -1;
				margin: 0;
				background-size: cover;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				filter: blur(3px);
			}
			#form{
				display:inline;
				float:right;
				position:relative;
			}
			#name {
		    	height: 30px;
		    	width: 320px;
		    	padding: 5px 10px;
		    	background-color: white;
		    	color: black;
		    	display:inline;
		    }
		    #Lat {
		    	height: 30px;
		    	width: 160px;
		    	padding: 5px 10px;
		    	margin-right:10px;
		    	background-color: white;
		    	color: black;
		    	display: none;
		    }
		    #Long {
		    	height: 30px;
		    	width: 160px;
		    	padding: 5px 10px;
		    	margin-left:10px;
		    	background-color: white;
		    	color: black;
		    	display:none;
		    }
		    #submitbutton{
		    	width: 60px;
		    	height:60px;
		    	position:absolute;
		    	background-color: rgba(255,255,255,0);
		    	border-width:0px;
		    	margin-left:-60px;
		    	margin-top:0px;
		    }
		    #submitbutton img{
		    	margin-top:0px;
		    	width: 75%;
		    }
		    #radiobutton{
		    	position:relative;
		    	display: inline;
		    	font-family:courier;
		    }
		    #title{
		    	position: absolute: 
		    	float:left;
		    	margin-top:100px;
		    	margin-left:80px;
		    	color:white;
		    	font-size:50px;
		    }
		    #table{
		    	margin-top:30px;
		    }
		    table{
		    	margin: 0 auto;
		    	text-align:center;
		    	color:white;
		    }
		    td{
		    	width:210px;
		    	padding:45px;
				padding-left:75px;
				padding-right:75px;
		    	font-size:30px;
		    	height:210px;
		    }
		    th{
		    	width:210px;
		    	padding:0px;
				padding-left:75px;
				padding-right:75px;
		    	font-size:30px;
		    }
		    td img{
				width:210px;
			}
			#jsonData{
				display:none;
			}
			#google{
		    	width: 60px;
		    	height:60px;
		    	position:absolute;
		    	background-color: rgba(255,255,255,0);
		    	border-width:0px;
		    	margin-left:290px;
		    	margin-top:-5px;
		    	display:none;
		    	
		    }
		    #google img{
		    	margin-top:0px;
		    	width: 75%;
		    }
		    #map {
		    	z-index: 30;
		    	position:absolute;
  				height: 90%;
  				width: 90%;
  				margin-top:10px;
  				margin-left:100px;
  				display:none;
			}
		</style>
	<script>
		function CityCheck() {
    	    if (document.getElementById("City").checked) {
    	        document.getElementById("name").style.display = "inline";
    	    } 
    	    else {
    	        document.getElementById("name").style.display = "none";
    	    }
    	}
    	function LocationCheck() {
    	    if (document.getElementById("Location").checked) {
    	        document.getElementById("Lat").style.display = "inline";
    	        document.getElementById("Long").style.display = "inline";
    	        document.getElementById("google").style.display = "inline";
    	    } 
    	    else {
    	        document.getElementById("Lat").style.display = "none";
    	        document.getElementById("Long").style.display = "none";
    	        document.getElementById("google").style.display = "none";
    	    }
    	}
    	function DisplayMap(){
    		document.getElementById("map").style.display = "inline";
    	}	
    	</script>
	</head>
	<body>
		<div id="header">
	    	<a id = "Header" href="homepage.jsp"> Weather Meister</a>
	    	<form action="MyServlet" method="GET" id="form">
	    		<input id="name" type="text" name="name" placeholder="Los Angeles"/>
	    		<input id="Lat" type="text" name="Latitude" placeholder="Latitude">
	    		<input id="Long" type="text" name="Longtitude" placeholder="Longtitude">
	    		<button id="submitbutton" type="submit" name="fangdajing" ><img src="Assignment 3 Images/magnifying_glass.jpeg" ></button>
	    		<button id="google" type="button" name="google" onclick="DisplayMap()" ><img src="Assignment 3 Images/MapIcon.png" ></button>
	    	
	    		<input type="radio" name="radiobutton" onclick="CityCheck();LocationCheck()" id="City" checked> <label style="font-family:defaulted; font-size:20px">City</label> 
	    		<input type="radio" name="radiobutton" onclick="CityCheck();LocationCheck()" id="Location"> <label style="font-family:defaulted;font-size:20px">Location(Lat./Long.)</label> 
	    		<br>
	    	</form>
	    	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBtrD98YFDxJD579cLIqvOL5pRdxed9gWY&callback=initMap"
        async defer></script>
	    </div>
	    <div id="map"></div>
		<script type="text/javascript">
	    	var map;
	    	function initMap() {
	    	  var latitude = 34.018208; // YOUR LATITUDE VALUE
	          var longitude = -118.28624; // YOUR LONGITUDE VALUE
	          var myLatLng = {lat: latitude, lng: longitude};
	            
	            map = new google.maps.Map(document.getElementById('map'), {
	              center: myLatLng,
	              zoom: 10,
	              disableDoubleClickZoom: true, // disable the default map zoom on double click
	            });
	            
	    	  google.maps.event.addListener(map,'click',function(event) {                
	              document.getElementById("Lat").value = event.latLng.lat().toFixed(2);
	              document.getElementById("Long").value =  event.latLng.lng().toFixed(2);
	              document.getElementById("map").style.display = "none";
	          });   	  
    	}
    	</script>
	    <div id="title"></div>
	    <script>
		var cityweather = JSON.parse(document.getElementById("jsonData" ).value);
		document.getElementById("title").innerHTML=cityweather.name;
		
		var status1 = 0;
		var status2 = 0;
		var status3 = 0;
		var status4 = 0;
		var status5 = 0;
		var status6 = 0;
		var status7 = 0;
		var status8 = 0;
		
    	function Reveal(i)
    	{
    		if(i==1){
    			if (status1 == 0) {
    				document.getElementById("LocationImg").innerHTML = "country: "+cityweather.sys.country;
    				status1 = 1;
    			} else {
    				document.getElementById("LocationImg").innerHTML = "<img src=\"Assignment 3 Images/planet-earth.png\">";
    				status1 = 0;
    			}
    		}
    		if(i==2){
    			if (status2 == 0) {
    				document.getElementById("TempLow").innerHTML = ((cityweather.main.temp_min-273)*1.8+32).toFixed(2);
    				status2 = 1;
    			} else {
    				document.getElementById("TempLow").innerHTML = "<img src=\"Assignment 3 Images/snowflake.png\">";
    				status2 = 0;
    			}
    		}
    		if(i==3){
    			if (status3 == 0) {
    				document.getElementById("TempHigh").innerHTML = ((cityweather.main.temp_max-273)*1.8+32).toFixed(2);
    				status3 = 1;
    			} else {
    				document.getElementById("TempHigh").innerHTML = "<img src=\"Assignment 3 Images/sun.png\">";
    				status3 = 0;
    			}
    		}
    		if(i==4){
    			if (status4 == 0) {
    				document.getElementById("Wind").innerHTML = "speed: "+cityweather.wind.speed+"<br> degree: "+cityweather.wind.deg;
    				status4 = 1;
    			} else {
    				document.getElementById("Wind").innerHTML = "<img src=\"Assignment 3 Images/wind.png\">";
    				status4 = 0;
    			}
    		}
    		
    		if(i==5){
    			if (status5 == 0) {
    				document.getElementById("Humidity").innerHTML = cityweather.main.humidity;
    				status5 = 1;
    			} else {
    				document.getElementById("Humidity").innerHTML = "<img src=\"Assignment 3 Images/drop.png\">";
    				status5 = 0;
    			}
    		}
    		if(i==6){
    			if (status6 == 0) {
    				document.getElementById("Coordinates").innerHTML = "lon: "+cityweather.coord.lon+"<br>"+"lat: "+cityweather.coord.lat;
    				status6 = 1;
    			} else {
    				document.getElementById("Coordinates").innerHTML = "<img src=\"Assignment 3 Images/LocationIcon.png\">";
    				status6 = 0;
    			}
    		}
    		if(i==7){
    			if (status7 == 0) {
    				document.getElementById("Current Temp").innerHTML = ((cityweather.main.temp-273)*1.8+32).toFixed(2);
    				status7 = 1;
    			} else {
    				document.getElementById("Current Temp").innerHTML = "<img src=\"Assignment 3 Images/thermometer.png\">";
    				status7 = 0;
    			}
    		}
    		if(i==8){
    			if (status8 == 0) {
    				var sunrisedate = new Date(cityweather.sys.sunrise*1000);
    				// Hours part from the timestamp
    				var sunrisehours = sunrisedate.getHours();
    				// Minutes part from the timestamp
    				var sunriseminutes = "0" + sunrisedate.getMinutes();
    				// Seconds part from the timestamp
    				var sunriseseconds = "0" + sunrisedate.getSeconds();
    				// Will display time in 10:30:23 format
    				var sunriseformattedTime = sunrisehours + ':' + sunriseminutes.substr(-2) + ':' + sunriseseconds.substr(-2);
    				
    				var sunsetdate = new Date(cityweather.sys.sunset*1000);
    				// Hours part from the timestamp
    				var sunsethours = sunsetdate.getHours();
    				// Minutes part from the timestamp
    				var sunsetminutes = "0" + sunsetdate.getMinutes();
    				// Seconds part from the timestamp
    				var sunsetseconds = "0" + sunsetdate.getSeconds();
    				// Will display time in 10:30:23 format
    				var sunsetformattedTime = sunsethours + ':' + sunsetminutes.substr(-2) + ':' + sunsetseconds.substr(-2);
    				document.getElementById("Sunrise/set").innerHTML = "sunrise: "+sunriseformattedTime+"<br> sunset: "+sunsetformattedTime;
    				status8 = 1;
    			} else {
    				document.getElementById("Sunrise/set").innerHTML = "<img src=\"Assignment 3 Images/sunrise-icon.png\">";
    				status8 = 0;
    			}
    		}
    		
    		
    	}
    	</script>
	    <div id="table">
	    	<table>
			  <tr>
			    <td id="LocationImg" onclick="Reveal(1)"><img src="Assignment 3 Images/planet-earth.png"></td>
			    <td id="TempLow" onclick="Reveal(2)"><img src="Assignment 3 Images/snowflake.png"></td>
			    <td id="TempHigh" onclick="Reveal(3)"><img src="Assignment 3 Images/sun.png"></td>
			    <td id="Wind" onclick="Reveal(4)"><img src="Assignment 3 Images/wind.png"></td>
			  </tr>
			 </table>
			 <table>
			  <tr>
			    <th>Location</th>
			    <th>Temp Low</th>
			    <th>Temp High</th>
			    <th>Wind</th>
			  </tr>
			 </table>
			 <table>
			  <tr>
			    <td id="Humidity" onclick="Reveal(5)"><img src="Assignment 3 Images/drop.png"></td>
			    <td id="Coordinates" onclick="Reveal(6)"><img src="Assignment 3 Images/LocationIcon.png"></td>
			    <td id="Current Temp" onclick="Reveal(7)"><img src="Assignment 3 Images/thermometer.png"></td>
			    <td id="Sunrise/set" onclick="Reveal(8)"><img src="Assignment 3 Images/sunrise-icon.png"></td>
			  </tr>
			</table>
			<table>
			  <tr>
			    <th>Humidity</th>
			    <th>Coordinates</th>
			    <th>Current Temp</th>
			    <th>Sunrise/set</th>
			  </tr>
			 </table>
	    </div>
	    <div class='bg-img'></div>

	</body>
</html>