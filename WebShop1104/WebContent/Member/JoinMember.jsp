<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>JOIN</title>
<script type="text/javascript">
	function checkForm(){
		if (!document.newMember.id.value) {
			alert("Enter your ID");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("Enter your Password");
			return false;
		}
		if (!document.newMember.password.value != document.newMember.password_confirm.value) {
			alert ("Please enter the same password");
			return false;
		}
		
	}
	
</script>
</head>
<body>
   <jsp:include page="/header.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h3>JOIN</h3><br>
      </div>
   </div>

   <div class="container">
      <form name="newMember" class="form-horizontal"  action="JoinCheck.jsp" method="post" onsubmit="return checkForm()">
         <div class="form-group  row">
            <label class="col-sm-2 ">ID</label>
            <div class="col-sm-3">
               <input name="id" type="text" class="form-control" placeholder="id" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">PASSWORD</label>
            <div class="col-sm-3">
               <input type="password" name="password" type="text" class="form-control" placeholder="password" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">CONFIRM PASSWORD</label>
            <div class="col-sm-3">
               <input type="password" name="password_confirm" type="text" class="form-control" placeholder="password confirm" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">NAME</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" placeholder="name" >
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">GENDER</label>
            <div class="col-sm-10">
               <input name="gender" type="radio" value="남" /> Male
               <input name="gender" type="radio" value="여" /> Female
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">BIRTH</label>
            <div class="col-sm-4  ">
               <input type="text" name="birthyy" maxlength="4" placeholder="yyyy" size="6"> 
               <select name="birthmm">
                  <option value="">MONTH</option>
                  <option value="01">1</option>
                  <option value="02">2</option>
                  <option value="03">3</option>
                  <option value="04">4</option>
                  <option value="05">5</option>
                  <option value="06">6</option>
                  <option value="07">7</option>
                  <option value="08">8</option>
                  <option value="09">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
               </select> <input type="text" name="birthdd" maxlength="2" placeholder="dd" size="4">
            </div>
         </div>
         <div class="form-group  row ">
            <label class="col-sm-2">EMAIL</label>
            <div class="col-sm-3">
               <input type="text" name="email" class="form-control" maxlength="50" placeholder="email">
            </div>            
         </div>
         <div class="form-group  row">
            <label class="col-sm-2">PHONE</label>
            <div class="col-sm-3">
               <input name="phone" type="text" class="form-control" placeholder="phone" >

            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">ADDRESS</label>
            <div class="col-sm-5">
               <input name="address" type="text" class="form-control" placeholder="address">

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
</body>
</html>