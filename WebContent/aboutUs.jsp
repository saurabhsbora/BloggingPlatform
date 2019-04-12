<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.*"%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Blogging Platform</title>
	<link rel="stylesheet" type="text/css" href="stylesheet.css" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
	<!--  <script src="index.js"></script>-->
</head>
<body>
	<section class = "site-main">
		<section id ="mainbar" class = "headnav bs">	
			<header>
				<svg height="60" width="150">
					<a xlink:href="index.jsp">
						<text fill="black" font-size="30" x="4" y="40">Blogging</text>
					</a>
				Sorry, your browser does not support inline SVG.
				</svg>
				<section class = "head">
				<!--<form id="sf">
						<input type="search" placeholder="Search">
					</form>-->
					<%
						int ctr = 0;
                		String username = (String) session.getAttribute("user");
						String name = (String) session.getAttribute("name");
						if (username == null) {
         			%>
         			<button id = "topbutton">Get Started</button>
					<% } else {%>
					<p style="margin-right:10px;">Hello, <%=name %></p>
            		<form action=Logout>
            		<input type="submit" value="Logout" class="btn-design"/>
            		</form>
            		<% }%>
				</section>
			</header>
		</section>
		
		
		<div class = "headnav" style = "margin-top:124px;position: relative;z-index: 99998;"></div>
		<div class = "home-container" style="height:100%;">
			<h3 align="center">About Us</h3>
			<div style="margin: 0 auto;width:650px;">
				<p>This blogging platform is developed with an aim to provide quality articles related to new technology, culture, literature etc. We aim to become one of the top blogging platform in the world. With an expert panel of developers and quality authors, we have already started to gain some reputation in the magazine world.</p>
			</div>
		</div>
	</section>
</body>
</html>