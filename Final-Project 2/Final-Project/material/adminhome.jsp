<!DOCTYPE HTML>
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
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
$('#category').change(function(event) {
        var categories = $("select#category").val();
        $.get('GetAutoSubCategoryServlet', {
        	categoryName : categories
        }, function(response) {

        var select = $('#subcategory');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
});
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
					<h3>Add Product</h3>
					<%
						}
					%>

					<form method="post" action="productreg" name="product">
						<div>
							<span><label>Prodcut Name</label></span> <span> <input
								name="productname" type="text" class="textbox"></span>
						</div>
				
						<div>
							<span><label>Manufactured Name</label></span> <span> <input
								name="mname" type="text" class="textbox"></span>
						</div>

						<div>
							<span><label>Price</label></span> <span> <input
								name="price" type="text" class="textbox"></span>
						</div>

						<div>
							<span><label>Select Category</label></span> <span> <select
								name="category" id="category">
									<%
																		
									List<String> cat = AppDAO.getCategoryList();								
										Iterator<String> iterator =cat.iterator();

										while (iterator.hasNext()) {
											String value = iterator.next();

											 
											
											System.out.println(value+"\t"+value);
									%>
									<option value="<%=value%>"><%=value%></option>
									<%
										}
									%>
							</select></span>
						</div>

						<div>
							<span><label>Description</label></span> <span> <textarea
									name="description" class="textbox"></textarea></span>
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

