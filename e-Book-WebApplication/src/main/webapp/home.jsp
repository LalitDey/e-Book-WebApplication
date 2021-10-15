<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: DashBoard</title>
</head>
<body>
	<h4>User: Home</h4>
	<c:if test="${not empty userobj } ">
		<h1>Name:${ userobj.name}</h1>
		<h1>Email:${userobj.email }</h1>

	</c:if>

</body>
</html>