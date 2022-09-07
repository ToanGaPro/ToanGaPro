<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>	
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
<nav class="row navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/Assignment/admin/accuonts/index" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Crud Table
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Assignment/admin/accuonts/index">Account table</a></li>
            <li><a class="dropdown-item" href="/Assignment/admin/category/index">Category table</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/Assignment/admin/products/index">product table</a></li>
          </ul>
        </li>
			      </ul>
			    </div>
			  </div>
			  </nav>
	<div class="row">
                <div class="card text-center">
                    <div class="card-header">
                    	<h3><a href="buy" class="text-decoration-none"> Giỏ hàng</a></h3>
                    </div>
     			</div>
     <div class="row ">
     <c:forEach items="${ data.content }" var="sanpham">
         <div class="card col-3" >
             <form:form action="store/${sanpham.id }" method="POST" modelAttribute="oderdetail">
         <div class="card-body">
            <img src="/Assignment/anh/${sanpham.image }" class="card-img-top" alt="...">
         </div>
         <div class="card-footer">
             <h5 class="card-title">${sanpham.name }</h5>
             <p class="card-text">Giá sản phẩm: ${sanpham.price } VNĐ</p>               
         </div>  
         <form:input path="quantity" class="col-8 form-control"/>
            <div class="row text-center">
            	<button class="btn btn-primary p-2">Thêm vào giỏ</button>
            </div>
            </form:form>
         </div>
     </c:forEach>
     <div class="row ">
		<ul class="pagination ">
		<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
			<li class="page-item mx-auto">
				<a class="page-link"
					href="/Assignment/admin/Shoppongcart/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>            
    </div>
</div>
	<script type="/Assignment/js/jquery.min.js"></script>
	<script type="/Assignment/js/popper.min.js"></script>
	<script type="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>