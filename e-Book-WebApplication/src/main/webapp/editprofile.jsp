<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:Profile Edit</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #dbd1d06e">
	<%@include file="all_components/navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-7 offset-md-3">
				<h2 class="text-center text-success mt-2">Edit Your Profile</h2>
				<div class="card mt-4">
					<div class="card-body">

						<c:if test="${not empty succMsg }">
							<h4 class="text-center">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty error }">
							<h4 class="text-center">${error }</h4>
							<c:remove var="error" scope="session" />
						</c:if>
						
						<c:if test="${not empty error }">
							<h4 class="text-center">${error }</h4>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="edit_profile" method="post">
							  <input type="hidden"value="${userobj.id }" name="id">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> 
									<input type="text"class="form-control" id="inputEmail4" name="name" value="${userobj.name }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" name="email" value="${userobj.email }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Ph.No</label> <input type="number"
										class="form-control" id="inputEmail4" name="phno" value="${userobj.phno }">
								</div>
							<!--  	<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="" value="${userobj.address }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="${userobj.landmark }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value="${userobj.city }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4"value="${userobj.state }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip-Code</label> <input type="text"
										class="form-control" id="inputPassword4" value="${userobj.pincode }">
								</div> -->
								<div class="form-group col-md-6 text-center m-auto">
									<label for="inputPassword4">Password</label> <input type="password"
										class="form-control" id="inputPassword4" name="password">
								</div>
							
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary text-white">Update</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="mt-3">
		<%@include file="all_components/footer.jsp"%>
	</footer>
</body>
</html>