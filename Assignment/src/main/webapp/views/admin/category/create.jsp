<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<h1 class="text-center">CREATE CATEGORY</h1>
	<form:form 
		method="POST"
		action="/Assignment/admin/category/store"
		modelAttribute="category">
		<div class="form-control">
			<label>Name Category</label>
			<form:input path="name"/>
			<form:errors path="name" class="text-danger" style="color: red;"/>
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">Submit</form:button>
	</form:form>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>