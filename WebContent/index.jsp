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
	<script src="index.js"></script>
</head>

<body>
	<section class = "site-main">
		<section id ="mainbar" class = "headnav">	
			<header>
				<svg height="60" width="300">
					<a xlink:href="#">
						<text fill="black" font-size="30" x="4" y="40">Blogging</text>
					</a>
				Sorry, your browser does not support inline SVG.
				</svg>
				<section class = "head">
				<!--<form id="sf">
						<input type="search" placeholder="Search">
					</form>-->
					<%
					    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                		String username = (String) session.getAttribute("user");
						String name = (String) session.getAttribute("name");
                		if (username == null) {
            		%>
					<button id = "topbutton">Get Started</button>
					<% } else {
         			%>
            		<p style="margin-right:10px;">Hello, <%=name %></p> 
            		<form action=createPost.jsp>
            		<input type="submit" value="New Post" class="btn-design"/>
            		</form>
            		<form action=profile.jsp>
            		<input type="submit" value="Profile" class="btn-design"/>
            		</form>
            		<form action=Logout>
            		<input type="submit" value="Logout" class="btn-design"/>
            		</form>
        			<% }%>
				</section>
			</header>
			<nav id ="navbar">
				<ul>
					<li><a href="#" class = "active">HOME</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=CULTURE">CULTURE</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=TECH">TECH</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=STARTUPS">STARTUPS</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=SELF">SELF</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=POLITICS">POLITICS</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=DESIGN">DESIGN</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=HEALTH">HEALTH</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=SCIENCE">SCIENCE</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=POPULAR">POPULAR</a></li>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=COLLECTIONS">COLLECTIONS</a></li>
					<%
                		if (username == null) {
            		%>
					<li class = "nav-item"><a href="multipostLayout.jsp?topic=MORE">MORE</a></li>
					<% } else {
         			%>
            		<li class = "nav-item"><a href="multipostLayout.jsp?topic=YOUR POSTS">YOUR POSTS</a></li>
        			<% }%>
				</ul>
			</nav>
			<!-- <script>
				window.onscroll = function() {myFunction();};
				var mainbar = document.getElementById("mainbar");
				var navbar = document.getElementById("navbar");
				var sticky = navbar.offsetTop;

				function myFunction() {
				  console.log('Hello'); 	
				  if (window.pageYOffset >= sticky) 
				  {
					mainbar.classList.add("fixhead");
					navbar.classList.add("sticky");
				  } 
				  else 
				  {
					mainbar.classList.remove("fixhead");
					navbar.classList.remove("sticky");
				  }
				}
			</script> -->
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
				          <input type="reset" value="Reset" class="btn" style="margin-left: 28px;"/>
				          <p class="text-p">Don't have an account? <a onclick="opentab(event, 'Register',1)" style="cursor: pointer;">Sign up</a> </p>
				      	  <p class="text-p"><a href="ForgotPassword.jsp">Forgot your password?</a></p>
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
				          <input type="reset" value="Reset" class="btn" style="margin-left: 28px;"/>
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
		%>
		<div class = "headnav" style = "margin-top:124px;position: relative;z-index: 99998;"></div>
		<div class = "home-container" style="height:100%;">
			<section class = "hero-container">
					<%
						try{
							String sql = "";
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							sql ="select * from posts where user_id = 1";
							resultSet = statement.executeQuery(sql);
							resultSet.next();
							int post_id = resultSet.getInt("post_id");
							String title = resultSet.getString("title");
							String content = resultSet.getString("content");
							String authorname = resultSet.getString("authorname");
					%>
				<div class = "large-card">
					<div class = "hero-post">
						<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="longbackimg" src="getImage.jsp?post_id=<%=post_id%>"/></a>
						<div class ="post-content">
							<div class = "post-title">
								<a href = "singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><h3 class="post-heading"><%=title %></h3></a>
								<div class="post-exerpt"><%=content %></div>
							</div>
							<div class = "hero-line">
								<div class = "post-meta" style="display: inline;"><%=authorname %></div>	
								<time style="font-size:12px;display: inline-block;margin-top:3px">Jan 9</time>
							</div>
						</div>	
					</div>
				</div>
				<div class = "small-card-container">
					<%
						resultSet.next();
						post_id = resultSet.getInt("post_id");
						title = resultSet.getString("title");
						content = resultSet.getString("content");
						authorname = resultSet.getString("authorname");
					%>
					<div class = "small-card">
						<div class = "hero-post" style="height:100.8px;display:flex;">
							<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="smallbackimg" src="getImage.jsp?post_id=<%=post_id%>"/></a>
							<div class ="spost-content">
								<div class = "spost-title">
									<a href = "singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><h3 class="spost-heading"><%=title%></h3></a>	
								</div>
								<div class = "hero-line">
									<div class = "post-meta" style="display: inline;"><%=authorname %></div>	
									<time style="font-size:12px;display: inline-block;margin-top:3px">Jan 9</time>
								</div>
							</div>
						</div>
					</div>
					<%
						resultSet.next();
						post_id = resultSet.getInt("post_id");
						title = resultSet.getString("title");
						content = resultSet.getString("content");
						authorname = resultSet.getString("authorname");
					%>
					<div class = "small-card">
						<div class = "hero-post" style="height:100.8px;display:flex;">
							<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="smallbackimg" src="getImage.jsp?post_id=<%=post_id%>"/></a>
							<div class ="spost-content">
								<div class = "spost-title">
									<a href = "singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><h3 class="spost-heading"><%=title%></h3></a>	
								</div>
								<div class = "hero-line">
									<div class = "post-meta" style="display: inline;"><%=authorname %></div>	
									<time style="font-size:12px;display: inline-block;margin-top:3px">Jan 9</time>
								</div>
							</div>
						</div>
					</div>
					<%
						resultSet.next();
						post_id = resultSet.getInt("post_id");
						title = resultSet.getString("title");
						content = resultSet.getString("content");
						authorname = resultSet.getString("authorname");
					%>
					<div class = "small-card">
						<div class = "hero-post" style="height:100.8px;display:flex;">
							<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="smallbackimg" src="getImage.jsp?post_id=<%=post_id%>"/></a>
							<div class ="spost-content">
								<div class = "spost-title">
									<a href = "singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><h3 class="spost-heading"><%=title%></h3></a>	
								</div>
								<div class = "hero-line">
									<div class = "post-meta" style="display: inline;"><%=authorname %></div>	
									<time style="font-size:12px;display: inline-block;margin-top:3px">Jan 9</time>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
						resultSet.next();
						post_id = resultSet.getInt("post_id");
						title = resultSet.getString("title");
						content = resultSet.getString("content");
						authorname = resultSet.getString("authorname");
				%>
				<div class = "medium-card">	
					<div class = "hero-post" style="width: 100%;">
						<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="mediumbackimg" src="getImage.jsp?post_id=<%=post_id%>"/></a>
						<div class ="mpost-content">
							<div class = "mpost-title">
								<a href = "singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><h3 class="mpost-heading"><%=title%></h3></a>
								<div class="mpost-exerpt"><%=content %></div>
							</div>
							<div class = "hero-line" style="padding-left: 25px;">
								<div class = "post-meta" style="display: inline;"><%=authorname %></div>	
								<time style="font-size:12px;display: inline-block;margin-top:3px">Jan 9</time>
							</div>
						</div>
					</div>
				</div>
				<%
					statement.close();
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
				%>
			</section>
			<!--Top Section Ends here-->
			<div class="featured-link-wrapper">
				<a class="featured-link" href="multipostLayout.jsp?topic=EDITOR">See all featured
					<span>
						<svg style="transform: translateY(-50%);fill: #03a87c;" width="19" height="19">
							<path d="M7.6 5.138L12.03 9.5 7.6 13.862l-.554-.554L10.854 9.5 7.046 5.692" fill-rule="evenodd"></path>
						</svg>
					</span>
				</a>
			</div>
			<div class="hero-divider"></div>
			<div class = "foreground">
				<div class="foreground-container">
					<div class ="bigpart">
						<!-- Categories start here-->
						<header class ="foreheading">
							<div class="adjust-flex">
								<span class ="fh">
									<a href="multipostLayout.jsp?topic=MEMBERS" style="color: rgba(0,0,0,.84);">Featured for members</a>
								</span>
								<a href="multipostLayout.jsp?topic=MEMBERS" style="display:flex;align-items:center;-webkit-box-align: center;">
									<span style="font-weight: 400;font-size: 15px;text-transform: uppercase;">More</span>
									<span class ="svgIcon">	
										<svg width="19" height="19">
											<path d="M7.6 5.138L12.03 9.5 7.6 13.862l-.554-.554L10.854 9.5 7.046 5.692" fill-rule="evenodd"></path>
										</svg>
									</span>
								</a>
							</div>
						</header>
						<!-- Each article-->
						<%
						try{
							String topicName = "MEMBERS";
							String sql = "";
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							sql ="select * from posts where category = '" + topicName + "'";
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
								int post_id = resultSet.getInt("post_id");
								String title = resultSet.getString("title");
								String content = resultSet.getString("content");
								String authorname = resultSet.getString("authorname");
						%>
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
								<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="custom-small" src="getImage.jsp?post_id=<%=post_id%>"/></a>
							</div>
						</article>
						<%
							}
							statement.close();
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>
						
						<!-- Categories start here-->
						<header class ="foreheading">
							<div class="adjust-flex">
								<span class ="fh">
									<a href="multipostLayout.jsp?topic=TECH" style="color: rgba(0,0,0,.84);">Technology</a>
								</span>
								<a href="multipostLayout.jsp?topic=TECH" style="display:flex;align-items:center;-webkit-box-align: center;">
									<span style="font-weight: 400;font-size: 15px;text-transform: uppercase;">More</span>
									<span class ="svgIcon">	
										<svg width="19" height="19">
											<path d="M7.6 5.138L12.03 9.5 7.6 13.862l-.554-.554L10.854 9.5 7.046 5.692" fill-rule="evenodd"></path>
										</svg>
									</span>
								</a>
							</div>
						</header>
						<!--Each Article-->
						<%
						try{
							String topicName = "TECH";
							String sql = "";
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							sql ="select * from posts where category = '" + topicName + "'";
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
								int post_id = resultSet.getInt("post_id");
								String title = resultSet.getString("title");
								String content = resultSet.getString("content");
								String authorname = resultSet.getString("authorname");
						%>
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
								<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>"><img class="custom-small" src="getImage.jsp?post_id=<%=post_id%>"/></a>
							</div>
						</article>
						<%
							}
							statement.close();
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>
					</div>
					<!--SideBar starts here-->
					<div class ="smallpart">
						<aside class ="sidebar">
							<a href="multipostLayout.jsp?topic=POPULAR">
								<div class="sh">
									<h3 class="sidebar-heading">Popular Articles</h3>
								</div>
							</a>
							<ol style="padding: 32px;list-style: none;list-style-image: none;margin: 0;">
								
							<%
							try{
								String topicName = "POPULAR";
								int ctr = 0;
								String sql = "";
								connection = DriverManager.getConnection(connectionUrl+database, userid, password);
								statement=connection.createStatement();
								sql ="select * from posts where category = '" + topicName + "'";
								resultSet = statement.executeQuery(sql);
								while(resultSet.next()){
									int post_id = resultSet.getInt("post_id");
									String title = resultSet.getString("title");
									String content = resultSet.getString("content");
									String authorname = resultSet.getString("authorname");
							%>	
							<% if(ctr == 0) {  %>
								<li class="sidebar-li">
									<div class="sidebar-serial">01</div>
									<div class="sidebar-content">
										<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>" style="width: 100%;flex: 0 0 auto;-webkit-box-flex: 0;overflow: hidden;">
											<h3 class="sidebar-content-heading"><%=title %></h3>
										</a>
										<div class="creditsWrapper">
											<div class="credits">
												<a href="#" style="color:rgba(0,0,0,.84);display:inline;"><%=authorname %></a>
											</div>
										</div>
										<div class="credits">
											<time style="line-height: 1.4;display: inline-block;font-size:12px">Jan 15</time>
										</div>
									</div>
								</li>
							<% } else if(ctr == 1){ %>
								<li class="sidebar-li">
									<div class="sidebar-serial">02</div>
									<div class="sidebar-content">
										<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>" style="width: 100%;flex: 0 0 auto;-webkit-box-flex: 0;overflow: hidden;">
											<h3 class="sidebar-content-heading"><%=title %></h3>
										</a>
										<div class="creditsWrapper">
											<div class="credits">
												<a href="#" style="color:rgba(0,0,0,.84);display:inline;"><%=authorname %></a>
											</div>
										</div>
										<div class="credits">
											<time style="line-height: 1.4;display: inline-block;font-size:12px">Jan 15</time>
										</div>
									</div>
								</li>
							<% } else if(ctr == 2){ %>
								<li class="sidebar-li">
									<div class="sidebar-serial">03</div>
									<div class="sidebar-content">
										<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>" style="width: 100%;flex: 0 0 auto;-webkit-box-flex: 0;overflow: hidden;">
											<h3 class="sidebar-content-heading"><%=title %></h3>
										</a>
										<div class="creditsWrapper">
											<div class="credits">
												<a href="#" style="color:rgba(0,0,0,.84);display:inline;"><%=authorname %></a>
											</div>
										</div>
										<div class="credits">
											<time style="line-height: 1.4;display: inline-block;font-size:12px">Jan 15</time>
										</div>
									</div>
								</li>
							<% } else if(ctr == 3){ %>
								<li class="sidebar-li">
									<div class="sidebar-serial">04</div>
									<div class="sidebar-content">
										<a href="singlePost.jsp?title=<%=title%>&post_id=<%=post_id%>&content=<%=content%>&authorname=<%=authorname%>" style="width: 100%;flex: 0 0 auto;-webkit-box-flex: 0;overflow: hidden;">
											<h3 class="sidebar-content-heading"><%=title %></h3>
										</a>
										<div class="creditsWrapper">
											<div class="credits">
												<a href="#" style="color:rgba(0,0,0,.84);display:inline;"><%= authorname %></a>
											</div>
										</div>
										<div class="credits">
											<time style="line-height: 1.4;display: inline-block;font-size:12px">Jan 15</time>
										</div>
									</div>
								</li>
								<% } %>
								<%
									ctr++;}
									statement.close();
									connection.close();
									} catch (Exception e) {
									e.printStackTrace();
									}
								%>
							</ol>
						</aside>
							<!--SideBar Ends Here-->
							<!-- <script>
								var sidebar = $('.sidebar').offset().top;
								$(window).scroll(function() {
									var y_scroll_pos = window.pageYOffset;
									var scroll_pos_test = sidebar;

								   if (y_scroll_pos >= scroll_pos_test-60)
								   {
										$('.sidebar').addClass('lock-sidebar');
								   }
								   else
								   {
										$('.sidebar').removeClass('lock-sidebar');
								   }
								});
							</script> -->
					</div>
				</div>
			</div>
			<!--Content Ends here-->
			<footer>
				<ul style="padding:0px;">
					<li class = "nav-item"><a href="aboutUs.jsp">About</a></li>
					<li class = "nav-item"><a href="contact.jsp">Contact</a></li>
					<li class = "nav-item"><a href="privacy.jsp">Privacy</a></li>
					<li class = "nav-item"><a href="sitemap.xml">Sitemap</a></li>
				</ul>
				<small>&copy; Copyright 2019, Blogging Platform</small>
			</footer>
		</div>
	</section>
</body>
</html>