<%@page import="DAO.ShippingDAO"%>
<%@page import="java.net.URLDecoder"%>
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
	<div class = "container con-8 alert alert-success">
		<div class="text-center">
			 <h3> Order Complete </h3>
		</div>
		
	<%
		request.setCharacterEncoding("UTF-8");
		
		String pname = request.getParameter("pname");
		String pprice = request.getParameter("pprice");
		
		String shipping_pname = "";
		String shipping_pprice = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_account = "";
		String shipping_zipCode = "";
		String shipping_address = "";
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for( int i = 0; i < cookies.length ; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				
				if (n.equals("shipping_pname"))
					shipping_pname = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if (n.equals("shipping_pprice"))
					shipping_pprice = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if (n.equals("shipping_name"))
					shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if (n.equals("shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if (n.equals("shipping_account"))
					shipping_account = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if (n.equals("shipping_zipCode"))
					shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if (n.equals("shipping_address"))
					shipping_address = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}
		
		ShippingDAO dao = new ShippingDAO();
		
		String cid = "sunny";
		String ppricetotal = "0";
		
		int code = dao.insert(cid,shipping_pname,shipping_pprice, ppricetotal, shipping_account, shipping_address);
		
		if(code ==1 ) {
			response.sendRedirect("/Product/Products.jsp");
		}else {
			out.print("<script>alert('Failed to upload :( Try again '); location.href='AddProduct.jsp';</script>");
		}
	%>
		<div class="container">
			<h2 class="alert alert-success">Thank you for ordering.</h2>
		</div>
		
		
		
	</div>
	<%@ include file = "/footer.jsp" %>	
</body>
</html>