<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>e-Book:Contact-Us</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.contact {
	padding: 4%;
	height: 400px;
	}

.col-md-3 {
	background: #c1f08b;
	padding: 4%;
	border-top-left-radius: 0.5rem;
	border-bottom-left-radius: 0.5rem;
}

.contact-info {
	margin-top: 10%;
}

.contact-info img {
	margin-bottom: 15%;
}

.contact-info h2 {
	margin-bottom: 10%;
}

.col-md-9 {
	background: #90a9df;
	padding: 3%;
	border-top-right-radius: 0.5rem;
	border-bottom-right-radius: 0.5rem;
}

.contact-form label {
	font-weight: 600;
}
</style>
</head>
<body >
	<%@include file="all_components/navbar2.jsp"%>

	<div class="container contact">
		<div class="row">
			<div class="col-md-3">
				<div class="contact-info">
					<h2>
						<u>Contact Us</u>
					</h2>
					<h4 class="font-weight-bold">We would love to hear from you !</h4>
					<br>
					<c:if test="${not empty msg }">
						<h3 class="text-center text-primary font-weight-bold">${msg }</h3>
						<c:remove var="msg" scope="session" />
					</c:if>
					<c:if test="${not empty errormsg }">
						<h3 class="text-center text-danger">${errormsg }</h3>
						<c:remove var="errormsg" scope="session" />
					</c:if>
				</div>
			</div>
			<form action="Comment" method="post" class="col-md-9">
				<div class="contact-form">
					<div class="form-group">
						<label class="control-label col-sm-2" for="fname">First
							Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="fname"
								placeholder="Enter First Name" name="fname">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="lname">Last
							Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="lname"
								placeholder="Enter Last Name" name="lname">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">Email:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email"
								placeholder="Enter email" name="email"required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="comment">Comment:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="5" id="comment"
								name="comment"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class=" text-center text-black">
							<button type="submit" class="btn btn-success mr-2">
								&nbsp;&nbsp;<b>Post</b>&nbsp;&nbsp;
							</button>
						</div>
						<div class="text-center font-weight-bold ">
							<a href="viewComment.jsp"style="color: black;">Do you want to view all comments ?</a>
						</div>
					</div>
				</div>
			</form>
		</div>
		</div><br><br><br><br><br><br><br><br><br><br><br>
		<div class="mt-5">
			<footer class="fixed-bottom">
				<%@include file="all_components/footer.jsp"%>
			</footer>
		</div>
</body>
</html>