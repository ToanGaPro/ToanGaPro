<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<h1 class="text-center">UPDATE CATEGORY</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/category/update/${cate.id}"
		modelAttribute="cate">
		<div class="form-control">
			<label>Name Category</label>
			<form:input class="form-control" path="name"  />
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">Update</form:button>
	</form:form>
</body>
</html>