<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookOrderImplement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Orders</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
	.design
	{
	 margin-left: 85vw;	
	}
</style>
</head>
<body style="background-color: #f7f7f7" >
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<h3 class="text-center">Hello! Admin</h3>
	
	

<div class="oders_bg">
	<table class="table table-striped body-content">
		<thead class="bg-success">
			<tr>
				<th scope="col">Order Id</th>
				<!--  <th scope="col">Name</th>-->
				<th scope="col">Email</th>
				<th class="address">Address</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
				<th scope="col">Order Time</th>
				
				
			</tr>
		</thead>
		<tbody>
		
		<%
		BookOrderImplement dao = new BookOrderImplement(DBConnect.getConn());
		List<BookOrder> list=dao.getAllOrderBooksOnAdminPanel();
		
		for(BookOrder bo4admin:list){%>
			
			<tr>
				
				<th ><%=bo4admin.getOder_id() %></th>
				<!--  <td><%=bo4admin.getUser_name() %></td> -->
				<td><%=bo4admin.getEmail() %></td>
				<td class="address"><%=bo4admin.getFullAdd() %></td>
				<td><%=bo4admin.getPhone() %></td>
				<td><%=bo4admin.getBook_name() %></td>
				<td><%=bo4admin.getAuthor() %></td>
				<td><%=bo4admin.getPrice() %></td>
				<td><%=bo4admin.getPaymentType() %></td>
				<td><%=bo4admin.getOrder_time()%></td>
				<td class="form-group">
								
			</tr>			
		<%}	
		%>	
		</tbody>
	</table>
</div>

		
		

	<div style="margin-top: 110px">
		<br>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>