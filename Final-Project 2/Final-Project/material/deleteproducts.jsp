<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lp.form.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.lp.dao.AppDAO"%>
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
					<h3>Delete Product</h3>
					<%
						}
					%>
					<form action="deleteproducts.jsp" method="post">
						<%
							List<Product> prod = AppDAO.getProducts();
						%>

						<select name="editprodid">
							<%
								for (int i = 0; i < prod.size(); i++) {
							%>
							<option value="<%=prod.get(i).getId()%>"><%=prod.get(i).getId()%>
							</option>
							<%
								}
							%>
						</select> <input type="submit">
					</form>

					<%
						String editid = request.getParameter("editprodid");
						if (editid != null) {
							
							if(AppDAO.deleteProduct(Integer.parseInt(editid))==1)
							{
								response.sendRedirect("deleteproducts.jsp?status=success");
							}
							else
							{
								response.sendRedirect("deleteproducts.jsp?status=failed");	
							}
						}
					%>

				</div>

			</div>
			<!--End-login---->
			<div class="clear"></div>
			<div class="clear"></div>
			<div class="footer">
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

