<%@page import="com.entity.User"%>
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
<title>Ebook: Recent Books</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-hover:hover {
	background-color: #e0e8df;
	cursor: pointer;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 05s 2.5s;
}

@
keyframes fadeIn {
	from {bottom: 0;
	opacity: 1;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #dbd1d06e">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty Added}">

		<div id="toast">${ Added }</div>

		<script type="text/javascript">
        showToast();
        function showToast(content)
        {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(()=>{
                $("#toast").removeClass("display");
            },2000)
        }
    
    </script>

		<c:remove var="Added" scope="session" />

	</c:if>



	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">


			<%
			String ch =request.getParameter("ch");
			BookDAOImplements dao = new BookDAOImplements(DBConnect.getConn());
			List<BookDetails> list = dao.getBookBySearch(ch);
			for (BookDetails arb : list) {
			%>


			<div class="col-md-3 mt-3">
				<div class="card p-3 crd-hover mt-2"
					style="max-height: 81vh;; border-radius: 15px;">
					<div class="card-body text-center "
						style="max-height: 61vh; min-height: 61vh;">
						<img src="book_img/<%=arb.getPhotoName()%>"
							style="height: 30vh; width: 12vw;" class="img-thumblin" />

						<h6 style="font-weight: 400;" class="mt-3">
							<b class="text-danger ">Book-Name: </b><i class="text-success"><%=arb.getBookName()%></i>
						</h6>
						<br>
						<p style="margin-left: -2px;">
							<b class="text-danger">Author: </b><i class="text-success"><%=arb.getAuthor()%></i>
						</p>
						<p>
							<b class="text-danger"> Categories:</b><i class="text-success"><%=arb.getBookCategory()%></i>
						</p>
						<%
						if (arb.getBookCategory().equals("Old Book")) {
						%>
					</div>
					<div class="row  ml-4">
						<a href="view_books.jsp?bid=<%=arb.getBookId()%>" class="btn btn-success btn-sm p-1 ml-5"
							style="margin-left: 28%;">View Details</a> 
							<a class="btn btn-danger btn-sm ml-3 text-white"><%=arb.getPrice()%>&nbsp;<i
							class="fas fa-rupee-sign"></i></a>
					</div>
					<%
					} else {
					%>
				</div>
				<div class="row mt-4 m-auto">
				
					<%if(u==null){%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add</a> 
						
					<%} else{%>
					<a href="cart?bid=<%=arb.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i> Add</a> 
						
					<%}%>
				
					
					<a href="view_books.jsp?bid=<%=arb.getBookId()%>"class="btn btn-success btn-sm ml-1">View Details</a> 
					<a class="btn btn-danger btn-sm ml-1 text-white"><%=arb.getPrice()%>&nbsp;<i class="fas fa-rupee-sign"></i></a>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<hr>
		<%
		}
		%>



	</div>
	<br>
	<%@include file="all_components/footer.jsp"%>

</body>
</html>