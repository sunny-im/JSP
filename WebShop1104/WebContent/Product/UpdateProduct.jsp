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
			<h3>Products Update</h3><br>
		</div>	
	
	<table class="table table-hover">
	  	<thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">Title</th>
		      <th scope="col">Author</th>
		      <th scope="col">Date</th>
		    </tr>
	    </thead>
		<tbody>
			<%
				int i = products.size();
				for(ProductObj product : products) {
			%>
    <tr>
      <th scope="row"><%= i%></th>
      <td><%=product.getPname()%></td>
      <td><%=product.getPprice()%></td>
      <td><%=product.getPdescription()%></td>
      <td><a href="CheckProductView.jsp?id=<%=product.getPid() %>" class="btn" style="background-color: #ACC7B4;" role="button">Update &raquo;</a></td>
      <td><a href="DeleteCheckProduct.jsp?id=<%=product.getPid() %>" class="btn" style="background-color: #ACC7B4;" role="button">Delete &raquo;</a></td>
    </tr>

			<%
				i--;
				}
			%>
	
		</tbody>
	</table>
	
	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>