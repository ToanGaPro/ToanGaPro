<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
</head>
<body>
	<h1 class="text-center">LIST CATEGORY</h1>
	<a href="/Assignment/admin/category/create" class="btn btn-primary">Insert</a>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>name</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="cate">
			<tr>
				<td>${ cate.id }</td>
				<td>${ cate.name }</td>
				<td>
					<a href="/Assignment/admin/category/edit/${cate.id}" class="btn btn-primary">Update</a>
				</td>
				<td>
				<a href="/Assignment/admin/category/delete/${cate.id}" class="btn btn-danger"
											>Delete</a>
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
					href="/Assignment/admin/category/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/bootstrap.min.js"></script>
</body>
</html>