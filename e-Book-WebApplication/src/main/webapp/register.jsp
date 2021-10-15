<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Register</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;max-width: 100%; overflow-x: hidden;">
	<%@include file="all_components/navbar.jsp"%>
	<div class=" register-bg"><br>
	<div class="container mt-4 p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center text-success" style="text-decoration: underline;">Registration Page</h4>

						<c:if test="${not empty successmsg}">
							<p class="text-center text-success">${successmsg }</p>
							<c:remove var="successmsg" scope="session"/>
						</c:if>

						<c:if test="${not empty  failedmsg}">
							<p class="text-center text-danger">${failedmsg }</p>
							<c:remove var="failedmsg" scope="session"/>
						</c:if>


						<form action="register"method="post" onsubmit="return validation()">
							<div class="form-group">
								<label for="name">Name</label> 
								<input type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter full name"  name="fname"  autocomplete="off">
							<span class="text-danger font-weight-bold" id="name-error"></span>
							</div>

							<div class="form-group">
								<label for="email">Email address</label> 
								<input type="text" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email"  name ="email">
									<span class="text-danger font-weight-bold" id="email-error"></span>
							</div>
							
							<div class="form-group">
								<label for="phone">Phone Number</label> 
								<input type="text" class="form-control" id="phone"
									aria-describedby="emailHelp" placeholder="Enter phone Number"  name="phno">
									<span class="text-danger font-weight-bold" id="phone-error"></span>
							</div>
							
							<div class="form-group">
								<label for="password">Password</label> 
								<input type="password" class="form-control" id="password">
									<span class="text-danger font-weight-bold" id="pass-error"></span>
							</div>
							
							<div class="form-group">
								<label for="conf-password">Confirm Password</label> 
								<input type="password" class="form-control" id="conf-password"
									placeholder="Password"  name="password">
									<span class="text-danger font-weight-bold" id="confpass-error"></span>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check" id="check"> 
								<label class="form-check-label" for="check" >Agree terms & conditions</label>
							</div><br>
							<div class="text-center">
							<button type="submit" class="btn btn-success"> <i class="fas fa-user-plus"></i> Register</button><br>
							<a href="login.jsp">Are you existing user ? Login</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div><br><br><br><br>
	<div class="fixed-bottom">
	<%@include file="all_components/footer.jsp" %>
	</div>
	
	
	<script type="text/javascript">
	
	
	function validation(){
		
		var name = document.getElementById('name').value;
		var email = document.getElementById('email').value;
		var phone = document.getElementById('phone').value;
		var password = document.getElementById('password').value;
		var confpass = document.getElementById('conf-password').value;
		
		//For chaecking isEmpty
		//For username is lessThan 3
		if(name == ""){
			document.getElementById('name-error').innerHTML = "** Please fill your name";
			return false;
		}
		if((name.length < 3 )||(name.lenght >21)){
			document.getElementById('name-error').innerHTML = "** Length must be between 3 and 21";
			return false;
		}
		if(!isNaN(name)){
			document.getElementById('name-error').innerHTML = "** Only Character are allowed";
			return false;
		}
		
		
		
		if(email == ""){
			document.getElementById('email-error').innerHTML = "** Please fill with your email";
			return false;
		}
		if(email.indexOf('@') <= 0){
			document.getElementById('email-error').innerHTML = "**Invalid  Position of &nbsp; '@' ";
			return false;
			
		}
		if((email.charAt(email.length-4)!='.') && (email.charAt(email.length-3)!='.')) {
			document.getElementById('email-error').innerHTML = "**Invalid Position of &nbsp; '.' ";
			return false;
			
		}
		
		
		
		if(phone == ""){
			document.getElementById('phone-error').innerHTML = "** Please give your phone no";
			return false;
		}
		if(isNaN(phone)){
			document.getElementById('phone-error').innerHTML = "** Please input only digits";
			return false;
		}
		if(phone.length !=10 ){
			document.getElementById('phone-error').innerHTML = "** Phone number must be 10 digits only";
			return false;
		}
		
		
		if(password == ""){
			document.getElementById('pass-error').innerHTML = "** Please fill your password";
			return false;
		}
		if((password.length < 5 )||(password.lenght >21)){
			document.getElementById('pass-error').innerHTML = "** Password shold be inbetween 5 & 12";
			return false;
		}

		
		
		if(confpass == ""){
			document.getElementById('confpass-error').innerHTML = "** Please confirm your password";
			return false;
		}
		if(password != confpass){
			document.getElementById('confpass-error').innerHTML = "** Password is not matched";
			return false;
		}
	}
	
	</script>
</body>
</html>