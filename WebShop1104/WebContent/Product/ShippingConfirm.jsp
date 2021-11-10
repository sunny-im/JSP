<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	<div class = "alert alert-secondary" role="alert">
		 <h3> Order Info_Confirm </h3>
   </div>
	
	<%
		request.setCharacterEncoding("UTF-8");

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
	%>
	
		
	<div class = "container con-8 alert alert-success">
		<div class="text-center">
			 <h3> Order Receipt </h3>
		</div>
		
		<div class="row justify-content-between">
         <div class="col-4" align="left">
            <strong>Order Address</strong> <br> 
            Name : <% out.print(shipping_name); %><br> 
            Zip Code : <% out.print(shipping_zipCode);%><br> 
            Address : <% out.print(shipping_address);%><br>
            Account : <% out.print(shipping_account);%><br>
         </div>
         <div class="col-4" align="right">
            <p>   <em>Shipping Date: <% out.print(shipping_shippingDate); %></em>
         </div>
      </div>
      <div>
         <table class="table table-hover">         
         <tr>
            <th class="text-center">Product</th>
            <th class="text-center">Qty</th>
            <th class="text-center">Price</th>
            <th class="text-center">Total</th>
         </tr>
         <tr>
            <td class="text-center"><em><%out.print(shipping_pname);%> </em></td>
            <td class="text-center">1</td>
            <td class="text-center"><%out.print(shipping_pprice);%>WON</td>
            <td class="text-center"><%out.print(shipping_pprice);%>WON</td>
         </tr>
         <tr>
            <td> </td>
            <td> </td>
            <td class="text-right">   <strong>Total: </strong></td>
            <td class="text-center text-danger"><strong><%out.print(shipping_pprice);%> </strong></td>
         </tr>
         </table>         
            <a href="./ShippingThanks.jsp?pname=pname&pprice=pprice"  class="btn btn-success" role="button"> Done </a>
            <a href="./ShippintCancel.jsp" class="btn btn-secondary"   role="button"> Cancel </a>         
      </div>
   </div>   
	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>