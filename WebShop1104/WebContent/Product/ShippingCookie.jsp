<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	
    	Cookie pname = new Cookie("shipping_pname", URLEncoder.encode(request.getParameter("pname"), "utf-8"));
    	Cookie pprice = new Cookie("shipping_pprice", URLEncoder.encode(request.getParameter("pprice"), "utf-8"));
    	Cookie name = new Cookie("shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
    	Cookie shippingDate = new Cookie("shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
    	Cookie account = new Cookie("shipping_account", URLEncoder.encode(request.getParameter("account"), "utf-8"));
    	Cookie zipCode = new Cookie("shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
    	Cookie address = new Cookie("shipping_address", URLEncoder.encode(request.getParameter("address"), "utf-8"));
    	
    	pname.setMaxAge(365 * 24 * 60 * 60);
    	pprice.setMaxAge(365 * 24 * 60 * 60);
    	name.setMaxAge(365 * 24 * 60 * 60);
    	shippingDate.setMaxAge(365 * 24 * 60 * 60);
    	account.setMaxAge(365 * 24 * 60 * 60);
    	zipCode.setMaxAge(365 * 24 * 60 * 60);
    	address.setMaxAge(365 * 24 * 60 * 60);
    	
    	response.addCookie(pname);
    	response.addCookie(pprice);
    	response.addCookie(name);
    	response.addCookie(shippingDate);
    	response.addCookie(account);
    	response.addCookie(zipCode);
    	response.addCookie(address);
    	
    	response.sendRedirect("ShippingConfirm.jsp");
    	
    
    %>