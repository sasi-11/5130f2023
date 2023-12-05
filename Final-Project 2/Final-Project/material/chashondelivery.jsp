<!DOCTYPE HTML>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.lp.dao.MyConnection"%>
<%@page import="com.lp.dao.AppDAO"%>
<html>
<head>
<title>
	</title>
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

<style type="text/css">
.CSSTableGenerator {
	width: 150%;
}
</style>
<link href="./css/table.css" rel="stylesheet" type="text/css"
	media="all" />

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
					<li class="active"><a href="userhome.jsp">Home</a></li>
					<li class="active"><a href="usertransaction.jsp">Transactions</a></li>
					<li class="active"><a href="recommended.jsp">Recommended</a></li>
					<li><a href="userchangepassword.jsp">Change Password</a></li>
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
						String userName = (String) request.getSession().getAttribute(
								"username");

						String[] pds = (String[]) request.getSession().getAttribute(
								"products");

						for (String pd : pds) {
							int pid = Integer.parseInt(pd);
							int rating = 0;

							PreparedStatement ps = MyConnection.getConnection()
									.prepareStatement(
											"insert into transactions values(?,?,?,?,?)");

							ps.setInt(1, 0);
							ps.setString(2, userName);
							ps.setInt(3, pid);
							ps.setString(4, "placed");
							ps.setString(5, "ordered");

							ps.executeUpdate();
						}

						response.sendRedirect("userhome.jsp?status=deliveredsoon");
					%>
				</div>
			</div>
		</div>
		<!--End-login---->
		<div class="clear"></div>
		<div class="clear"></div>
		<div class="footer">
			<div class="footer-left">
				<a href="index.html"><font size=5>Creation of Credit Profile for E-Commerce Customers
						</font></a>
			</div>
			<div class="footer-right">
				<p>
					Design by <a href="http://www.voidmaintechnologies.com">Voidmain
						Technologies</a>
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

