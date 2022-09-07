<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<h1 class="text-center">List ACCOUNTS</h1>
	<a href="/Assignment/admin/accounts/create" class="btn btn-info">Insert</a>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Fullname</th>
				<th>Username</th>
				<th>Email</th>
				<th>Photo</th>
				<th>Activated</th>
				<th>Role</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="acc">
			<tr>
				<td>${ acc.id }</td>
				<td>${ acc.fullname }</td>
				<td>${ acc.username }</td>
				<td>${ acc.email }</td>
				<td>
					<img src="${ acc.photo }" />
				</td>
				<td>${ acc.activated == 0 ? "Not Active" : "Active" }</td>
				<td>${ acc.admin == 1 ? "Admin" : "Member" }</td>
				<td>
					<a href="/Assignment/admin/accounts/edit/${acc.id}" class="btn btn-primary">Update</a>
				</td>
				<td><a type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							Delete</a> <!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Delete confirmation</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Are you sure to delete?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">No</button>
										<a href="/Assignment/admin/accounts/delete/${acc.id}"
											class="btn btn-danger">Yes</a>
									</div>
								</div>
							</div>
						</div></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="row">
		<ul class="pagination">
		<c:forEach var="i" begin="0" end="${ data.totalPages - 1 }">
			<li class="page-item">
				<a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>