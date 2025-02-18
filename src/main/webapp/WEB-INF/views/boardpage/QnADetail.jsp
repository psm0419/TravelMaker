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

.QnADetailContainer {
	max-width: 800px;
	margin: auto;
	margin-bottom: 50px;
}

.content-box {
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
	margin-bottom: 15px;
}

.content-box span:nth-child(3), .content-box span:nth-child(4){
	font-size: 12px;
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

	<div class="QnADetailContainer mt-4">
		<h4 class="fw-bold">${post.title}</h4>
		
		<div class="content-box d-flex align-items-center">
			<img src="/images/유저이미지.jpg" alt="작성자 이미지" class="rounded-circle"
				width="40"> <span class="ms-2">${userList.nickName}</span> <span
				class="ms-3 text-muted"><fmt:formatDate
					value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm" /></span> <span
				class="ms-3 text-muted">조회수 ${post.postViews}</span>
		</div>
		
		<div class="mb-4">${post.content}</div>

		<button id="likeBtn" class="btn btn-outline-danger">
			<i class="like-button ${post.postLike}">&#x2665;</i>
			${post.postLike}
		</button>

		<hr>

		<!-- 댓글 -->
		<h5>댓글</h5>
		<c:forEach var="comment" items="${commentList}">
			<div class="mb-2">
				<strong style="color: gray">
					${comment.nickName}
				</strong>
				<small class="text-muted">
					<fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm" />
				</small>
				<p>${comment.content}</p>
			</div>
		</c:forEach>

		<!-- 댓글 입력 -->
		<c:if test="${not empty sessionScope.loggedInUser}">
			<form action="${pageContext.request.contextPath}/QnADetail/${post.postId}/comment" method="post">
				<!-- 필요시 인풋 히든으로 유저닉 등 필요한정보 넘기기 -->
				<input type="hidden" name="userId" value="현재로그인한아이디">
				<input type="hidden" name="nickName" value="현재로그인한닉네임">
				<textarea name="content" class="form-control mb-2"
					placeholder="댓글을 입력해주세요." required></textarea>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</c:if>
		<c:if test="${empty sessionScope.loggedInUser}">
			<form onsubmit="handleCommentSubmit(event)">
				<textarea name="content" class="form-control mb-2"
					placeholder="댓글을 입력해주세요." required></textarea>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</c:if>

		<hr>
		<a href="/QnABoard?boardId=2" class="btn btn-secondary">목록</a>
	</div>

	<%@ include file="../footer/Footer.jsp"%>

<script>
    document.getElementById('likeBtn').addEventListener('click', function() { //좋아요 버튼
        fetch('${pageContext.request.contextPath}/QnA/${post.userId}/like', { method: 'POST' })
            .then(response => response.json())
            .then(data => {
                document.querySelector('.like-button').classList.toggle('active');
                document.getElementById('likeBtn').innerHTML = `<i class="like-button ${data.liked ? 'active' : ''}">&#x2665;</i> ${data.likes}`;
            });
    });
    
    function handleCommentSubmit(event) { //로그인 안했을때 로그인페이지로 이동?
        event.preventDefault();  // 기본 폼 제출 동작을 막음

        var confirmLogin = confirm("로그인 후 사용 가능합니다. 로그인 하시겠습니까?");
        if (confirmLogin) {
            window.location.href = '${pageContext.request.contextPath}/user/login'; // 로그인 페이지로 리다이렉트
        } else {
            // 댓글 작성을 취소하고 게시글 상세 화면을 유지
            return false;
        }
    }
    
</script>

</body>
</html>