<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:if test="${!empty sessionScope.error }">
	<div class="alert alert-warning">
		${sessionScope.error }
	</div>
</c:if>
<c:remove var="error" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/Assignment/css/bootstrap.min.css" />
<style>
		body {
		padding: 50px;
		background: #7B68EE;
		}
		* {
			margin: 0;
			padding: 0;
		}
		a{
			text-decoration: none;
		}
		.container{
			width: 50vw;
			height: 50vh;
			align-items: center;
			text-align: center;
			justify-content: center;
		}
		.form-login{
			width: ;
			height: ;
			background: #fff;
			border-radius: 10px;
			padding:  40px 30px;
			
		}
		.form-text{
			margin-bottom: 40px;
			position: relative;
		}
		.form-text input{
			width: 100%;
			height: 35px;
			border: none;
			border-bottom: 2px solid #ccc;
		}
		.form-text .label{
			position: absolute;
		}
		.form-login button{
			height: 35px;
			width: 100%;
			margin-bottom: 30px;
			border: none;
			color: #ccc;
			border-radius: 5px;
			background: #6A5ACD;
			background-size:200%; 
		}
</style>
	</head>
	<body>
		<div class="container">
			<form:form 
			modelAttribute="account"
			action="/Assignment/admin/logins/store"
			method="POST" 
			 class="form-login">
			    <div>
					<h2>ĐĂNG NHẬP</h2>
					<div class="form-text">
						<label>Email của bạn :</label>
						<form:input path="email" type="email" placeholder="Nhập email"/>
					</div>
					<div class="form-text">
						<label>Mật khẩu của bạn :</label>
						<form:input path="password" type="password"  placeholder="Nhập mật khẩu"/>
					</div>
					<button>Login</button>
					<span>Bạn chưa có tài khoản ? Đăng ký <a href="#">Tại đây</a></span>
					<br>
				</div>
			</form:form>
		</div>
	</body>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</html>