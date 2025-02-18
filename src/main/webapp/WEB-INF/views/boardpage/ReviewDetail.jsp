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
	margin-bottom: 50px;
}

.contentBox {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: auto;
}

.contentBox img{
	 width: 80%;
	 height: auto;
	 margin: auto;
	 display: block;
}

.content-box {
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
	margin-bottom: 15px;
}

.content-box span:nth-child(3), .content-box span:nth-child(4){
	font-size: 12px;
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
				class="ms-3 text-muted">조회수 ${postList.postViews}</span>
				
			<c:if test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.userId eq postList.userId}">	
				<form action="${pageContext.request.contextPath}/reviewDetail/${postList.postId}/post/delete" method="post" style="display: inline; margin-left: 8px;" onsubmit="return confirmDelete();">
					<button type="submit" class="btn btn-outline-danger ms-3">글 삭제하기</button>
				</form>
			</c:if>
			<c:if test="${not empty sessionScope.loggedInUser}">	
				<form action="${pageContext.request.contextPath}/reviewDetail/${postList.postId}/post/report" method="post" style="display: inline; margin-left: 8px;" onsubmit="return confirmReport();">
					<button type="submit" class="btn btn-outline-danger ms-3">글 신고하기</button>
				</form>
			</c:if>
			
		</div>
		
		<div class = "contentBox">
			<c:if test="${reviewImages.urlFilePath != null}">
				<div class = "contentImgBox">
					<img src="${reviewImages.urlFilePath}" alt="usersReviewImage">
				</div>
			</c:if>
			<br>
			<div class="mb-4">${postList.content}</div>
			<br>
		</div>

		<hr>

		<!-- 댓글 -->
		<h5>댓글</h5>
		<c:forEach var="comment" items="${commentList}">
			<div class="mb-2 d-flex align-items-center">
				<strong style="color: gray">
					${comment.nickName} 
				</strong>
				<span>&nbsp;</span> <!-- 닉네임과 시간 사이 공백 주는 용도 -->
				<small class="text-muted">
					<fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm" />
				</small>
				
				<c:if test="${not empty sessionScope.loggedInUser and sessionScope.loggedInUser.userId eq comment.userId}">
	            	<form action="${pageContext.request.contextPath}/reviewDetail/${postList.postId}/comment/delete" method="post" style="display: inline; margin-left: 8px;" onsubmit="return confirmDelete();">
		                <input type="hidden" name="commentId" value="${comment.commentId}">
		                <button type="submit" class="btn btn-sm text-danger p-0 d-flex align-items-center justify-content-center"
		                    style="border: 1px solid red; border-radius: 3px; width: 35px; height: 20px; line-height: 1; background: white;">
		                    삭제
		                </button>
		            </form>
		        </c:if>
			</div>
			<p>${comment.content}</p>
		</c:forEach>

		<!-- 댓글 입력 -->
		<c:if test="${not empty sessionScope.loggedInUser}">
			<form action="${pageContext.request.contextPath}/reviewDetail/${postList.postId}/comment" method="post">
				<!-- 필요시 인풋 히든으로 유저닉 등 필요한정보 넘기기 -->
				<input type="hidden" name="userId" value="${sessionScope.loggedInUser.userId}">
				<input type="hidden" name="nickName" value="${sessionScope.loggedInUser.nickName}">
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
		<a href="/reviewBoard?boardId=1" class="btn btn-secondary">목록</a>
	</div>

	<%@ include file="../footer/Footer.jsp"%>

<script>
    
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
    
    function confirmDelete() {  // 게시글 및 댓글 삭제 시 확인창
        if (confirm('삭제하시겠습니까?')) {
            alert('글이 삭제 되었습니다');
            return true;  // 폼 제출 진행
        } 
        return false;  // 폼 제출 중단
    }
    
    function confirmReport() {  // 게시글 신고 시 확인창
        if (confirm('신고하시겠습니까?')) {
            alert('신고 처리 되었습니다');
            return true;  // 폼 제출 진행
        }
        return false;  // 폼 제출 중단
    }
    
</script>

</body>
</html>