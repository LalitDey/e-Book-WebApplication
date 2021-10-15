<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
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
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%>






	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<h3 class="text-center">Hello! Admin</h3>

	<c:if test="${not empty SuccessMsg}">
		<h5 class="text-center text-success">${SuccessMsg }</h5>
		<c:remove var="SuccessMsg" scope="session" />
	</c:if>

	<c:if test="${not empty FailedMsg}">
		<h5 class="text-center text-danger">${FailedMsg }</h5>
		<c:remove var="FailedMsg" scope="session" />
	</c:if>


	<table class="table table-striped ">
		<thead class="bg-success">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());

			List<BookDetails> list = dao.getAllBooks();

			for (BookDetails b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>

				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-primary"><i class="far fa-edit"></i>&nbsp;Update</a>
					<a onclick="return confirm('Are you sure to delete?')" href="../delete?id=<%=b.getBookId()%>" class="btn btn-danger"><i
						class="fas fa-trash-alt"></i>&nbsp;Delete</a>						
						</td>
			</tr>

			<%
			}
			%>



		</tbody>
	</table><br><br><br>
	<div class="fixed-bottom">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>