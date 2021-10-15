<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Login</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;max-width: 100%; overflow-x: hidden;overflow-y: hidden;">
	<%@include file="all_components/navbar.jsp"%>
	<div class="login-bg">
	<div class="container p-4 ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center" style="text-decoration: underline;">Login Page</h4>
						
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						
						
						
						<form class="mt-4" action="login"method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required name="email">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input type="password" class="form-control" id="exampleInputPassword1" required name="password">							
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Login</button><br>
							<br><a href="register.jsp"><i class="fas fa-user-plus"></i> Register Here!</a>
							</div>
							
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>



<div class="fixed-bottom">
		<%@include file="all_components/footer.jsp"%>
	</div>

</body>
</html>