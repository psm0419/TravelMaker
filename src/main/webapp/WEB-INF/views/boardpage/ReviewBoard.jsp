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
}
</style>

</head>
<body>

	<%@include file="../header/Header.jsp"%>

	<div class="boardContainer">

		<div class="boardTitle">
				<h1>후기 게시판</h1>
		</div>

		<div class="boardListBox">
			<p>asdasdasd</p>
		</div>








	</div>




	<script>
		function changeBoard() {
			var selectedBoard = document.getElementById("boardSelect").value;
			window.location.href = "?board=" + selectedBoard; // 선택한 값으로 페이지 새로고침
		}
	</script>

</body>
</html>