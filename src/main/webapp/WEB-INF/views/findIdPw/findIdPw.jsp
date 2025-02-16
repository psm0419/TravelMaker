<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="/css/findidpw/findIdPw.css">
</head>
<body>

	<div class="container">
		<form action="/user/findIdPw" method="post" id="findForm">
			<button type="button" class="find-btn" onclick="location.href='findId'">아이디 찾기</button>
			<button type="button" class="find-btn" onclick="location.href='findPw'">비밀번호 찾기</button>
		</form>
	</div>

</body>
</html>