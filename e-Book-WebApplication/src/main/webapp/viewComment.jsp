<%@page import="com.entity.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CommentDAOImplements"%>
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
	<div class="text-center mt-3">
	<a href="contact.jsp"><b>Go to comment page </b></a>
	</div>
	<div class="container mt-4 p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-danger">
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">LastName</th>
					<th scope="col">e-Mail</th>
					<th scope="col">Comment</th>
				</tr>
			</thead>
			<tbody>

				<%
	
	CommentDAOImplements dao = new CommentDAOImplements(DBConnect.getConn());
	List<Contact> list = dao.viewAllComments();
	
	for(Contact vac:list){%>

				<tr>
					<th><%=vac.getFirstName()%></th>
					<td><%=vac.getLastName() %></td>
					<td><b><%=vac.getEmail() %></b></td>
					<td><%=vac.getComment()%></td>
				</tr>
				<%}
	%>
			</tbody>
		</table>
	</div>
</body>
</html>