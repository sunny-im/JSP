<%@page import="DAO.MemberDAO"%>
<%@page import="DAO.MemberObj"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	
	<%
      ArrayList<MemberObj> members = (new MemberDAO()).getList();
   %>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col"></th>
	      <th scope="col">ID</th>
	      <th scope="col">NAME</th>
	      <th scope="col">EMAIL</th>
	      <th scope="col">PHONE</th>
	    </tr>
	  </thead>
	  <tbody>
            <%
               for (MemberObj member : members) {
            %>
		<tr>
	      <th scope="row">1</th>
		      <td><%=member.getCid() %></td>
		      <td><%=member.getCname() %></td>
		      <td><%=member.getCemail() %></td>
		      <td><%=member.getCphone() %></td>
		      <td><a href="" class="btn btn-secondary" role="button">상세정보 &raquo;</a></td>
   		</tr>
   		
         <%
         } 
         %>
		</tbody>
	</table>

	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>