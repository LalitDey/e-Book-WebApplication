<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:Setting</title>
<%@include file="all_components/allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #dbd1d06e">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<%@include file="all_components/navbar.jsp"%>
		<%
			User u =(User)session.getAttribute("userobj");
		%>
	<div class="container">
	
	<c:if test="${not empty userobj }">
	<h2 class="text-center" style="text-transform: uppercase;"><i>Hello!&nbsp;${userobj.name }</i></h2>
	</c:if>
	
		
		<div class="row p-5">
			<div class="col-md-4">

				<a href="sellbook.jsp">

					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">

				<a href="userOLDbook.jsp">

					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-edit fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="orders.jsp">
					<div class="card mt-4">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-people-carry fa-3x"></i>
							</div>
							<h4>My-Orders</h4>
							<p>Track Order</p>
							
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="helpline.jsp">
					<div class="card mt-4">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-hands-helping fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24 * 7 Available</p>
							
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
<%@include file="all_components/footer.jsp"%>
</body>
</html>