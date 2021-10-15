<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Ebook:Contact-Us</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">

</style>
</head>
<body style="background-color: #dbd1d06e">

 	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${empty userobj }">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-5 offset-md-3">
				<div class="text-center mt-5 p-5">
					<div class="text-success">
						<i class="fas fa-phone-square-alt fa-6x"></i>
					</div>
					<div class="text-black mt-4">
						<h3>24 * 7 Service</h3>
						<h4>Help-Line Number</h4>
						<i class="far fa-hand-point-down fa-1x"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
							class="far fa-hand-point-down fa-1x"></i>
						<h5>ph.no-+919583911973</h5>
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