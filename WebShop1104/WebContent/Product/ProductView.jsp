<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.ProductObj"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product View</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
<div class="panel panel-success">
	<div class = "container">
		<h3>Product Information</h3><br>
	</div>	
		<%
		String a = request.getParameter("id");
		ProductObj product = (new ProductDAO()).getView(a);
		
	%>
		<div class = "container">
			<div class="row">
				<div class="col-ma-5">
					<img src= "/images/<%=product.getPfilename()%>" style="width:50%">
				</div>
				<div class = "col-md-6">
					<h4><%=product.getPname() %></h4>
					<p><b>Product 	 ID : <%=product.getPid()%>
					<p><b>Product Price : <%=product.getPprice()%>
					<p><%=product.getPdescription()%>
					<p><form action = "AddCart.jsp?id=<%=product.getPid() %>" method="post">
						<a href="ShippingInfo.jsp?pname=<%=product.getPname() %>&pprice=<%=product.getPprice() %>" class="btn" style="background-color: #ACC7B4; onclick="AddToCart()"> Order &raquo;</a>
						<a href="Cart.jsp" class="btn" style="background-color: #ACC7B4;"> Cart &raquo;</a>
						<a href="Products.jsp" class="btn" style="background-color: #ACC7B4;"> List &raquo;</a>
					</form>
				</div>
			</div>
		</div>
</div>	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>