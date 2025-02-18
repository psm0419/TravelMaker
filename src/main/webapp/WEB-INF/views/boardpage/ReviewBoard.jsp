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

.reviewBoardContainer {
	margin: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 100px;
	min-height: 50vh;
}

.reviewBoardTitle {
	margin-top: 60px;
	padding: 20px;
	margin-bottom: 70px;
	font-size: 30px;
}

.goWriteReviewContainer {
	width: 77%;
	height: 50px;
	display: flex;
	justify-content: flex-end;
}

.goWriteReview {
	border: 1px solid lightgray;
	border-radius: 8px;
	font-size: 15px;
	font-weight: 600;
	color: gray;
	width: 120px;
	height: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	transition: background-color 0.1s ease-in-out;
}
.goWriteReview:hover {
	background-color: lightblue;
	color: black;
}

.reviewBoardListBox {
	width: 85%;
	height: auto;
	display: flex;
	justify-content: center;
	flex-direction: row;
	align-items: center;
	align-content: center;
	margin-top: -15px;
	flex-wrap: wrap;
	gap:40px;
}

.listBox {
	height: 300px;
	width: 300px;
	border: 1px solid lightgray;
	border-radius: 12px;
	overflow: hidden;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out;
}

.listBox.motion.motionUp.show:hover {
	transform: translateY(-5px);
}

.motion {
	opacity: 0;
	transition: all .5s ease;
}

.motion.motionUp {
	transform: translate(0, 10px);
}

.motion.show {
	opacity: 1;
	transform: none;
}

.reviewBoardListThumbnail {
	height: 70%;
	width: 100%;
	overflow: hidden;
}

.reviewBoardListThumbnail img {
	height: 100%;
	width: 100%;
}

.reviewBoardList {
	width: 100%;
	height: 30%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	font-weight: bold;
}
.reviewBoardList p:nth-child(2), .reviewBoardList p:nth-child(3) {
	font-size: 12px;
	color: gray;
}

</style>
</head>
<body>

	<%@ include file="../header/Header.jsp"%>

	<div class="reviewBoardContainer">
		<div class="reviewBoardTitle">
			<h1>후기 게시판</h1>
		</div>
		<div class = "goWriteReviewContainer">
			<c:if test="${not empty sessionScope.loggedInUser}">
				<div class="goWriteReview" onclick="goWriteReview()">후기 작성하기</div>
			</c:if>
			<c:if test="${empty sessionScope.loggedInUser}">
				<div class="goWriteReview" onclick="checkLogin()">후기 작성하기</div>
			</c:if>
		</div>
		<div class="reviewBoardListBox">
			<c:forEach var="reviewPostList" items="${reviewPostList}">
				<div class = "listBox motion motionUp" onclick="location.href='${pageContext.request.contextPath}/reviewDetail/${reviewPostList.postId}'">
					<div class="reviewBoardListThumbnail">
						<c:choose>
						    <c:when test="${not empty reviewPostList.urlFilePath}">
						        <img src="${reviewPostList.urlFilePath}">
						    </c:when>
						    <c:otherwise>
						        <img src="/images/TravelMakerLogo.jpg">
						    </c:otherwise>
						</c:choose>
					</div>
					<div class="reviewBoardList">
						<p>제목 : ${reviewPostList.title}</p>
						<p>작성자 : ${reviewPostList.nickName}</p>
						<p>조회수 : ${reviewPostList.postViews}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	
	<%@ include file="../footer/Footer.jsp"%>
	
	<script>
		const saTriggerMargin = 150;
		const saElementList = document.querySelectorAll('.motion');
	
		const saFunc = function() {
		  $.each(saElementList, function(index, element) {
		    if (!element.classList.contains('show')) {
		      if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
		        element.classList.add('show');
		      }
		    }
		  });
		}
	
		window.addEventListener('load', saFunc);
		window.addEventListener('scroll', saFunc);
		
		//로그인 유무에 따른 후기작성이동
		function goWriteReview() {
		    window.location.href = "/writeReview?param=1"; // 후기 작성 페이지로 이동
		}

		function checkLogin() {
		    if (confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")) {
		        window.location.href = "/user/login"; // 로그인 페이지로 이동
		    }
		}
		
	</script>
</body>
</html>
