<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기 게시판</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.reviewDetailContainer {
	max-width: 800px;
	margin: auto;
}

.content-box {
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
	margin-bottom: 15px;
}

.like-button {
	cursor: pointer;
	color: gray;
}

.like-button.active {
	color: red;
}
</style>
</head>
<body>

	<%@ include file="../header/Header.jsp"%>

	<div class="reviewDetailContainer mt-4">
		<h4 class="fw-bold">${postList.title}</h4>
		<div class="content-box d-flex align-items-center">
			<img src="/images/유저이미지.jpg" alt="작성자 이미지" class="rounded-circle"
				width="40"> <span class="ms-2">${postList.nickName}</span> <span
				class="ms-3 text-muted"><fmt:formatDate
					value="${postList.createdAt}" pattern="yyyy-MM-dd HH:mm" /></span> <span
				class="ms-3 text-muted">조회 ${postList.postViews}</span>
		</div>

		<div class="mb-4">${postList.content}</div>

		<button id="likeBtn" class="btn btn-outline-danger">
			<i class="like-button ${postList.postLike}">&#x2665;</i>
			${postList.postLike}
		</button>

		<hr>

		<!-- 댓글 -->
		<h5>댓글</h5>
		<c:forEach var="comment" items="${comment}">
			<div class="mb-2">
				<strong>${comment.nickName}</strong> <small class="text-muted"><fmt:formatDate
						value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm" /></small>
				<p>${comment.content}</p>
			</div>
		</c:forEach>

		<!-- 댓글 입력 -->
		<form
			action="${pageContext.request.contextPath}/reviews/${postList.userId}/comment"
			method="post">
			<textarea name="content" class="form-control mb-2"
				placeholder="댓글을 입력해주세요." required></textarea>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>

		<hr>
		<a href="/reviewboard"
			class="btn btn-secondary">목록</a>
	</div>

	<%@ include file="../footer/Footer.jsp"%>

	<script>
    document.getElementById('likeBtn').addEventListener('click', function() {
        fetch('${pageContext.request.contextPath}/reviews/${postList.userId}/like', { method: 'POST' })
            .then(response => response.json())
            .then(data => {
                document.querySelector('.like-button').classList.toggle('active');
                document.getElementById('likeBtn').innerHTML = `<i class="like-button ${data.liked ? 'active' : ''}">&#x2665;</i> ${data.likes}`;
            });
    });
</script>

</body>
</html>