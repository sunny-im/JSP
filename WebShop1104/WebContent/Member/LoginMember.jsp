<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

    <style>
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="/Resource/CSS/signin.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
</head>

<body class="text-center">
<%@ include file = "/header.jsp" %>
<div class="text-center body-container">
		<form class="form-signin" action="/Member/LoginCheck.jsp" method="post">
			<img class="mb-4" src="/Resource/Image/hako.jpeg" alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-normal">Login</h1>
			<label for="inputEmail" class="sr-only">ID</label> 
			<input type="text" id="inputEmail" name="id" class="form-control" placeholder="Enter your ID" required autofocus> 
			<label for="inputPassword" class="sr-only">Password</label> 
			<input type="password" id="inputPassword" name="pw" class="form-control" placeholder="Enter your password." required>
	
			<button class="btn btn-lg btn-secondary btn-block" style="background-color: #ACC7B4;" type="submit">Login</button>
			<a href="/Member/JoinMember.jsp" class="btn btn-lg btn-secondary btn-block" style="background-color: #ACC7B4;">Join</a>
			
			<p class="mt-5 mb-3 text-muted">&copy; Sunny 2021</p>
		</form>
</div>
</body>
</html>