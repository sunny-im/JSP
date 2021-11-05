<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.ProductObj"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	
	<%
		ArrayList<ProductObj> products = (new ProductDAO()).getList();
	%>
		<div class = "container">
			<h1 class = "display-3">Products</h1>
		</div>	
	<div class = "container">
		<div class="row" align="center">
			<%
				for(ProductObj product : products) {
			%>
			<div class="col-md-4">
				<h3><%=product.getPname() %></h3>
				<img src = "/images/<%=product.getPfilename()%>" style ="width: 100px; height: 100px;">
				<p><%= product.getPdescription() %>
				<p><%= product.getPprice() %>원
				<p><a href="#" class="btn" style="background-color: #ACC7B4;" role="button">Go description &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
	</div>	
	<hr>
	
	
	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>