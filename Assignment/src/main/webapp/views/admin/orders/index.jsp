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
	<h1 class="text-center">LIST ORDER</h1>
	<a href="/Assignment/admin/orders/create" class="btn btn-primary">Insert</a>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>UserID</th>
				<th>Create Date</th>
				<th>Adderss</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="orders">
			<tr>
				<td>${ orders.id }</td>
				<td>${ orders.userId.username }</td>
				<td>${ orders.createdDate }</td>
				<td>${ orders.address }</td>
				<td>
					<a href="/Assignment/admin/orders/edit/${orders.id}" class="btn btn-primary">Update</a>
				</td>
				<td><a href="/Assignment/admin/orders/delete/${orders.id}"
											class="btn btn-danger">Delete</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="row">
		<ul class="pagination">
		<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
			<li class="page-item">
				<a class="page-link"
					href="/Assignment/admin/orders/index?page=${ i }">
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