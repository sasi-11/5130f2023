<!DOCTYPE HTML>
<%@page import="com.voidmain.service.MailSender"%>
<%@page import="com.lp.form.UserForm"%>
<%@page import="com.lp.dao.AppDAO"%>
<html>
<head>
<title></title>
<link href="css1/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css1/responsiveslides.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	$(function() {

		// Slideshow 1
		$("#slider1").responsiveSlides({
			maxwidth : 1600,
			speed : 600
		});
	});
</script>

<script type="text/javascript">
	function validate() {

		var username = document.login.username.value;

		if (username == "" || username == null) {
			alert("please enter username");
			return false;
		}
	}
</script>


</head>
<body>
	<!---start-wrap--->
	<div class="wrap">
		<!---start-header--->
		<div class="header">
			<!---start-logo--->
			<div class="logo">
				<a href="index.html"><font size=10>Creation of Credit Profile for E-Commerce Customers
						 </font></a>
			</div>
			<!---start-logo--->
			<!---start-top-nav--->
			<div class="top-nav">
				<ul>
					<li class="active"><a href="index.html">Home</a></li>
					<li><a href="login.jsp">User Login</a></li>
					<li><a href="login.jsp">Admin Login</a></li>
					<li><a href="newuser.jsp">User Registration</a></li>
				</ul>
			</div>
			<div class="clear"></div>
			<!---End-top-nav--->
		</div>
	</div>
	<!---End-header--->
	<!---start-content---->
	<div class="wrap">
		<div class="content">
			<!--start-login-->
			<div class="col span_2_of_3">
				<div class="contact-form">

					<%
						String status = request.getParameter("status");

						if (status != null) {
					%>
					<h3><font color="red" size="2"><%=status%></font></h3>
					<%
						} else {
					%>
					<h3>Forgot Password</h3>
					<%
						}
					%>
					
					<form method="get" action="forgotpassword.jsp" name="#">
						<div>
							<span><label>USERNAME</label></span> <span> <input
								name="username" type="text" class="textbox"></span>
						</div>
						<div>
							<span><input type="submit" value="Submit"
								onclick="return validate()"></span>
						</div>
					</form>
					
					<%
						String username=request.getParameter("username");
					
						if(username!=null)
						{
							UserForm userForm=AppDAO.getUserById(username);
							String password=userForm.getPassword();
							
							MailSender.mailsend(userForm.getEmail(),password);
							
							out.println("please check your mail");
						}
					%>
				</div>
			</div>
			<!--End-login---->
			<div class="clear"></div>
			<div class="clear"></div>
			<div class="footer">
				<div class="footer-left">
					<a href="index.html"><font size=5></font></a>
				</div>
				<div class="footer-right">
					
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!---End-content---->
	</div>
	<!---start-wrap--->
</body>
</html>

