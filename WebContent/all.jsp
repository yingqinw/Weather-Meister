<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
String cityname= request.getParameter("name");
String latitude= request.getParameter("Latitude");
String longtitude = request.getParameter("Longtitude");
boolean error=false;
String inputError=(String)request.getAttribute("inputError");
String LocationError=(String)request.getAttribute("LocationError");
if(inputError==null){
	inputError="";
}
else error=true;
if(LocationError==null){
	LocationError="";
}
else error=true;
%>

<html>
	<input id="cityname" value="<%=cityname %>">
	<input id="latitude" value="<%=latitude %>">
	<input id="longtitude" value="<%=longtitude %>">
	<input id="tablelength" value="">
	<head>
		<meta charset="UTF-8">
		<title>Search Results</title>
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
		    table{
				display: block;
				font-family: Reg;
				position: absolute;
				top: 25%;
				left: 4%;
				width: 70%;
				height: 60%;
				font-size: 50px;
				background-color: white;
				z-index: 5;
				border-radius: 15px;
				border: 1px solid white;
				background: rgba(255,255,255,0.25);
				text-align: center;
				color: white;	
				overflow: auto;
		    }
		    
		    tr td{
				height: 72px;
				width: 450px;
				border-top: 1px solid white;
				font-family: AvenirNext;
				font-size: 40px;
			}
			th{
				line-height: 200%;
				font-family: Bold;
				font-size: 50px;
				color: white;
			}
			
			tr:hover {background-color:rgba(255,255,255,0.4)}
			#sort{
				position: fixed;
				font-family: Reg;
				height: 5.6%;
				width: 19.5%; 
				z-index: 14;
				right: 4.5%;
				top: 32%;
				background-color: white;
			}
			#select{
				font-size: 35px;
				font-family: Reg;
				padding:5px;
			}
			#sortBy {
				position: fixed;
				color: white;
				right: 10%;
			 	top: 24%;
			 	font-family: Reg;
			 	font-size: 50px;
			 	z-index: 8;
			}
			#cityname{
				display:none;
			}
			#latitude{
				display:none;
			}
			#longtitude{
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
  				margin-top:100px;
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
    	<%if(!error){ %>
		    <div id="title">
				All Cities
		    </div>
		    <div id = "sortBy">Sort by:</div>
	    	<table id="mytable">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
			<%for(int i=0;i<20;i++) {%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			<%}%>
			</table>
			<div id="sort">
				<select id = "select" name="select" onchange="validate()">
					<option value ="City Name A-Z" >City Name A-Z</option>
					<option value="City Name Z-A"> City Name Z-A</option>
					<option value="Temp. Low ASC"> Temp. Low ASC</option>
					<option value="Temp. Low DESC"> Temp. Low DESC </option>
					<option value="Temp. High ASC"> Temp. High ASC</option>
					<option value="Temp. High DESC"> Temp. High DESC </option>
				</select>
			</div>
			<%}
			if(error){ %>
		     <div id="title"><%=inputError %><%=LocationError %></div>
			<%} %>
		    <script>
		    var cityname=String(document.getElementById("cityname").value);
	    	if(cityname!=null && cityname.length!=0){
	    		var xhttp = new XMLHttpRequest();
	    		var cityid = new Array();
	    		xhttp.onreadystatechange = function()
	    		{
	    			if(this.readyState == 4 && this.status == 200)
	    			{
	    				var myarr = JSON.parse(this.responseText);
	    			}
	    			for(var i=0;i<myarr.length;i++){
	    				if(myarr[i].name.toLowerCase()==cityname.toLowerCase()){
	    					var temp = myarr[i].id;
	    					cityid.push(temp);
	    				}
	    			}
	    			
	    		};
	    		xhttp.open("GET","city.list.json", false);
	    		xhttp.send();
	    		if(cityid.length==0){
	    			document.getElementById("title").innerHTML="No City matches the search";
					document.getElementById("sort").style.display="none";
					document.getElementById("sortBy").style.display="none";
					document.getElementById("mytable").style.display="none";
	    			
	    		}
	    		else{
	    			xhttp = new XMLHttpRequest();
	    			document.getElementById("tablelength").value = cityid.length;
		    		for(var i=1;i<=cityid.length;i++){
		    			var url="http://api.openweathermap.org/data/2.5/weather?id="+cityid[i-1]+"&APPID=a82c7e4f0ff93f8b100a9c26ed4d35f7";
		    			xhttp.onreadystatechange = function()
		    			{
		    				if(this.readyState==4 && this.status == 200)
		    				{
		    					var stringi = i.toString();
		    					var citydata= JSON.parse(this.response);
		    					document.getElementById("mytable").rows[i].cells[0].innerHTML = "<form action=\"cityweather.jsp\" method=\"GET\"><button id=\""+stringi+"\" name=\"Searchname\" type=\"submit\" style= \"border:none; background-color: inherit; color:white; font-size:40px; font-family:AvenirNext; cursor: pointer;\" value=\"\">"+citydata.name+"</button></form>";
		    					document.getElementById("mytable").rows[i].cells[1].innerHTML = ((citydata.main.temp_min-273)*1.8+32).toFixed(2);
		    					document.getElementById("mytable").rows[i].cells[2].innerHTML = ((citydata.main.temp_max-273)*1.8+32).toFixed(2);
		    					var jsonData = JSON.stringify(citydata);
		    					document.getElementById(stringi).value = jsonData;
		    	    			if(cityid.length==1){
		    	    				document.getElementById("title").innerHTML="";
		        					document.getElementById("sort").style.display="none";
		        					document.getElementById("sortBy").style.display="none";
		    	    			}
		    					
		    				}
		    			};
		    			xhttp.open("GET", url, false);
		    			xhttp.send();
		    			xhttp = new XMLHttpRequest();
		    		}
	    		}
	    	}
	    	else{
	    		var latitude = document.getElementById("latitude").value;
	    		var longtitude = document.getElementById("longtitude").value;
	    		xhttp = new XMLHttpRequest();
	    		document.getElementById("tablelength").value = 1;
    			var url="http://api.openweathermap.org/data/2.5/weather?lat="+parseFloat(latitude)+"&lon="+parseFloat(longtitude)+"&APPID=a82c7e4f0ff93f8b100a9c26ed4d35f7";
    			xhttp.onreadystatechange = function()
    			{
    				if(this.readyState==4 && this.status == 200)
    				{
    					var citydata= JSON.parse(this.response);
    					document.getElementById("mytable").rows[1].cells[0].innerHTML = "<form action=\"cityweather.jsp\" method=\"GET\"><button id=\"Searchname\" name=\"Searchname\" type=\"submit\" style= \"border:none; background-color: inherit; color:white; font-size:40px; font-family:AvenirNext; cursor: pointer;\" value=\"\">"+citydata.name+"</button></form>";
    					document.getElementById("mytable").rows[1].cells[1].innerHTML = ((citydata.main.temp_min-273)*1.8+32).toFixed(2);
    					document.getElementById("mytable").rows[1].cells[2].innerHTML = ((citydata.main.temp_max-273)*1.8+32).toFixed(2);
    					var jsonData = JSON.stringify(citydata);
    					document.getElementById("Searchname").value = jsonData;
    					document.getElementById("title").innerHTML="";
    					document.getElementById("sort").style.display="none";
    					document.getElementById("sortBy").style.display="none";
    					
    				}
    			};
    			xhttp.open("GET", url, false);
    			xhttp.send();
	    	}
			
			function validate(){
				var tablelength=document.getElementById("tablelength").value;
				if(tablelength>20) tablelength=20;
	    		if(document.getElementById("select").value=="City Name A-Z"){
	    			for(var i=1;i<=tablelength;i++){
	    				for(var j=i;j<=tablelength;j++){
	    					if(document.getElementById("mytable").rows[i].cells[0].innerHTML.toLowerCase()>document.getElementById("mytable").rows[j].cells[0].innerHTML.toLowerCase()){
	    						var temp1=document.getElementById("mytable").rows[i].cells[0].innerHTML;
	    						var temp2=document.getElementById("mytable").rows[i].cells[1].innerHTML;
	    						var temp3=document.getElementById("mytable").rows[i].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[0].innerHTML=document.getElementById("mytable").rows[j].cells[0].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[1].innerHTML=document.getElementById("mytable").rows[j].cells[1].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[2].innerHTML=document.getElementById("mytable").rows[j].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[j].cells[0].innerHTML=temp1;
	    						document.getElementById("mytable").rows[j].cells[1].innerHTML=temp2;
	    						document.getElementById("mytable").rows[j].cells[2].innerHTML=temp3;
	    						
	    					}
	    				}
	    			}
	    			
	    		}
				if(document.getElementById("select").value=="City Name Z-A"){
					for(var i=1;i<=tablelength;i++){
	    				for(var j=i;j<=tablelength;j++){
	    					if(document.getElementById("mytable").rows[i].cells[0].innerHTML.toLowerCase()<document.getElementById("mytable").rows[j].cells[0].innerHTML.toLowerCase()){
	    						var temp1=document.getElementById("mytable").rows[i].cells[0].innerHTML;
	    						var temp2=document.getElementById("mytable").rows[i].cells[1].innerHTML;
	    						var temp3=document.getElementById("mytable").rows[i].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[0].innerHTML=document.getElementById("mytable").rows[j].cells[0].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[1].innerHTML=document.getElementById("mytable").rows[j].cells[1].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[2].innerHTML=document.getElementById("mytable").rows[j].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[j].cells[0].innerHTML=temp1;
	    						document.getElementById("mytable").rows[j].cells[1].innerHTML=temp2;
	    						document.getElementById("mytable").rows[j].cells[2].innerHTML=temp3;
	    						
	    					}
	    				}
	    			}
	    			
	    			
	    		}
				if(document.getElementById("select").value=="Temp. Low ASC"){
					for(var i=1;i<=tablelength;i++){
	    				for(var j=i;j<=tablelength;j++){
	    					if(document.getElementById("mytable").rows[i].cells[1].innerHTML>document.getElementById("mytable").rows[j].cells[1].innerHTML){
	    						var temp1=document.getElementById("mytable").rows[i].cells[0].innerHTML;
	    						var temp2=document.getElementById("mytable").rows[i].cells[1].innerHTML;
	    						var temp3=document.getElementById("mytable").rows[i].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[0].innerHTML=document.getElementById("mytable").rows[j].cells[0].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[1].innerHTML=document.getElementById("mytable").rows[j].cells[1].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[2].innerHTML=document.getElementById("mytable").rows[j].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[j].cells[0].innerHTML=temp1;
	    						document.getElementById("mytable").rows[j].cells[1].innerHTML=temp2;
	    						document.getElementById("mytable").rows[j].cells[2].innerHTML=temp3;
	    						
	    					}
	    				}
	    			}
	    			
	    			
	    		}
				if(document.getElementById("select").value=="Temp. Low DESC"){
					for(var i=1;i<=tablelength;i++){
	    				for(var j=i;j<=tablelength;j++){
	    					if(document.getElementById("mytable").rows[i].cells[1].innerHTML<document.getElementById("mytable").rows[j].cells[1].innerHTML){
	    						var temp1=document.getElementById("mytable").rows[i].cells[0].innerHTML;
	    						var temp2=document.getElementById("mytable").rows[i].cells[1].innerHTML;
	    						var temp3=document.getElementById("mytable").rows[i].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[0].innerHTML=document.getElementById("mytable").rows[j].cells[0].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[1].innerHTML=document.getElementById("mytable").rows[j].cells[1].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[2].innerHTML=document.getElementById("mytable").rows[j].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[j].cells[0].innerHTML=temp1;
	    						document.getElementById("mytable").rows[j].cells[1].innerHTML=temp2;
	    						document.getElementById("mytable").rows[j].cells[2].innerHTML=temp3;
	    						
	    					}
	    				}
	    			}
	    			
	    			
	    		}
				if(document.getElementById("select").value=="Temp. High ASC"){
					for(var i=1;i<=tablelength;i++){
	    				for(var j=i;j<=tablelength;j++){
	    					if(document.getElementById("mytable").rows[i].cells[2].innerHTML>document.getElementById("mytable").rows[j].cells[2].innerHTML){
	    						var temp1=document.getElementById("mytable").rows[i].cells[0].innerHTML;
	    						var temp2=document.getElementById("mytable").rows[i].cells[1].innerHTML;
	    						var temp3=document.getElementById("mytable").rows[i].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[0].innerHTML=document.getElementById("mytable").rows[j].cells[0].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[1].innerHTML=document.getElementById("mytable").rows[j].cells[1].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[2].innerHTML=document.getElementById("mytable").rows[j].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[j].cells[0].innerHTML=temp1;
	    						document.getElementById("mytable").rows[j].cells[1].innerHTML=temp2;
	    						document.getElementById("mytable").rows[j].cells[2].innerHTML=temp3;
	    						
	    					}
	    				}
	    			}
	    			
	    			
	    		}
				if(document.getElementById("select").value=="Temp. High DESC"){
					for(var i=1;i<=tablelength;i++){
	    				for(var j=i;j<=tablelength;j++){
	    					if(document.getElementById("mytable").rows[i].cells[2].innerHTML<document.getElementById("mytable").rows[j].cells[2].innerHTML){
	    						var temp1=document.getElementById("mytable").rows[i].cells[0].innerHTML;
	    						var temp2=document.getElementById("mytable").rows[i].cells[1].innerHTML;
	    						var temp3=document.getElementById("mytable").rows[i].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[0].innerHTML=document.getElementById("mytable").rows[j].cells[0].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[1].innerHTML=document.getElementById("mytable").rows[j].cells[1].innerHTML;
	    						document.getElementById("mytable").rows[i].cells[2].innerHTML=document.getElementById("mytable").rows[j].cells[2].innerHTML;
	    						document.getElementById("mytable").rows[j].cells[0].innerHTML=temp1;
	    						document.getElementById("mytable").rows[j].cells[1].innerHTML=temp2;
	    						document.getElementById("mytable").rows[j].cells[2].innerHTML=temp3;
	    						
	    					}
	    				}
	    			}
	    			
	    			
	    		}
	    		
	    	}
			
			</script>

	    <div class='bg-img'></div>

	</body>
</html>