<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDAOImplements"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit_Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center text-success"
							style="text-decoration: underline;">
							<i class="fas fa-plus-square"></i>&nbsp;Edit Books&nbsp;<i
								class="fas fa-plus-square"></i>
						</h4>



						<%
						int id = Integer.parseInt(request.getParameter("id"));

						BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book-Name</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required
									value="<%=b.getBookName()%>" readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author-Name</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required
									value="<%=b.getAuthor()%>"readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" name="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required
									value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="exampleFormControlSelect1">Book status</label> <select
									name="bstatus" class="form-control"
									id="exampleFormControlSelect1">

									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>
								</select>
								<span class="text-danger"><b>*Select Inactive when Book is temporarily un-available</b></span>
								</div>
								<div class="text-center mt-4">
									<button type="submit" class="btn btn-success ">
										<i class="fas fa-plus-square"></i>&nbsp;Update-Book
									</button>
								</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="fixed-bottom">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>