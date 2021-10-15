<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImplements"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:UserOldBook</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #dbd1d06e">
	<%@include file="all_components/navbar.jsp"%>
	<div class="container mt-4 p-5">
	
	<c:if test="${not empty sucmsg }">
	<h4 class="text-center text-danger">${sucmsg }</h4>
	<c:remove var="sucmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty errorMsg }">
	<h4 class="text-center text-dangerS">${errorMsg }</h4>
	<c:remove var="errorMsg" scope="session"/>
	</c:if>
	
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">BookId</th>
					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			
			<% 
				User u =(User)session.getAttribute("userobj");
				String email=u.getEmail();
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
				List<BookDetails> list=dao.getBookByOldBookByUser(email, "Old Book");
				for(BookDetails uobu:list){ %>
					
					<tr>
					<th scope="row"><%=uobu.getPhotoName() %></th>
					
					<td><%=uobu.getBookName() %></td>
					<td><%=uobu.getAuthor() %></td>
					<td><%=uobu.getPrice() %></td>
					<td><%=uobu.getBookCategory() %></td>
					<td ><a href="deleteOldBookByUser?email=<%=email %>&bid=<%=uobu.getBookId() %>" class="btn btn-danger">Delete</a></td>
				</tr>
					
			<%	}
			%>
			
				
				
			</tbody>
		</table>
	</div>
</body>
</html>