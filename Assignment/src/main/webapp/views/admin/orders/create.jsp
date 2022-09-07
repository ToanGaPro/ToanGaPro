<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
	
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16306 - Create Account</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<h1 class="text-center">CREATE ORDER</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/orders/store"
		modelAttribute="orders">
		<div class="form-control">
			<label>UserID</label>
			<form:select path="userId" class="form-control">
				<form:options itemLabel="username" itemValue="id" items = "${listacc}" />
			</form:select>
		</div>
		<div class="form-control">
			<label>Create Date</label>
			<form:input path="createdDate" type="date" class="form-control"/>
		</div>
		<div class="form-control">
			<label>Address</label>
			<form:input path="address" class="form-control"/>
			<form:errors path="address" class="text-danger" style="color: red;"/>
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">SAVE</form:button>
	</form:form>
</html> 