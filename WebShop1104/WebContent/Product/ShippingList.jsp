<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ShippingDAO"%>
<%@page import="DAO.ShippingObj"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	<div class = "container">
		<h3>Shipping List</h3><br>
	</div>	
	
	<table class="table table-hover">
	  	<thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">Product</th>
		      <th scope="col">Price</th>
		      <th scope="col">Status</th>
		    </tr>
	    </thead>
		<tbody>
	
	<%
	
		ArrayList<ShippingObj> goods = (new ShippingDAO()).getList();
	
		int i = goods.size();
		for(ShippingObj good : goods) {
	%>
    
    <tr>
      <th scope="row"><%= i%></th>
      <td><%=good.getPname()%></td>
      <td><%=good.getPprice()%></td>
      <td><%=good.getPdate()%></td>
      <td><%=good.getPstatus()%></td>
    </tr>

			<%
				i --;			
				}
			%>
	
		</tbody>
	</table>
	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>