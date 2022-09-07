<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="form" %>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<form:form 
		action="/Assignment/admin/accounts/store"
		method="POST"
		modelAttribute="account">
		<h1 class="text-center">CREATE ACCOUNTS</h1>
		<div  class="form-control" >
			<label>Fullname *</label>
			<form:input name="fullname"  class="form-control"  path="fullname" />
			<form:errors path="fullname" class="text-danger" style="color: red;"/>
		</div>
		<div class="form-control">
			<label>Email *</label>
			<form:input name="email"  class="form-control"  path="email" type="email"/>
			<form:errors path="email" class="text-danger" style="color: red;"/>
		</div>
		<div class="form-control">
			<label>Username *</label>
			<form:input name="username"   class="form-control"  path="username" />
			<form:errors path="username" class="text-danger" style="color: red;"/>
		</div>
		<div class="form-control">
			<label>Password *</label>
			<form:password name="password"  class="form-control"  path="password"  />
			<form:errors path="password" class="text-danger" style="color: red;"/>
		</div>
		<div class="form-control">
			<label>Photo</label>
			<form:input  path="photo"  class="form-control" />
		</div>
		<div class="form-control">
			<label>Admin</label>
			<form:select path="admin"  >
				<form:option value="0">User</form:option>
				<form:option value="1">Admin</form:option>
			</form:select>
		</div>
		<form:button class="mt-2 btn btn-primary  form-control">Submit</form:button>
	</form:form>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html> 