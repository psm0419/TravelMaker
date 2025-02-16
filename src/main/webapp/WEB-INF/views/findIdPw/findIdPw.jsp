<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
<body>

	<form action="/user/findIdPw" method="post" id="findForm">

	<button><a href="findId">아이디 찾기</a></button>
	<button><a href="findPw">비밀번호 찾기</a></button>


	</form>

</body>
</html>