<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String registererror=(String)request.getAttribute("registererror");
if(registererror==null){
	registererror="";
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
			#Submit{
				position: relative;		
				background-color:orange;
			    text-align: center;
			    padding-top: 10px;
			    padding-bottom:10px;
			    padding-left:20px;
			    padding-right:20px;
			    text-decoration: none;
			    color:white;
			    font-size:30px;
			    margin-left:270px;
			    border-radius:10px;
			}
		    #container{
		    	position: absolute;
		    	top: 23%;
		    	left:33%;
		    	width:700px;
		    	height:680px;
		    	background-color: rgba(255,255,255,0.4);
		    	border-radius: 20px;
		    }
		    #container img{
		    	position:relative;
		    	margin-top:-100px;
		    	margin-left:250px;	
		    }
		    #username {
		    	position:relative;
		    	height: 30px;
		    	width: 70%;
		    	padding: 5px 10px;
		    	background-color: rgba(255,255,255);
		    	color: black;
		    	display:inline;
		    	margin:15px;
		    	margin-left:50px;
		    }
		    #password {
		    	position:relative;
		    	height: 30px;
		    	width: 70%;
		    	padding: 5px 10px;
		    	background-color: rgba(255,255,255);
		    	color: black;
		    	display:inline;
		    	margin:15px;
		    	margin-left:50px;
		    }
		    #confirm {
		    	position:relative;
		    	height: 30px;
		    	width: 70%;
		    	padding: 5px 10px;
		    	background-color: rgba(255,255,255);
		    	color: black;
		    	display:inline;
		    	margin:15px;
		    	margin-left:50px;
		    }
    
    	</style>
	</head>
	<body>
		<div id="header">
			<a id = "Header" href="homepage.jsp"> Weather Meister</a>
			<a id = "Header2" href="register.jsp">Register</a>
			<a id = "Header1" href="login.jsp">Login</a>
		</div>
	    <div id="container">
	    	<div id="imagebox">
	    		<img src="Assignment 3 Images/new-account-icon-256x256.png" alt="logo">
	    	</div>
	    	<div id="form">
		    	<form action="RegisterServlet" method="GET">
		    		<span style="color:white;margin:50px;font-size:35px">Username</span><br>
		    		<input id="username" type="text" name="username"><br>
		    		<span style="color:white;margin:50px;font-size:35px">Password</span><br>
		    		<input id="password" type="text" name="password"><br>
		    		<span style="color:white;margin:50px;font-size:35px">Confirm Password</span><br>
		    		<input id="confirm" type="text" name="confirm"><br>
		    		<span style="color:white;margin:50px;font-size:35px"><%=registererror %></span><br>
		    		<input id="Submit" type="submit" value="Register"> 
		    	</form>
	    	</div>
	    </div>
	    <div class='bg-img'></div>

	</body>
</html>