<!DOCTYPE HTML>
<html>
<head>
<title>Creation of Credit Profile for E-Commerce Customers: user registration</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/responsiveslides.css">
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
		var password = document.login.password.value;

		if (username == "" || username == null) {
			alert("please enter username");
			return false;
		}
		if (password == "" || password == null) {
			alert("please enter password");
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
					<li><a href="login.jsp">Login</a></li>
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
					<h3>
						<font color="red" size="2"><%=status%></font>
					</h3>
					<%
						} else {
					%>
					<h3>User Registration</h3>
					<%
						}
					%>

					<form method="post" action="userregistration" name="login">
						<div>
							<span><label>User NAME</label></span> <span> <input
								name="username" type="text" class="textbox"></span>
						</div>
						<div>
							<span><label>Password</label></span> <span> <input
								name="password" type="password" class="textbox"></span>
						</div>
						<div>
							<span><label>Confirm Password</label></span> <span> <input
								name="cpassword" type="password" class="textbox"></span>
						</div>
						<div>
							<span><label>NAME</label></span> <span> <input
								name="name" type="text" class="textbox"></span>
						</div>
						<div>
							<span><label>Email</label></span> <span> <input
								name="email" type="text" class="textbox"></span>
						</div>
						<div>
							<span><label>Mobile</label></span> <span> <input
								name="mobile" type="text" class="textbox"></span>
						</div>
						
						<div>
							<span><label>Address</label></span> <span> <input
								name="address" type="text" class="textbox"></span>
						</div>
						<div>
							<span><input type="submit" value="Submit"
								onclick="return validate()"> &nbsp;&nbsp;&nbsp;&nbsp;<a
								href="forgotpassword.jsp">forgot password</a></span>
						</div>
					</form>
				</div>
			</div>
			<!--End-login---->
			<div class="clear"></div>
			<div class="clear"></div>
			<div class="footer">
				<div class="footer-left">
					<a href="index.html"><font size=5>Creation of Credit Profile for E-Commerce Customers</font></a>
				</div>
				<div class="footer-right">
					<p>
						
							
					</p>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!---End-content---->
	</div>
	<!---start-wrap--->
</body>
</html>

