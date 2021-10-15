<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImplements"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: View Book</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-hover:hover {
	background-color: #e0e8df;
	cursor: pointer;
}
</style>
</head>
<body style="background-color: #dbd1d06e">
	<%@include file="all_components/navbar.jsp"%>
	
	<%
	
	User u = (User)session.getAttribute("userobj") ;
//	User u = new User();
	
	int bid=Integer.parseInt(request.getParameter("bid"));
	
	BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
	BookDetails b=dao.getBookById(bid);
	
	%>

	<div class="container p-3">
		<div class="row p-5">
		
		
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book_img/<%=b.getPhotoName() %>"
					style="height: 28vh; width: 12vw;" />
				<h4 class="mt-3">Name: <span class="text-success"><%=b.getBookName() %></span></h4>
				<h6>Author:<span class="text-success"><%=b.getAuthor() %></span></h6>
				<h6>Category:<span class="text-success"><%=b.getBookCategory() %></span></h6>
			</div>
			
			
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><u><%=b.getBookName() %></u></h2>
				
				<%
					if("Old Book".equals(b.getBookCategory())){ %>
						
						<h5 class="text-primary">Contact to Seller</h5>
						<h5 class="text-primary"><i class="far fa-envelope "></i>&nbsp;Email:<%=b.getEmail() %></h5>
						
						
						
				<%	}
				%>
				
				<div class="row mt-5">
					<div class="col-md-4  text-center">
						<i class="text-primary fas fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4  text-center">
						<i class="text-danger fas fa-undo-alt fa-2x"></i>
						<p>Easy Return</p>
					</div>
					<div class="col-md-4  text-center">
						<i class="text-success fas fa-truck fa-2x"></i>
						<p>Fast Delivery</p>
					</div>
				</div>
				
				<%
					if("Old Book".equals(b.getBookCategory())){%>
						
						<div class="text-center p-3 mt-4">
						<a href="index.jsp"class="btn btn-primary">Continue Shopping&nbsp;<i class="fas fa-cart-plus"></i></a>
						<a href=""class="btn btn-success ml-5"><%=b.getPrice() %> &nbsp;<i class="fas fa-rupee-sign"></i></a>
						</div>
				<%	}else{%>
						
						<div class="text-center p-3 mt-4">
				<a href="cart?bid=<%= b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-primary">Add&nbsp;<i class="fas fa-cart-plus"></i></a>
				<a class="btn btn-success ml-5 price-tag"><%=b.getPrice() %> &nbsp;<i class="fas fa-rupee-sign"></i></a>
				</div>
					
			    <%	}
				%>
				
				
			</div>
		</div>
	</div>
</body>
</html>