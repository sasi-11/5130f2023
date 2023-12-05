<!DOCTYPE HTML>
<%@page import="com.lp.form.UserForm"%>
<%@page import="com.lp.form.Product"%>
<%@page import="com.lp.dao.AppDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.lp.dao.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<title> </title>
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

<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>

</head>
<body>
	<!---start-wrap--->
	<div class="wrap">
		<!---start-header--->
		<div class="header">
			<!---start-logo--->
			<div class="logo">
				<a href="index.html"><font size=10> Creation of Credit Profile for E-Commerce Customers
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
						<table id="customers">
							<tr>
								<th>Product Name</th>
								<th>User Name</th>
								<th>Mobile Name</th>
								<th>Email Name</th>
								<th>Address</th>
								<th>Manufacture Name</th>
								<th>price</th>
								<th>Description</th>
								<th>Transaction Status</th>
								<th>Product Status</th>
								<th>Update Status</th>
							</tr>

							<%
								try {

									ResultSet rs = MyConnection.getConnection().createStatement()
											.executeQuery("select * from transactions where pstatus!='canceled' and tstatus!='delivered'");

									while (rs.next()) {
										
									UserForm userForm=AppDAO.getUserById(rs.getString(2));
										
									Product product=AppDAO.getProductById(rs.getInt(3));		
								
							%>
							<tr>
								<td><%=product.getName()%></td>
								<td><%=userForm.getUserName()%></td>
								<td><%=userForm.getMobile()%></td>
								<td><%=userForm.getEmail()%></td>
								<td><%=userForm.getAddress()%></td>
								<td><%=product.getManifatcuredName()%></td>
								<td><%=product.getPrice()%></td>
								<td><%=product.getDescription()%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=rs.getString(5)%></td>
								<td>
									<form method="get" action="viewuserproducts.jsp">
										<input type="hidden" name="username" value="<%=userForm.getUserName()%>">
										<input type="hidden" name="tid" value="<%=rs.getString(1)%>">
									
										<div>
											
											<span><label>Select Status</label></span> <span> 
											
											<select name="orderstatus">
												<option value="processing">Processing</option>
												<option value="processed">Processed</option>
												<option value="packing">Packing</option>
												<option value="shipping">shipping</option>
												<option value="delivering">Delivering</option>
												<option value="delivered">Delivered</option>
											</select>
										</div>
										<div>
											<span><input type="submit" value="Update"
												onclick="return validate()"></span>
										</div>
									</form>
								</td>
							</tr>
							<%
								}

								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							%>

						</table>

						<%
							String tid=request.getParameter("tid");
							String orderStatus=request.getParameter("orderstatus");
							String username=request.getParameter("username");
							
							if(tid!=null && orderStatus!=null)
							{
								if(orderStatus.equals("delivered"))
								{
									AppDAO.addPoints(username,10);
								}
							
								if(AppDAO.updateTransactionStatus(Integer.parseInt(tid),orderStatus)==1)
								{
									response.sendRedirect("viewuserproducts.jsp?status=success");
								}
								else
								{
									response.sendRedirect("viewuserproducts.jsp?status=failed");
								}
							}
						%>
				</div>
			</div>
			<!--End-login---->
			<div class="clear"></div>
			<div class="clear"></div>
			<div class="footer">
				<div class="footer-left">
					<a href="index.html"><font size=5> Creation of Credit Profile for E-Commerce Customers</font></a>
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

