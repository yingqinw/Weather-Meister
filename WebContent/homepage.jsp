<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String username=(String)session.getAttribute("username");
if(username==null){
	username="";
	
}
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home Page</title>
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
		    	font-size:80px;
		    	position:absolute;
		    	width:1920px;
		    	padding-left:10px;
		    	padding-top: 10px;
		    }
		    #Header{
		    	color:white;
		    	text-decoration: none;
		    }
		    #Header1{
		    	float:right;
		    	color:white;
		    	text-decoration: none;
		    	font-family:AvenirNext;
		    	font-size:40px;
		    	padding-top:10px;
		    	padding-right:20px;
		    	padding-left:20px;
		    }
		    #Header2{
		    	float:right;
		    	color:white;
		    	text-decoration: none;
		    	font-family:AvenirNext;
		    	font-size:40px;
		    	padding-top:10px;
		    	padding-left:20px;
		    	padding-right:20px;
		    }
			.bg-img {
				background-image: url("Assignment 3 Images/Black Vignette.png"),url("Assignment 3 Images/background.jpg");
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
			#DisplayBar{
				position: relative;		
				background-color:rgba(255,255,255,0.4);
			    text-align: center;
			    top:30px;
			    padding: 10px;
			    text-decoration: none;
			    color:white;
			}
		    #container{
		    	text-align:center;
		    }
		    #container img{
		    	width: 30%;	
		    	margin-top: 100px;
		    }
		    #name {
		    	height: 30px;
		    	width: 320px;
		    	padding: 5px 10px;
		    	background-color: rgba(255,255,255,0.4);
		    	color: white;
		    	display:inline;
		    }
		    #Lat {
		    	height: 30px;
		    	width: 160px;
		    	padding: 5px 10px;
		    	margin-right:10px;
		    	background-color: rgba(255,255,255,0.4);
		    	color: white;
		    	display: none;
		    }
		    #Long {
		    	height: 30px;
		    	width: 160px;
		    	padding: 5px 10px;
		    	margin-left:10px;
		    	background-color: rgba(255,255,255,0.4);
		    	color: white;
		    	display:none;
		    }
		    #submitbutton{
		    	width: 60px;
		    	height:60px;
		    	position:absolute;
		    	background-color: rgba(255,255,255,0);
		    	border-width:0px;
		    	margin-left:-60px;
		    	margin-top:-5px;
		    }
		    #submitbutton img{
		    	margin-top:0px;
		    	width: 75%;
		    }
		    #google{
		    	width: 60px;
		    	height:60px;
		    	position:absolute;
		    	background-color: rgba(255,255,255,0);
		    	border-width:0px;
		    	margin-left:-10px;
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
  				height: 60%;
  				width: 75%;
  				margin-top:150px;
  				margin-left:200px;
  				display:none;
			}
			html, body{
				height: 50%;
				margin: 0;
				padding: 0;
			
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
			<%if(username.equals("")){ %>
			<a id = "Header2" href="register.jsp">Register</a>
			<a id = "Header1" href="login.jsp">Login</a>
			<%} %>
			<%if(!username.equals("")){ %>
			<form action="signout" method="GET" style="display:inline"> <button id = "Header2" type="submit">Sign Out</button></form>
			<form action="toprofile" method="GET" style="display:inline"> <button id = "Header1" type="submit">Profile</button></form>
			<%} %>
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
	    <div id="container">
	    	<div id="imagebox">
	    		<img src="Assignment 3 Images/logo.png" alt="logo">
	    	</div>
	    	<div id="form">
	    	<form action="MyServlet" method="GET">
	    		<input id="name" type="text" name="name" placeholder="Los Angeles"/>
	    		<input id="Lat" type="text" name="Latitude" placeholder="Latitude">
	    		<input id="Long" type="text" name="Longtitude" placeholder="Longtitude">
	    		<button id="submitbutton" type="submit" name="fangdajing" ><img src="Assignment 3 Images/magnifying_glass.jpeg" ></button>
	    		<button id="google" type="button" name="google" onclick="DisplayMap()" ><img src="Assignment 3 Images/MapIcon.png" ></button>
	    		<br><br>
	    	
	    		<label style="color: white"><input type="radio" name="radiobutton" onclick="CityCheck();LocationCheck()" id="City" checked> City </label>
	    		<label style="color: white"><input type="radio" name="radiobutton" onclick="CityCheck();LocationCheck()" id="Location"> Location(Lat./Long.) </label>
	    		<br>
	    	</form>
	    	</div>
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBtrD98YFDxJD579cLIqvOL5pRdxed9gWY&callback=initMap"
        async defer></script>
	    </div>
	    <div class='bg-img'></div>

	</body>
</html>