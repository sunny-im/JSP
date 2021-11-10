<%@page import="DAO.MemberDAO"%>
<%@page import="DAO.MemberObj"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member View</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
<div class="panel panel-success">
	<div class = "container">
		<h3>Member Information</h3><br>
	</div>	
	
	<%
		String a = request.getParameter("id");
		MemberObj member = (new MemberDAO()).getView(a);
	%>
	
  <div class="container">
         <div class="form-group  row">
            <label class="col-sm-2 ">ID</label>
            <div class="col-sm-3">
               <%=member.getCid() %>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">NAME</label>
            <div class="col-sm-3">
               <%=member.getCname() %>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">GENDER</label>
            <div class="col-sm-10">
               <%=member.getCgender() %>
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">BIRTH</label>
            <div class="col-sm-4  ">
               <%=member.getCbirth() %>
            </div>
         </div>
         <div class="form-group  row ">
            <label class="col-sm-2">EMAIL</label>
            <div class="col-sm-3">
               <%=member.getCemail() %>
            </div>            
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">PHONE</label>
            <div class="col-sm-3">
               <%=member.getCphone() %>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">ADDRESS</label>
            <div class="col-sm-5">
               <%=member.getCaddress() %>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">Registration DATE</label>
            <div class="col-sm-5">
               <%=member.getCregiday() %>
            </div>
         </div>
         <a href="#" class="btn" style="background-color: #ACC7B4;" role="button">Update &raquo;</a>
         <a href="DeleteMember.jsp?id=<%=member.getCid() %>" class="btn" style="background-color: #ACC7B4;" role="button">Delete &raquo;</a>
  
   </div>
  </div>
	<%@ include file = "/footer.jsp" %>	
</body>
</html>