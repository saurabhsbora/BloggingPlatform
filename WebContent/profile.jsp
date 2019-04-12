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
						int uid = (int) session.getAttribute("id");
         			%> 
            		<form action=Logout>
            		<input type="submit" value="Logout" class="btn-design"/>
            		</form>
				</section>
			</header>
		</section>
		
		<%
			String driver = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String database = "bloggingplatform?autoReconnect=true&useSSL=false";
			String userid = "root";
			String password = "";
			try {
			Class.forName(driver);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
		%>
		<%
			try{
				String sql = "";
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				sql ="select count(*) from posts where user_id = '" + uid + "'";
				resultSet = statement.executeQuery(sql);
				 while (resultSet.next()) 
				 {
					ctr =  resultSet.getInt(1);
				 }
				} 
			catch (Exception e) 
			{
				e.printStackTrace();		
			}
		%>
		
		
		<div class = "headnav" style = "margin-top:124px;position: relative;z-index: 99998;"></div>
		<div class = "home-container" style="height:100%;">
			<h3 align="center">Profile Details</h3>
			<div style="margin: 0 auto;width:650px;">	
				<span class="label-text">Name : <%=name %></span><br><br>  
				<span class="label-text">Email-ID : <%=username %></span><br><br>
				<span class="label-text">No of posts published : <%=ctr %></span><br><br>
				<form action=changePassword.jsp>
            	<input type="submit"  style="margin-left:0px" value="Change Password" class="btn-design"/>
            	</form>
			</div>
		</div>
	</section>
</body>
</html>
		
	