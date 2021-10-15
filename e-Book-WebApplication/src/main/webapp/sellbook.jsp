<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:SellBook</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #dbd1d06e">

<c:if test="${empty userobj }">

<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<%@include file="all_components/navbar.jsp"%>
	<div class="container p-3 ">
		<div class="row ">
			<div class="col-md-4 offset-md-4">
			<h3 class="text-center text-success">Sell Old Book By User</h3>
			
			<c:if test="${not empty SuccessMsg }">
				<h4 class="text-center text-primary">${SuccessMsg }</h4>
				<c:remove var="SuccessMsg" scope="session"/>
			</c:if>
			<c:if test="${not empty FailedMsg }">
			<p class="text-center text-success">${FailedMsg }</p>
			<c:remove var="FailedMsg" scope="session"/>
			</c:if>
			
				<div class="card ">
					<div class="card-body ">
						<form action="addOldBook" method="post" enctype="multipart/form-data">
						
						<input type="hidden" value="${userobj.email }" name="user">    <!--  Access data From sesion varible which store all data of a user after successfully login -->
						
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name *</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname">

								<div class="form-group">
									<label for="exampleInputPassword1">Author Name *</label> <input
										type="text" class="form-control" id="exampleInputPassword1" name="author">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Price *</label> <input
										type="number" class="form-control" id="exampleInputPassword1" name="price">
								</div>
								<div class="form-group">
									<label for="exampleFormControlSelect1">Book-Category *</label> <select
										class="form-control" id="exampleFormControlSelect1" >
										<option>Old-Book</option>
										
									</select>
								</div>
								<div class="form-group">
									<label for="exampleFormControlFile1">Choose Book Pic *</label> <input
										type="file" class="form-control-file"
										id="exampleFormControlFile1" name="bimg">
								</div>
								<div class="text-center">

									<button type="submit" class="btn btn-primary text-white">Sell Book</button>
									<button type="reset" class="btn btn-danger  ml-4">Clear</button>

								</div>

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