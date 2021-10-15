<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: DashBoard</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
a {
	font-weight: bold;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	color: #212a9a;
}
.logout{
	margin:auto;
}
</style>

</head>
<body >
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
<div class="admin-bg"><br>
	<div class="container " style="height: 66vh;">
		<h1 
			class="text-center mt-5">
			Hello! Admin &nbsp;<i class="fas fa-user-cog"></i>
		</h1>
		<div class="row mt-5 p-3">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-4x text-primary"></i><br>
							<h4>Add Book</h4>
							-------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<i class="fas fa-book-open fa-4x text-danger"></i><br>
							<h4>All Book</h4>
							-------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="order.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-4x text-warning"></i><br>
							<h4>Orders</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
				<div class="col-md-3">
				<a href="viewalluser.jsp">
					<div class="card ">
						<div class="card-body text-center">
							<i class="fas fa-users fa-4x text-success"></i>
							<h4>All-Users</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<br><br>

			
		</div>
	</div>
	</div><br>
	<div class="fixed-bottom">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>