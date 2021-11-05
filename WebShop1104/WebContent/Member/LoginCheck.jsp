<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<%
	String cid = request.getParameter("id");
	String cpass = request.getParameter("pw");
	/* String msg =""; */
	
	MemberDAO dao = new MemberDAO();
	int code = dao.login(cid,cpass);
	
	if (code == 1) {
		/* msg = "아이디가 존재하지 않습니다."; */
/* 		out.print("아이디가 존재하지 않습니다.");
		response.sendRedirect("JoinMember.jsp"); */
		out.print("<script>alert('ID does not exist.'); location.href='JoinMember.jsp';</script>");
	} else if (code == 2){
		/* msg = "비밀번호가 틀렸습니다."; */
		/* out.print("비밀번호가 틀렸습니다.");
		response.sendRedirect("LoginMember.jsp"); */
		out.print("<script>alert('Invalid PASSWORD. Please try again.'); location.href='/Member/LoginMember.jsp';</script>");
	} else {
		//성공, 세션부여 
		session.setAttribute("id", cid);
		/* response.sendRedirect("/Product/Products.jsp"); */
		out.print("<script>alert('" +cid+ " Welcome to Sunny's Shop.'); location.href='/Product/Products.jsp';</script>");
	}
%>
	<%-- <script>
		alert("<%=msg%>");
	</script> --%>
</body>
</html>
