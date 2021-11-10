<%@page import="DAO.ProductObj"%>
<%@page import="DAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String a = request.getParameter("id");

	ProductDAO product = new ProductDAO();
	int code = product.delete(a);

	
	if (code == 1) {
		response.sendRedirect("UpdateProduct.jsp");
	} else {
		response.sendRedirect("UpdateProduct.jsp");
	}
%>
</body>
</html>