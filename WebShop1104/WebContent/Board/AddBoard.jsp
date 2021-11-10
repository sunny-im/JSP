<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Board</title>
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	<div class="jumbotron">
      <div class="container">
         <h3>Add Board</h3><br>
      </div>
   </div>

   <div class="container">
      <form name="newProduct" class="form-horizontal"  action="AddCheck.jsp" method="post" enctype="multipart/form-data">
         <div class="form-group  row">
            <label class="col-sm-2">Title</label>
            <div class="col-sm-4">
               <input name="title" type="text" class="form-control" placeholder="Enter the Title" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Name</label>
            <div class="col-sm-4">
               <input name="name" type="text" class="form-control" placeholder="Enter the name" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">Content</label>
            <div class="col-sm-4">
               <textarea name="content" rows="15" class="form-control" placeholder="content" ></textarea>
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">File</label>
            <div class="col-sm-4">
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