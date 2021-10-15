<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.CartDAOImplements"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Cart page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<c:if test="${ empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>


	</c:if>
	
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${ succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty error}">
		<div class="alert alert-danger text-center" role="alert">${ error}</div>
		<c:remove var="error" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row p-2 mt-2" style="border: 1px solid green;">
			<div class="col-md-6">
				<div class="card mt-3">
					<div class="card-body ">
						<h2 class="text-center text-success">Your Selected Items</h2>
						<table class="table table-striped">
							<thead>
								<tr class="text-success font-weight-bold">
									
									<th scope="col">Book_Name</th>
									<th scope="col">Book_Author</th>
									<th scope="col">Book_Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								
								
								<%
								User u = (User)session.getAttribute("userobj");
								
								CartDAOImplements dao = new CartDAOImplements(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								
								Double totalPrice=0.0;
								for(Cart c:cart){
									totalPrice = c.getTotalPrice();
									%>
								<tr class="text-primary font-weight-bold">
									
									<td><%=c.getBookName() %></td>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
									
							<%}%>
								<tr class="text-success font-weight-bold">
							
								<td><b>Total Price</b></td>
								<td></td>
								<td class="text-success"><i class="fas fa-rupee-sign"></i>&nbsp;<%=totalPrice %> </td>
								<td class="text-danger"> only /-</td>
								</tr>
								
									
							</tbody>
						</table>

					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mt-3">
					<div class="card-body">
						<h2 class="text-center text-success">Your Details for Order</h2>
						
						<form action="order"method="post"onsubmit="return validationForm()">
						
							<div class="form-row">
									<input type="hidden"value="${userobj.id }" name="id">
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputEmail4">Name</label> 
									<input type="text"class="form-control" id="inputEmail4" name="userName" value="${userobj.name }">
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputPassword4">Email</label>
									<input type="email"class="form-control" id="inputPassword4" name="email" value="${userobj.email }" >
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputEmail4">Ph.No</label> 
									<input type="number"class="form-control" id="inputEmail4" name="phone" value="${userobj.phno }" >
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputPassword4">Address</label> 
									<input type="text"class="form-control" name="address" id="inputPassword4" required>
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4"  name="city" required>
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label class="labelOfCartPage" for="zip-code">Zip-Code</label> <input type="text"
										class="form-control" id="zip-code" name="zipcode" required>
										<span class="font-weight-bold text-danger" id="zipcode-error"></span>
								</div>
							</div>
							<div class="form-group ">
								<label class="labelOfCartPage" for="inputState">Payment-Type</label> 
								<select id="inputState" class="form-control" name="paymentType">
									<option value="noselect">--select--</option>
									<option value="COD">Cash-on-Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-primary">Order Now</button> 
								<a href="index.jsp" class="btn btn-warning ml-2">Continue Shopping</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	function validationForm(){
		var zipcode = document.getElementById('zip-code').value;
		
		if(isNaN(zipcode))
		{
		document.getElementById('zipcode-error').innerHTML = "**Zip-code must be a number";
		return false;
		}
		
		if(zipcode.length != 6)
			{
			document.getElementById('zipcode-error').innerHTML = "**Zip-code must be 6 digit";
			return false;
			}
		
	}
	
	
	</script>
	
</body>
</html>