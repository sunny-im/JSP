<%@page import="DAO.BoardDAO"%>
<%@page import="DAO.BoardObj"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	<div class = "container">
		<h3>Board</h3><br>
	</div>	
	
	<%
		ArrayList<BoardObj> boards = (new BoardDAO()).getList();
	%>
	<table class="table table-hover">
	  	<thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">Title</th>
		      <th scope="col">Author</th>
		      <th scope="col">Date</th>
		    </tr>
	    </thead>
		<tbody>
			<%
				int i = boards.size();
				for(BoardObj board : boards) {
			%>
    <tr>
      <th scope="row"><%= i%></th>
      <td><a href="#" style="text-decoration-line: none; color:black;"><%=board.getBtitle()%></a></td>
      <td><%=board.getBauthor()%></td>
      <td><%=board.getBdate()%></td>
      <td><a href="BoardView.jsp?id=<%=board.getBno()%>" class="btn" style="background-color: #ACC7B4;" role="button">View &raquo;</a></td>
    </tr>

			<%
				i --;			
				}
			%>
	
		</tbody>
	</table>
	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>