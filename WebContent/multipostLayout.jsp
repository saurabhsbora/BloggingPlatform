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
				<svg width="2" height="29" style="margin-top:16px;">
					<path d="M1 29V1" stroke="#D5D5D5" stroke-width=".5" fill="none" stroke-linecap="round"></path>
				</svg>
				<%String topicName = request.getParameter("topic");%>
				<p class="topic"><%=topicName %></p>
				<section class = "head">
				<!--<form id="sf">
						<input type="search" placeholder="Search">
					</form>-->
					<%
						int uid = 0;
                		String username = (String) session.getAttribute("user");
						String name = (String) session.getAttribute("name");
                		if (username == null) {
            		%>
					<button id = "topbutton">Get Started</button>
					<% } else {
						uid = (int) session.getAttribute("id");
         			%>
            		<p style="margin-right:10px;">Hi, <%=name %></p> 
            		<form action=Logout>
            		<input type="submit" value="Logout" class="btn-design"/>
            		</form>
        			<% }%>
				</section>
			</header>
		</section>
		
		<div id="myModal" class="modal">
		    <div class="form-box">
		    	<div class="close"></div>
		    	<div class ="tab">
		    	   <button class="tablinks" onclick="opentab(event, 'Login',0)" id="defaultOpen">Login</button>
  				   <button class="tablinks" onclick="opentab(event, 'Register',0)">Register</button>
				</div>
			    <div id="Login" class="tabcontent">	
				      <form action="LoginController" id="login-form" method="post">
				      	<c:if test="${not empty errorMessage}">
			    			<script type="text/javascript">
			     				var modal = document.getElementById('myModal');
			     				modal.style.display = "block";
			     			</script>
			    			<p class = "error-msg"><c:out value="${errorMessage}"/></p>
			    		</c:if>
				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Email</span>
				            </label>
				            <input type="email" name="email" class="form-control" />
				          </div>
				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Password</span>
				            </label> 
				            <input type="password" name="password" class="form-control" />
				          </div>
				          <input type="submit" value="Login" class="btn" />
				          <p class="text-p">Don't have an account? <a onclick="opentab(event, 'Register',1)" style="cursor: pointer;">Sign up</a> </p>
				      </form>
			     </div>
			     
			     <div id="Register" class="tabcontent">
				      <form action="RegisterController" id="register-form" method="post">
				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Name</span>
				            </label>
				            <input type="text" name="name" class="form-control" />
				          </div>

				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Email</span>
				            </label>
				            <input type="email" name="email" class="form-control" />
				          </div>

				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Password</span>
				            </label> 
				            <input id = "password" type="password" name="password" class="form-control" />
				          </div>

				          <div class="form-group">
				            <label class="label-control">
				              <span class="label-text">Confirm Password</span>
				            </label> 
				            <input type="password" name="confirm_password" class="form-control" />
				          </div>

				          <input type="submit" value="Register" class="btn" />
				      </form>
			     </div>
			     
			     <script>
					function opentab(evt, tabName, action) 
					{
					  var tabcontent, tablinks;
					  tabcontent = document.getElementsByClassName("tabcontent");
					  tabcontent[0].style.display = "none";
					  tabcontent[1].style.display = "none";
					  
					  tablinks = document.getElementsByClassName("tablinks"); 
					  tablinks[0].className = tablinks[0].className.replace(" active", "");
					  tablinks[1].className = tablinks[1].className.replace(" active", "");
					  
					  document.getElementById(tabName).style.display = "block";
					  if(action == 0)
					  	evt.currentTarget.className += " active";
					  else
					  	tablinks[1].className += " active";
					}
					// Get the element with id="defaultOpen" and click on it
					document.getElementById("defaultOpen").click();
					</script>
		    </div>
		    </div>	   
		    <script type="text/javascript">
		      $(window).on('load',function(){
		        $('.form-group input').on('focus blur', function (e) {
		            $(this).parents('.form-group').toggleClass('active', (e.type === 'focus' || this.value.length > 0));
		        }).trigger('blur');
		      });

		      $(document).ready(function () {
		          $('#login-form').validate({
		              rules: {
		                  email: {
		                      required: true,
		                      email: true
		                  },
		                  password: {
		                      required: true
		                  }
		              }
		              // submitHandler: function(form) {
		              //   alert('valid form submitted');  
		              // }
		          });
		      });

		      jQuery.validator.addMethod("accept", function(value, element, param) {
  					return value.match(new RegExp("^" + param + "$"));
				});
		      $(document).ready(function () {
		          $('#register-form').validate({
		              rules: {
		              	  name: {
		              	  	required:true,
		              	  	accept: "[a-zA-Z]+"
		              	  },
		                  email: {
		                      required: true,
		                      email: true
		                  },
		                  password: {
		                      required: true,
		                      minlength: 6
		                  },
		                  confirm_password: {
		                  	required: true,
		                  	equalTo: "#password"
		                  }
		              },
		              messages: {
		              	name : {
		              		accept: "Enter a valid name"
		              	},
		              	password: {
		              		minlength : "At least 6 characters long"
		              	},
		              	confirm_password: {
		              		equalTo: "Password doesn't match"
		              	}
		              }
		          });
		      });
		      
		      var modal = document.getElementById('myModal');
				var btn = document.getElementById("topbutton");
				var span = document.getElementsByClassName("close")[0];
				var error_msg = document.getElementsByClassName("error-msg")[0];
				
				if(btn != null)
				{
					btn.onclick = function() {
						  modal.style.display = "block";
					}
				}
				

				span.onclick = function() {
				  modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				  if (event.target == modal) {
				    modal.style.display = "none";
				    error_msg.innerHTML = "";
				  }
				}
		    </script>
		
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
			boolean check = true;
		%>
		
		<div class = "headnav" style = "margin-top:124px;position: relative;z-index: 99998;"></div>
		<div class = "home-container" style="height:100%;">
			<section class="col-fh">
				<section class ="inner-col-fh">
					<%
						try{
							int ctr = 0;
							String sql = "";
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							if(topicName.equals("YOUR POSTS"))
								sql ="select * from posts where user_id = '" + uid + "'";
							else
								sql ="select * from posts where category = '" + topicName + "'";
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
								check = false;
								int post_id = resultSet.getInt("post_id");
								String title = resultSet.getString("title");
								String content = resultSet.getString("content");
								String authorname = resultSet.getString("authorname");
					%>
					
					<% if(ctr == 0) {  %>
					<div class="topPost">
						<div style="width:100%;height:100%;"><a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="largeimg" src="getImage.jsp?post_id=<%=post_id%>"/></a></div>
						<div class="topPost-subcontainer">
							<h1><a style="color: rgba(0, 0, 0, 0.84);" href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><%=title %></a></h1>
							<div style="margin-top: 4px;display: block;">
								<p style="font-size:17px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;">
									<a style="color: rgba(0,0,0,.54);" href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><%=content %></a>
								</p>
							</div>
							<div class = "hero-line">
								<div class = "post-meta" style="display: inline;"><%=authorname %></div>
							</div>
						</div>
					</div>
					<div class="hero-divider"></div>
					<% } else { %>
					<article class="post-preview">
							<div class="post-preview-post">
								<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>" style="width: 100%;overflow: hidden;">
									<h3 class="post-preview-heading"><%=title %></h3>
								</a>
								<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>">
									<div class ="summary"><%=content %></div>
								</a>
								<div class="justifySpace">
									<div class="caption">
										<a href="#" style="color:rgba(0,0,0,.84);padding-left:25px;font-weight:600;"><%=authorname %></a>
									</div>
									<div class="caption">
										<time style="line-height: 1.4;display:inline-block;font-size:12px;padding-left:25px;padding-bottom:20px;">Jan 26</time>
									</div>
								</div>	
							</div>
							<div style="width: 180px;-webkit-box-flex: 0;flex: 0 0 auto;">
								<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="post-preview-img custom-small" src="getImage.jsp?post_id=<%=post_id%>"/></a>
							</div>
					</article>
					<% } %>
				<%
					ctr++;}
					statement.close();
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
				%>
				<% if(check){  %>
					<h2 align="center">No posts yet!</h2>
				<% } %>
				</section>
			</section>
		</div>
	</section>
</body>
</html>