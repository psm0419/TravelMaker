<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.boardContainer {
	margin: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.boardTitle {
	margin-top: 50px;
	background-color: red;
	padding: 20px;
	color: white;
}

.boardListBox {
	background-color: green;
	width: 85%;
	height: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 70px;
}

.boardList {
	width: 100%;
	height: 40px;
	background-color: yellow;
	display: flex;
	align-items: center;
	border: 1px solid lightgray;
	padding-left: 20px;
}

</style>
</head>
<body>

	<%@ include file="../header/Header.jsp"%>

	<div class="boardContainer">
		<div class="boardTitle">
			<h1>후기 게시판</h1>
		</div>

		<div class="boardListBox">
			<c:forEach var="post" items="${posts}">
				<div class="boardList">${post.title}</div>
			</c:forEach>
		</div>
	</div>
	
	
</body>
</html>
