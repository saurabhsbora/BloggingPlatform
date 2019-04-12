<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		    
		<div class = "headnav" style = "margin-top:124px;position: relative;z-index: 99998;"></div>
		<div class = "home-container" style="height:100%;">
			<h3 align="center">Change Password</h3>  
			<form id = "changePassForm" action="ChangePassword" method="post" style="margin: 0 auto;width:650px;margin-bottom:110px;">
				<span class="label-text">Old-Password</span>
				<input class="inputPostForm" type="password" name="oldpass" placeholder="Enter old password.." required/>
				<span class="label-text">New-Password</span>
				<input id="newpassword" class="inputPostForm" type="password" name="newpass" placeholder="Enter new password.." required/>
				<span class="label-text">Confirm-Password</span>
    			<input class="inputPostForm" type="password" name="confirmpass" placeholder="Confirm new password.." required/><br>
    			<input type="checkbox" onclick="myFunction()" style="margin-top:10px;">Show Password <br>
    			<input type="submit" value="Submit" class="btn-design" style="margin:0px;margin-top:20px;float:left;"/>
    			<input type="reset" value="Reset" class="btn-design" style="margin:0px;margin-top:20px;float:right;"/>
    			<c:if test="${not empty errorMessage}">
			    	<p class = "error-msg"><c:out value="${errorMessage}"/></p>
			    </c:if>
			</form>
			<script>
				function myFunction() {
				  var x = document.getElementsByName("oldpass")[0];
				  var y = document.getElementsByName("newpass")[0];
				  var z = document.getElementsByName("confirmpass")[0];
				  if (x.type === "password") {
				    x.type = "text";
				    y.type = "text";
				    z.type = "text";
				  } else {
				    x.type = "password";
				    y.type = "password";
				    z.type = "password";
				  }
				}
				$(document).ready(function () {
			          $('#changePassForm').validate({
			              rules: {
			            	  confirmpass: {
			                  	required: true,
			                  	equalTo: "#newpassword"
			                  }
			              },
			              messages: {
			              	confirmpass: {
			              		equalTo: "Password doesn't match"
			              	}
			              }
			          });
			      });
			</script>
		</div>
	</section>
</body>
</html>