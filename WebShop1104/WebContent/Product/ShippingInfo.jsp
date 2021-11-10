<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	<div class = "alert alert-secondary" role="alert">
		 <h3> Order Info </h3>
   </div>
	<%
		String pname = request.getParameter("pname");
		String pprice = request.getParameter("pprice");
	%>
   <div class="container">
      <form name="newMember" class="form-horizontal"  action="ShippingCookie.jsp" method="post">
      	<input name="pname" type="hidden" value=<%=pname%>>
      	<input name="pprice" type="hidden" value=<%=pprice%>>
      
         <div class="form-group  row">
            <label class="col-sm-2 ">Product Name</label>
            <div class="col-sm-3">
               <input name="pname" type="text" class="form-control" disabled value=<%=pname%> >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">Product Price</label>
            <div class="col-sm-3">
               <input name="pprice" type="text" class="form-control" disabled value=<%=pprice%> >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">Name</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" placeholder="name" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Shipping Date</label>
            <div class="col-sm-3">
               <input type="text" name="shippingDate" type="text" class="form-control" placeholder="Shipping Date" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Account</label>
            <div class="col-sm-3">
               <input type="text" name="account" type="text" class="form-control" placeholder="Account" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Zip Code</label>
            <div class="col-sm-3">
               <input name="zipCode" type="text" class="form-control" placeholder="Zip Code" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Address</label>
            <div class="col-sm-10">
                <input name="address" type="text" class="form-control" placeholder="Address" >
            </div>
         </div>
         <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
               <input type="submit" class="btn" style="background-color: #ACC7B4;" value="SUBMIT " > 
               <input type="reset" class="btn" style="background-color: #ACC7B4;" value="CANCEL" onclick="reset()" >
            </div>
         </div>
      </form>
   </div>
	
	<%@ include file = "/footer.jsp" %>	
</body>
</html>