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
		<div class="col-11">
	   		<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Tên sản phẩm</th>
						<th>Số lượng</th>
						<th>Gía</th>
						<th>Tổng tiền</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ data }" var="acc">
						<tr>
							<td>${ acc.product.name }</td>
							<td>${ acc.quantity }</td>
							<td>${ acc.product.price }</td>
							<td>${ acc.price }</td>
							<td><a class="btn btn-danger" href="/Assignment/admin/shoppingcart/delete/${acc.id }">Xóa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	   </div>
	   <div class="form-control">
			   <form:form action="/Assignment/admin/shoppingcart/add" method="POST" modelAttribute="oder">
			    <div >
			    	<label>Thành tiền</label>
			    	<input class="form-control" type="text" value="${thanhtien}">
			    </div>
			  	<div>
					<label>Khách hàng</label>
					 <input class="form-control" type="text" placeholder="hellotoan" disabled>
				</div>
			    <div>
				    <label>Địa chỉ</label>
				    <input class="form-control" type="text" name="address"/>  
			    </div>
		    <button class="btn btn-primary mt-2">Thanh toán hóa đơn</button>	  
		    </form:form>
	   </div>
	<script type="/Assignment/js/jquery.min.js"></script>
	<script type="/Assignment/js/popper.min.js"></script>
	<script type="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>