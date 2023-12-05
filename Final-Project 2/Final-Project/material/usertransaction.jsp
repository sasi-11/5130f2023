<!DOCTYPE HTML>
<%@page import="com.lp.dao.AppDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.lp.dao.MyConnection"%>
<%@page import="com.lp.util.AppUtil"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ListIterator"%>
<%@page import="com.lp.form.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
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

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
<script src="http://www.google.com/jsapi"></script>
<script>
	google.load("jquery", "1");
</script>
<script src="js/jquery.autocomplete.js"></script>
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
						String status = request.getParameter("status");

						if (status != null) {
					%>
					<h3>
						<font color="red" size="2"><%=status%></font>
					</h3>
					<%
						} else {
					%>
					<h3>Products</h3>
					<%
						}
					%>

					<table id="customers">
						<tr>
							<th>Name</th>
							<th>Manufacture Name</th>
							<th>price</th>
							<th>Category</th>
							<th>Description</th>
							<th>Transaction Status</th>
							<th>Product Status</th>
							<th>Cancel</th>
						</tr>

						<%
							try {

								ResultSet rs = MyConnection
										.getConnection()
										.createStatement()
										.executeQuery(
												"select * from transactions where userid='"
														+ (String) request.getSession()
																.getAttribute("username") + "' and pstatus!='canceled'");

								while (rs.next()) {

									Product product = AppDAO.getProductById(rs.getInt(3));
						%>
						<tr>
							<td><%=product.getName()%></td>
							<td><%=product.getManifatcuredName()%></td>
							<td><%=product.getPrice()%></td>
							<td><%=product.getCategory()%></td>
							<td><%=product.getDescription()%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<%
								if(rs.getString(4).equals("delivered"))
								{
							%>
									<td><a href="usertransaction.jsp?tid=<%=rs.getInt(1)%>&tstatus=<%=rs.getString(4)%>&pstatus=returned">return</a></td>
							<%		
								}
								else
								{
							%>
									<td><a href="usertransaction.jsp?tid=<%=rs.getInt(1)%>&tstatus=<%=rs.getString(4)%>&pstatus=canceled">cancel</a></td>
							<%		
								}
							%>
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
						String tid = request.getParameter("tid");
						String pstatus=request.getParameter("pstatus");
						String tstatus=request.getParameter("tstatus");
						
						if(tid!=null && pstatus!=null  && tstatus!=null)
						{
							if(pstatus.equals("canceled"))
							{
								System.out.println("p status :\t"+pstatus);
								System.out.println("t status :\t"+tstatus);
							
								int points=0;
								
								System.out.println(tstatus);
								
								if(tstatus.equals("placed"))
								{
									points=2;
								}
								
								if(tstatus.equals("processing"))
								{
									points=2;
								}
								
								if(tstatus.equals("processed"))
								{
									points=3;
								}
								
								if(tstatus.equals("packing"))
								{
									points=4;
								}
								
								if(tstatus.equals("shipping"))
								{
									points=7;
								}
								
								if(tstatus.equals("delivering"))
								{
									points=10;
								}
								
								System.out.println("points :\t"+pstatus);
								
								if(points!=0)
								{
									AppDAO.updatePoints((String) request.getSession().getAttribute("username"),points);
								}
							}
							
							if(AppDAO.updateProductStatus(Integer.parseInt(tid),pstatus)==1)
							{
								response.sendRedirect("usertransaction.jsp?status=Your are "+pstatus);
							}
							else
							{
								response.sendRedirect("usertransaction.jsp?status=failed");
							}
						}
					%>
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

