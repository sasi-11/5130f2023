<!DOCTYPE HTML>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<html>
<head>
<title>Creation of Credit Profile for E-Commerce Customers: Login</title>
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

		var oldpassword = document.passwordchange.oldpassword.value;
		var newpassword = document.passwordchange.newpassword.value;

		if (oldpassword == "" || oldpassword == null) {
			alert("please enter oldpassword");
			return false;
		}

		if (newpassword == "" || newpassword == null) {
			alert("please enter newpassword");
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
					<li class="active"><a href="adminhome.jsp">Home</a></li>
					<li class="active"><a href="editproducts.jsp">EditProducts</a></li>
					<li class="active"><a href="deleteproducts.jsp">DeleteProducts</a></li>
					<li><a href="adminchangepassword.jsp">Change Password</a></li>
					<li><a href="viewuserproducts.jsp">Orders</a></li>
					<li><a href="logout.jsp">logout</a></li>
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
					<h3>Change Password</h3>
					<%
						}
					%>

					<form name="passwordchange" action="changePassword" method="get">
						<div>
							<span><label>Old Password</label></span> <span>
							 <input type="text" name="oldpassword"></span>
						</div>
						<div>
							<span><label>New Password</label></span> <span>
							 <input type="text" name="newpassword"></span>
						</div>
						<div>
							<span><input type="submit" value="Submit"
								onclick="return validate()"></span>
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