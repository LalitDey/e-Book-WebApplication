
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDAOImplements"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook_HomePage</title>

<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #dbd1d06e">
<div class="container-fluid">		
			<%
			User u = (User)session.getAttribute("userobj") ;
			   
			%>


	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid back-img ">
		<marquee behavior="alternate" autofocus="autofocus" direction="right"><span class="text-center back-heading" style="">&nbsp; e-Book Webapp System(24*7 Available) &nbsp;</span></marquee>

	</div>


	<%
	// Connection conn = DBConnect.getConn();
	//out.println(conn);
	%>



	<!-- Start Of Recent Book -->
<div class="">
		<h3 class="text-center ">
			<b><i><u>Recently Uploaded Books</u></i></b>
		</h3>

		<div class="row">


			<%
			BookDAOImplements dao2 = new BookDAOImplements(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails rb : list2) {
			%>
			<div class="col-md-3 mt-3">
				<div class="card p-3 crd-hover" style="max-height:81vh; ; border-radius: 15px;">
					<div class="card-body card-hover text-center " style="max-height: 61vh;min-height:61vh;">
						<img src="book_img/<%=rb.getPhotoName()%>"
							style="height: 30vh; width: 12vw;"
							class="img-thumblin" />

						<h6 style="font-weight: 400;" class="mt-1 h6format">
							<b  class="text-danger ">Book-Name: </b><i class="text-success"><%=rb.getBookName()%></i>
						</h6>
						<br>
						<p style="margin-left: -2px;">
							<b class="text-danger">Author: </b><i class="text-success"><%=rb.getAuthor()%></i>
						</p>
						<p>
							<b class="text-danger"> Categories:</b><i class="text-success"><%=rb.getBookCategory()%></i>
						</p>						
						<%
							if(rb.getBookCategory().equals("Old Book")){ %>							
					</div>
							<div class="row ">						
								<a href="view_books.jsp?bid=<%=rb.getBookId()%>"class="btn btn-success btn-sm p-1 ml-5" style="margin-left:12px;">View Details</a> 
								<a class="btn btn-danger btn-sm ml-3 price-tag"><%=rb.getPrice()%>&nbsp;<i class="fas fa-rupee-sign"></i></a>
							</div>							
						<%	}else{ %>
							</div>
							<div class="row mt-4 m-auto">
							
								<% if(u == null){ %>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add </a> 
								<%} else{%>						
								<a href="cart?bid=<%=rb.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add </a> 							
								<%}%>	
							
								 
								<a href="view_books.jsp?bid=<%=rb.getBookId()%>"class="btn btn-success btn-sm ml-1">View Details</a> 
								<a class="btn btn-danger btn-sm ml-1 price-tag"><%=rb.getPrice()%>&nbsp;<i class="fas fa-rupee-sign"></i></a>
							</div>							
						<% }
						%>		
				</div>
			</div>
			<%
			}
			%>		
		<div class="text-center m-auto"><br>
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End OF RECENT Book -->
	<hr style="background-color: green; max-height: 2px;height:2px;">


	<!-- Start Of New Book -->

	<div class="">
		<h3 class="text-center ">
			<b><i><u>New Book</u></i></b>
		</h3>

		<div class="row">


			<%
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBooks();
			for (BookDetails bd : list) {
			%>
			<div class="col-md-3 mt-3">
				<div class="card p-3 crd-hover" style="max-height:81vh;border-radius: 15px;">
					<div class="card-body text-center " style="max-height: 61vh;min-height:61vh;">
						<img src="book_img/<%=bd.getPhotoName()%>"
							style="height: 30vh; width: 12vw;"
							class="img-thumblin" />

						<h6 style="font-weight: 400;">
							<i class="text-danger">Book-Name: </i><b class="text-success"><%=bd.getBookName()%></b>
						</h6>
						<br>
						<p>
							<i class="text-danger">Author: </i><b class="text-success"><%=bd.getAuthor()%></b>
						</p>
						<p>
							<i class="text-danger"> Categories:</i><b class="text-success"><%=bd.getBookCategory()%></b>
						</p>
					</div>
					<div class="row m-auto">
					
						<% if(u == null){ %>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add </a> 
						<%} else{%>						
							<a href="cart?bid=<%=bd.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add </a> 							
						<%}%>					
							<a href="view_books.jsp?bid=<%=bd.getBookId()%>"class="btn btn-success btn-sm ml-1">View Details</a> 
							<a class="btn btn-danger btn-sm ml-1 price-tag"><%=bd.getPrice()%>&nbsp;<i class="fas fa-rupee-sign"></i></a>
					</div>
				</div>
			</div>

			<%
			}
			%>



		</div>
		<br>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End OF NEW Book -->
	<hr style="background-color: green; max-height: 2px;height:2px;">


	<!-- Start Of Old Book -->
	<div class="">
		<h3 class="text-center "><b><i><u>Old Book</u></i></b></h3>

		<div class="row">

			<%
			BookDAOImplements dao3 = new BookDAOImplements(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails ob : list3) {
			%>

			<div class="col-md-3 mt-3">
				<div class="card p-3 crd-hover" style="max-height:81vh;border-radius: 15px;">
					<div class="card-body text-center " style="max-height: 61vh;min-height:61vh;">
						<img src="book_img/<%=ob.getPhotoName()%>"
							style="height: 30vh; width: 12vw;"
							class="img-thumblin" />

						<h6 style="font-weight: 400;">
							<i class="text-danger">Book-Name: </i><b class="text-success"><%=ob.getBookName()%></b>
						</h6>
						<br>
						<p>
							<i class="text-danger">Author: </i><b class="text-success"><%=ob.getAuthor()%></b>
						</p>
						<p>
							<i class="text-danger"> Categories:</i><b class="text-success"><%=ob.getBookCategory()%></b>
						</p>
					</div>
					<div class="row ml-5">
						<a href="view_books.jsp?bid=<%=ob.getBookId()%>" class="btn btn-success btn-sm p-1 ml-5">View Details</a> &nbsp;&nbsp;
							<a class="btn btn-danger btn-sm ml-3 price-tag"><%=ob.getPrice()%>&nbsp;<i class="fas fa-rupee-sign"></i></a>
					</div>
				</div>
			</div>

			<%
			}
			%>





		</div>
		<br>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End OF Old Book -->

</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>