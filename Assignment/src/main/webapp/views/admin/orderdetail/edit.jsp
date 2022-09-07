<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
<h1 class="text-center">UPDATE ORDERDEATIL</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/orderdetail/update/${detail.id}"
		modelAttribute="detail">
		<div class="form-control">
			<label>OrderID</label>
			<form:select path="orderId" class="form-control">
				<form:options itemLabel="address" itemValue="id" items = "${order}" />
			</form:select>
		</div>
		<div class="form-control">
			<label>ProductID</label>
			<form:select path="productId" class="form-control">
				<form:options itemLabel="name" itemValue="id" items = "${product}" />
			</form:select>
		</div>
		<div class="form-control">
			<label>Price</label>
			<form:input path="price" class="form-control" />
		</div>
		<div class="form-control">
			<label>Quantity</label>
			<form:input class="form-control" path="quantity" />
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">UPDATE</form:button>
	</form:form>
</body>
</html>