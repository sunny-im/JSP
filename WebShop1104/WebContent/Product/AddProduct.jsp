<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	<div class="jumbotron">
      <div class="container">
         <h3 class="display-3">Add Product</h3>
      </div>
   </div>

   <div class="container">
      <form name="newProduct" class="form-horizontal"  action="AddCheck.jsp" method="post" enctype="multipart/form-data">
         <div class="form-group  row">
            <label class="col-sm-2 ">Product ID</label>
            <div class="col-sm-3">
               <input name="id" type="text" class="form-control" placeholder="product id" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Product Name</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" placeholder="product name" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Product Description</label>
            <div class="col-sm-3">
               <input name="description" type="textarea" class="form-control" placeholder="product description" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Product Price</label>
            <div class="col-sm-3">
               <input name="price" type="text" class="form-control" placeholder="product price" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Product Photo</label>
            <div class="col-sm-3">
               <input name="filename" type="file" class="form-control" >
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