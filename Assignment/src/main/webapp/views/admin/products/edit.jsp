<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<h1 class="text-center">UPDATE PRODUCTS</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/products/update/${product.id}"
		modelAttribute="product">
		<div class="form-control" >
			<label>Fullname</label>
			<form:input class="form-control"  path="name" />
		</div>
		<div class="form-control" >
			<label>image</label>
			<form:input class="form-control" path="image"  type="file"/>
		</div>
		<div class="form-control">
			<label>price</label>
			<form:input class="form-control" path="price" />
		</div>
		<div class="form-control">
			<label>Create Date</label>
			<form:input class="form-control" path="createdDate" type="date"/>
		</div> 
		<div class="form-control">
			<label>Categories Name</label>
			<form:select class="form-control" path="categoryId">
				<form:options itemLabel="name" itemValue="id" items = "${listcate}" />
			</form:select>
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">Update</form:button>
	</form:form>
</body>
</html> 