<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
	<h1 class="text-center">UPDATE ACCOUNTS</h1>
	<form:form
		method="POST"
		action="/Assignment/admin/accounts/update/${acc.id }"
		modelAttribute="acc">
		<div  class="form-control">
			<label>Fullname</label>
			<form:input class="form-control" path="fullname" />
		</div>
		<div class="form-control">
			<label>Email</label>
			<form:input class="form-control"  path="email" type="email" />
		</div>
		<div class="form-control">
			<label>Username</label>
			<form:input class="form-control" path="username"  />
		</div>
		<div class="form-control">
			<label>Photo</label>
			<form:input path="photo" />
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">Update</form:button>
	</form:form>
</body>
</html>