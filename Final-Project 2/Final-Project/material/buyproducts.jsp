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

<script type="text/javascript">
	function validate() {
		
		var cname = document.productsearch.cname.value;
		var acno = document.productsearch.acno.value;
		var cvv = document.productsearch.cvv.value;
		var expdate = document.productsearch.expdate.value;

		if (cname == "" || cname == null) {
			alert("please enter valid Account Name");
			return false;
		}
		
		if (!isNaN(cname)) {
			alert("please enter valid  Name");
			return false;
		}
		
		if (isNaN(acno) || acno.length!=12) {
			alert("please enter valid Account number");
			return false;
		}
		if (isNaN(cvv) || cvv.length!=3) {
			alert("please enter valid  cvv");
			return false;
		}
		if (expdate == "" || expdate == null) {
			alert("please enter valid Expiry Date");
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

					<form method="get" action="buyproducts.jsp" name="productsearch">

						<div>
							<span><label>Enter Name on CARD</label></span> <span> <input
								name="cname" id="cname" type="text" class="textbox"></span>
						</div>

						<div>
							<span><label>Account Number</label></span> <span> <input
								name="acno" id="acno" type="text" class="textbox"></span>
						</div>

						<div>
							<span><label>CVV</label></span> <span> <input name="cvv"
								type="text" class="textbox"></span>
						</div>

						<div>
							<span><label>Expiry Date</label></span> <span> <input
								name="expdate" type="text" class="textbox" value="mm/yy"></span>
						</div>
						<%
							String[] products = request.getParameterValues("productid");

							float ammount = 0.0f;

							if (products != null) {
								request.getSession().setAttribute("products", products);

								for (String s : products) {
									ammount = ammount
											+ AppDAO.getProductPrice(Integer.parseInt(s));
								}
								
								request.getSession().setAttribute("amount",ammount);
							}
						%>
						<div>
							
							<%
							
							int points=AppDAO.getUserPoints((String) request.getSession().getAttribute("username"));
							
							System.out.println("original ammount "+ammount);
							
							if(points>100)
							{
								System.out.println("in if "+ammount);
								
								float discount=(10.0f/100)*ammount;
								
								System.out.println("discount "+discount);
								
								ammount=ammount-discount;
								
								System.out.println("after deduction "+ammount);
							}
						%>
						
							<span><label>Ammount</label></span> <span> <input
								name="amt" id="amt" value="<%=ammount%>" type="text"
								readonly="readonly" class="textbox"></span>
						</div>
						<div>
							<span><input type="submit" value="Submit"
								onclick="return validate()" ></span>
							<%
								if(points>=50)
								{
							%>
									 <a href="chashondelivery.jsp">cash on delivery</a>	
							<% 		
								}
								else
								{
							%>
									 <a href="#">Your are not Eligible for Cash on Delivery</a>	
							<% 	
								}
							%>	
						</div>
					</form>

					<%
						String cname = request.getParameter("cname");
						String acno = request.getParameter("acno");
						String cvv = request.getParameter("cvv");
						String expDate = request.getParameter("expdate");

						if (cname != null && acno != null && cvv != null && expDate != null) {
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
						}
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

