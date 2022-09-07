<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16306 - Create Account</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<h1 class="text-center">CREATE PRODUCTS</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/products/store"
		modelAttribute="product">
		<div class="form-control">
			<label>Fullname</label>
			<form:input class="form-control" path="name" />
			<form:errors path="name" class="text-danger" style="color: red;"/>
			
		</div>
		<div class="form-control">
			<label>image</label>
			<form:input class="form-control" path="image" type="file" />
			
		</div>
		<div class="form-control">
			<label>price</label>
			<form:input class="form-control" path="price" />
		</div>
		<div class="form-control">
			<label>Create Date</label>
			<form:input type="date" path="createdDate" class="form-control"/>
		</div> 
		<div>
			<label>Categories Name</label>
			<form:select class="form-control" path="categoryId">
				<form:options itemLabel="name" itemValue="id" items = "${listcate}" />
			</form:select>
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">Submit</form:button>
	</form:form>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html> 