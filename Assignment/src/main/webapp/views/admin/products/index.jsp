<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1 class="text-center">LIST PRODUCTS</h1>
	<a href="/Assignment/admin/products/create" class="btn btn-primary">Insert</a>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>name</th>
				<th>Image</th>
				<th>Price</th>
				<th>Activated</th>
				<th>Create Date</th>
				<th>Categories Name</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="product">
			<tr>
				<td>${ product.id }</td>
				<td>${ product.name }</td>
				 <td class="img-thumbnail">
		            <img src="/Assignment/anh/${product.image }" 
		            class="card-img-top" alt="...">
		           </td>
				<td>${ product.price }</td>
				<td>${ product.available == 0 ? "Not Active" : "Active" }</td>
				<td>${ product.createdDate }</td>
				<td>${ product.categoryId.name }</td>
				<td>
					<a href="/Assignment/admin/products/edit/${product.id}" class="btn btn-primary">Update</a>
				</td>
				<td>
					<a href="/Assignment/admin/products/delete/${product.id}" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="row">
		<ul class="pagination">
		<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
			<li class="page-item">
				<a class="page-link"
					href="/Assignment/admin/products/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<script type="/Assignment/js/jquery.min.js"></script>
	<script type="/Assignment/js/popper.min.js"></script>
	<script type="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>