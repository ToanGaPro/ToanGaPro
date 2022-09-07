<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
<h1 class="text-center">CREATE ORDERDEATIL</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/orderdetail/store"
		modelAttribute="detail">
		<div class="form-control">
			<label>OrderID</label>
			<form:select class="form-control" path="orderId">
				<form:options itemLabel="address" itemValue="id" items = "${order}" />
			</form:select>
		</div>
		<div class="form-control">
			<label>ProductID</label>
			<form:select class="form-control" path="productId">
				<form:options itemLabel="name" itemValue="id" items = "${product}" />
			</form:select>
		</div>
		<div class="form-control">
			<label>Price</label>
			<form:input class="form-control" path="price"/>
		</div>
		<div class="form-control">
			<label>Quantity</label>
			<form:input class="form-control" path="quantity" />

		</div>
		<form:button class="mt-2 btn btn-primary  form-control">SAVE</form:button>
	</form:form>
</body>
</html>