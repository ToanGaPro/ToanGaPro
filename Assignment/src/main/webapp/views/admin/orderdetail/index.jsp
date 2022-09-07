<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
<h1 class="text-center">LIST ORDERDEATIL</h1>
	<a href="/Assignment/admin/orderdetail/create" class="btn btn-primary">Insert</a>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>OrderID</th>
				<th>ProductID</th>
				<th>Price</th>
				<th>Quantity</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="detail">
			<tr>
				<td>${ detail.id }</td>
				<td>${ detail.orderId.address }</td>
				<td>${ detail.productId.name }</td>
				<td>${ detail.price}</td>
				<td>${ detail.quantity}</td>
				<td>
					<a href="/Assignment/admin/orderdetail/edit/${detail.id}" class="btn btn-primary">Update</a>
				</td>
				<td><button type="button" class="btn btn-danger"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							Delete</button> <!-- Modal -->
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
										<a href="/Assignment/admin/orderdetail/delete/${detail.id}"
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
					href="/Assignment/admin/orderdetail/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
</body>
</html>