<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Layout shop</title>
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
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/Assignment/admin/shoppingcart/index">Buy</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/Assignment/admin/accuonts/index" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Crud Table
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Assignment/admin/accuonts/index">Account table</a></li>
            <li><a class="dropdown-item" href="/Assignment/admin/category/index">Category table</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/Assignment/admin/products/index">product table</a></li>
            <li><a class="dropdown-item" href="/Assignment/admin/orders/index">order table</a></li>
          </ul>
        </li>
         <li class="nav-item dropdown d-flex">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Admin
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Assignment/admin/login">Logout</a></li>
            <li><a class="dropdown-item" href="/Assignment/admin/login">Login</a></li>
          </ul>
	        </li>
			      </ul>
			    </div>
			  </div>
			  </nav>
	<script type="/Assignment/js/jquery.min.js"></script>
	<script type="/Assignment/js/popper.min.js"></script>
	<script type="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>