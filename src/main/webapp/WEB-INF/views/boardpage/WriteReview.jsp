<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>리뷰작성패이지</h1>
	
	<p> 아이디 : ${user.id} </p>
	<p> 이름 : ${user.name} </p>


	<h3>후기 사진</h3>
	<form action="/customer/review" method="post" enctype="multipart/form-date"> <!-- enctype="multipart/form-date" 파일업로드 -->
		<input type="hidden" name="id" value="${user.id}">
		<input type="hidden" name="name" value = "${user.name}">
		<input type="file" name="reviewImage">
		<button type="submit">등록</button>
	</form>
</body>
</html>