<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="java.util.ArrayList"%>
<%@ page import = "dao.*" %>

<%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("Login.html");
		return;
	} // 세션정보를 확인하여현재 로그인이 된 상태인지를 확인 한 수 로그인 상태가 아니면 로그인 페이지로 리다이렉트 

	session.setAttribute("id",uid);
	
	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
	
	String str = "<table align=center>";
	str += "<tr height = 40><td><b>작성글 리스트</b></td>";
	str += "<td align = right>";
	str += "<a href='FeedAdd.html'><button>글쓰기</button></a>";
	str += "</td></tr>'";
	
	for (FeedObj feed : feeds) {
		String img = feed.getImages(), imgstr="";
		if (img != null) {
			imgstr = "<img src='images/" + img + "' width = 240>";
		}
		
		str += "<tr><td colspan=2><hr></td></tr>";
		str += "<tr>";
		str += "<td>" + feed.getId() + "</td>";
		str += "<td><small>&nbsp;(" + feed.getTs() + ")</small></td>";
		str += "</tr>";
		str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
		str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
		
	}
	str += "</table>";
	out.print(str);
%>