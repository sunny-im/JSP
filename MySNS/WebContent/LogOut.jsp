<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.invalidate();

	String str ="<p align = center><br>로그아웃 완료<br><br>";
	str += "<a href='Login.html'><button>로그인하기</button>";
	
	out.print(str);
%>