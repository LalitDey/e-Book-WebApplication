<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid"style="height:10px;background-color:#3949ab ;"></div>
<div class="container-fluid p-3" style="background-color: #8293e336;">
	<div class="row">
		<div class="col-md-3 ">
			<h3 style="margin-top: 6px;color:#0d800d;"> <i class="fas fa-book"></i>e-Book Webapp</h3>
		</div>
		<div  class="col-md-4 ">
		  <form style="margin-top: 5px;" class="form-inline my-2 mr-5" action="search.jsp"method="post">
				<input class="form-control me-2" type="search" placeholder="Search" name="ch">&nbsp;
				<button class="btn btn-primary" ><i class="fas fa-search "></i> Find</button>
			</form>
		</div>		
		<c:if test="${not empty userobj }">
			
			<div class="col-md-5  ">			
			<a href="checkout.jsp " class="btn fa-2x text-primary " style="margin-top: -1px; margin-left: 35%;"> <i class="fas fa-shopping-cart"></i></a>
			<a href="setting.jsp" class="btn btn-success ml-4"> <i class="fas fa-user"></i>&nbsp; ${userobj.name }</a> 
			<a href="logout" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white ml-2"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
			</div>
		</c:if>
	<!--  	<c:if test="${not empty userobj }">
				<a href="home.jsp" class="btn btn-success"><i class="fas fa-user-shield"></i>&nbsp;${ userobj.name }
				</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary text-white">Logout &nbsp;<i
					class="fas fa-sign-out-alt"></i>
				</a>

			</c:if> -->
		
		<c:if test="${empty userobj }">
			
			<div class="col-md-4" style="margin-top:6px ">
			<a href="login.jsp" class="btn btn-success"> <i class="fas fa-sign-in-alt"></i> Login</a> 
			<a href="register.jsp" class="btn btn-primary text-white"><i class="fas fa-user-plus"></i> Register</a>
			</div>
		
		
		</c:if>
		

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4 class="text-danger">Do You Want to Logout ?</h4>
					<button type="button" class="btn btn-primary text-white" data-dismiss="modal">Close</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="logout" type="button" class="btn btn-danger text-white">Logout</a>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- End Of LOGOUT MODAL -->

<!-- NAV BAR -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand nav-item active"  href="index.jsp" style="color:#0bff0b;font-weight:bold;font-size: 20px;"><i class="fas fa-home"></i> e-Book</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
   
      <li class="nav-item ml-2">
        <a class="nav-link active sub-heading" href="all_recent_book.jsp"><i class="fas fa-book-open"></i> All Books</a>
      </li>
      <li class="nav-item ml-2">
        <a class="nav-link active sub-heading" href="all_new_book.jsp"><i class="fas fa-book-open"></i> New Book</a>
      </li>
      <li class="nav-item ml-2">
        <a class="nav-link active sub-heading" href="all_old_book.jsp"><i class="fas fa-book-open"></i> Old Book</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-success my-2 my-sm-0 ml-1" type="submit"><i class="fas fa-cog"></i> Setting</a>
      <a href="./contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fas fa-phone-volume"></i> Feedback</a>
    </form>
  </div>
</nav>
