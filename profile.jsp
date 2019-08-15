<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
ArrayList<String> history =(ArrayList<String>) request.getAttribute("history");
String username=(String)session.getAttribute("username");
%>

<html>
	<input id="tablelength" value="">
	<head>
		<meta charset="UTF-8">
		<title>Search History</title>
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
		    #title{
		    	position: absolute;
		    	text-align: center;
		    	margin-top:130px;
				width:1920px;
		    	color:white;
		    	font-size:50px;
		    }
		    table{
				display: block;
				font-family: Reg;
				position: absolute;
				top: 25%;
				left: 35%;
				right:35%;
				width: 30%;
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
				width:30%;
				border-top: 1px solid white;
				font-family: AvenirNext;
				font-size: 40px;
			}
			
			
			tr:hover {background-color:rgba(255,255,255,0.4)}
			
		</style>
	</head>
	<body>
		<div id="header">
	    	<a id = "Header" href="homepage.jsp"> Weather Meister</a>
	    	<form action="signout" method="GET" style="display:inline"> <button id = "Header2" type="submit">Sign Out</button></form>
			<form action="toprofile" method="GET" style="display:inline"> <button id = "Header1" type="submit">Profile</button></form>
	    </div>
		    <div id="title">
				<%=username %>'s Search History
		    </div>
	    	<table id="mytable">
			<%for(int i=history.size()-1;i>=0;i--) {%>
				<tr>
					<td><%=history.get(i) %></td>
				</tr>
			<%}
			for(int i=19-history.size();i>=0;i--){ %>
				<tr>
					<td></td>
				</tr>
			<%}%>
			</table>
	    <div class='bg-img'></div>

	</body>
</html>