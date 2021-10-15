<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDAOImpliments"%>
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
<title>Admin: All User</title>
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
				<th scope="col">User_Id</th>
				<th scope="col">User_Name</th>
				<th scope="col">User_Email</th>
				<th scope="col">User-Phone</th>
				<td>Take Action</td>
			</tr>
		</thead>
		<tbody>
			<%
			UserDAOImpliments dao = new UserDAOImpliments(DBConnect.getConn()); 
			List<User> list = dao.getAllUser();

			for (User u : list) {
			%>
			<tr>
				<td><%=u.getId()%></td>	
				<td><%=u.getName()%></td>
				<td><%=u.getEmail()%></td>
				<td><%=u.getPhno()%></td>	
				<td>
					<a onclick="return confirm('Are you sure to remove?')" href="" class="btn btn-danger">
					<i class="fas fa-trash-alt"></i>&nbsp;Remove</a>						
				</td>		
			</tr>

			<%
			}
			%>



		</tbody>
	</table>
	<div class="fixed-bottom">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>