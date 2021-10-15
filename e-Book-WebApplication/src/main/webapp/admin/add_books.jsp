<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

<div class="add-book-bg">
	<div class="container ">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-success"
							style="text-decoration: underline;">
							<i class="fas fa-plus-square"></i>&nbsp;Add Books&nbsp;<i
								class="fas fa-plus-square"></i>
						</h4>

						<c:if test="${not empty SuccessMsg}">
							<p class="text-center text-success">${SuccessMsg }</p>
							<c:remove var="SuccessMsg" scope="session" />
						</c:if>

						<c:if test="${not empty FailedMsg}">
							<p class="text-center text-danger">${FailedMsg }</p>
							<c:remove var="FailedMsg" scope="session" />
						</c:if>



						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book-Name</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author-Name</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Categories</label> <select
									name="btype" class="form-control"
									id="exampleFormControlSelect1">
									<option>--select--</option>
									<option>New Book</option>
									<option>Old Book</option>

								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book status</label> <select
									name="bstatus" class="form-control"
									id="exampleFormControlSelect1">
									<option>--select--</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="customFile">Choose Book Pic</label> <input
									type="file" name="bimg" class="form-control-file"
									id="customFile">

							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-success ">
									<i class="fas fa-plus-square"></i>&nbsp;Add-Book
								</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div><br><br>
	<div class="fixed-bottom">
		
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>