<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderImplement"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:MyOrders</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<c:if test="${empty userobj }">

		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container p-1">
	<h5 class="text-center text-primary mt-4">Your Order</h5>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th>OrderId</th>
					<th>Name</th>
					<th>Book_Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Payment Type</th>
					<th>Order Time</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			User u = (User)session.getAttribute("userobj");
			BookOrderImplement dao = new BookOrderImplement(DBConnect.getConn());
			List<BookOrder> blist=dao.getBooks(u.getEmail());
			
			for(BookOrder bo:blist){ %>
				
				<tr>
					<th><%=bo.getOder_id() %></th>
					<td><%=bo.getUser_name()%></td>
					<td><%=bo.getBook_name() %></td>
					<td><%=bo.getAuthor() %></td>
					<td><%=bo.getPrice() %></td>
					<td><%=bo.getPaymentType() %></td>
					<td><%=bo.getOrder_time() %><td>
				</tr>
				
		<%	}
			
			
			%>
			
				
				
			</tbody>
		</table>
	</div>
	
</body>
</html>