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
<title>Ebook: Old Books</title>
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
	
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			List<BookDetails> list = dao.getAllOldBook();
			for (BookDetails aob : list) {
				
				%>

				<div class="col-md-3 mt-3">
					<div class="card p-3 crd-hover mt-2" style="max-height:81vh;border-radius: 15px;">
						<div class="card-body text-center " style="max-height: 61vh;min-height:61vh;">
							<img src="book_img/<%=aob.getPhotoName()%>"
								style="height: 30vh; width: 12vw; "
								class="img-thumblin" />

							<h6 style="font-weight: 400;" class="mt-3">
								<i class="text-danger">Book-Name: </i><b class="text-success"><%=aob.getBookName()%></b>
							</h6>
							<br>
							<p>
								<i class="text-danger">Author: </i><b class="text-success"><%=aob.getAuthor()%></b>
							</p>
							<p>
								<i class="text-danger"> Categories:</i>&nbsp;<b class="text-success"><%=aob.getBookCategory()%></b>
							</p>
						</div>
						<div class="row ml-5">
							<a href="view_books.jsp?bid=<%=aob.getBookId()%>" class="btn btn-success btn-sm p-1 ml-5">View Details</a> &nbsp;&nbsp;
								<a href="" class="btn btn-danger btn-sm"><%=aob.getPrice()%>&nbsp;<i class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>

				<%
				
				
				
				
			}
			%>

		</div>
	</div><br><br><br>
<div class="fixed-bottom">
	<%@include file="all_components/footer.jsp"%>
	</div>
</body>
</html>