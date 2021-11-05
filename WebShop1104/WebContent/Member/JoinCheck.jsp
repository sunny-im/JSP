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
	request.setCharacterEncoding("UTF-8");

	String cid = request.getParameter("id");
	String cpass = request.getParameter("password");
	String cname = request.getParameter("name");
	String cgender = request.getParameter("gender");
	
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");
	String cbirth = year + "/" + month + "/" + day;
	
	String cemail = request.getParameter("email");
	String cphone = request.getParameter("phone");
	String caddr = request.getParameter("address");
	/* String msg =""; */
	
	MemberDAO dao = new MemberDAO();
	int code = dao.join(cid,cpass,cname,cgender,cbirth,cemail,cphone,caddr);
	
	
	if (code == 1) {
		/* msg = "아이디가 존재하지 않습니다."; */
/* 		out.print("아이디가 존재하지 않습니다.");
		response.sendRedirect("JoinMember.jsp"); */
		out.print("<script>alert('congratulation!! registered as a Sunny's Shop member:)'); location.href='/Product/Products.jsp';</script>");
	} else {
		out.print("<script>alert('Failed to sign up :( Try again '); location.href='/Member/JoinMember.jsp';</script>");
	}

%>

</body>
</html>