<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:Address Update</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #dbd1d06e">
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${empty userobj }">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
			<h2 class="text-center text-success mt-3 p-1">Add Address</h2>
				<div class="card mt-5">
					<div class="card-body ">
						
							<form action="">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-6">
									<label for="Landmark">&nbsp;Landmark</label> <input type="text"
										class="form-control" id="Landmark">
								</div>
								<div class="form-group col-md-5">
									<label for="State">&nbsp;State</label> <input type="text"
										class="form-control" id="State"">
								</div>
								<div class="form-group col-md-4">
									<label for="City">&nbsp;City</label> <input type="text"
										class="form-control" id="City">
								</div>								
								<div class="form-group col-md-3">
									<label for="Zip-Code">&nbsp;Zip-Code</label> <input type="text"
										class="form-control" id="Zip-Code">
								</div>
								</div>
								<div class="text-center mt-4">
								<button href=""class="btn btn-warning">Add Address</button>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@include file="all_components/footer.jsp"%>
</body>
</html>