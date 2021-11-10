<%@page import="DAO.MemberObj"%>
<%@page import="DAO.MemberDAO"%>
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

	MemberDAO member = new MemberDAO();
	int code = member.delete(a);

	
	if (code == 1) {
		response.sendRedirect("MemberList.jsp");
	} else {
		response.sendRedirect("MemberList.jsp");
	}
%>
</body>
</html>