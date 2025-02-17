<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.reviewDetailContainer {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
	margin-top: 30px;
}

.content-box {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.content-box img {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	margin-top: 15px;
}

.content-box span {
	margin-left: 10px;
	color: #555;
	margin-top: 15px;
}

input, textarea, button {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border-radius: 5px;
	border: 1px solid #ccc;
}

button {
	background-color: #007bff;
	color: white;
	cursor: pointer;
	border: none;
	padding: 10px;
	font-size: 16px;
}

button:hover {
	background-color: #0056b3;
}

</style>
</head>
<body>
	
	<%@ include file="../header/Header.jsp"%>
	
	<div class="reviewDetailContainer">
		<h4 class="fw-bold">질문글 작성</h4>

		<!-- 작성자 정보 -->
		<div class="content-box">
			<img src="/images/TravelMakerLogo.jpg" alt="작성자 이미지">
			<span>작성자: 
				${sessionScope.loggedInUser.nickName}
			</span>
			<span class="ms-3 text-muted"> 현재시간: <fmt:formatDate
					value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm" />
			</span>
		</div>

		<!-- 게시글 작성 폼 -->
		<form action="/saveWriteQnA" method="post" onsubmit="return checkSubmit()">
			<input type="hidden" name="boardId" value="2">
			<c:choose>
		        <c:when test="${not empty sessionScope.loggedInUser}">
		            <input type="hidden" name="userId" value="${sessionScope.loggedInUser.userId}">
		            <input type="hidden" name="nickName" value="${sessionScope.loggedInUser.nickName}">
		        </c:when>
		    </c:choose>
			
			<label for="title">제목</label>
			<input type="text" id="title" name="title" required placeholder="제목을 입력하세요" maxlength="40">
			
			<label for="content">내용</label>
			<textarea id="content" name="content" rows="5" required placeholder="내용을 입력하세요"></textarea>

			<button type="submit">게시글 등록</button>
		</form>
	</div>



	<script>
		function checkSubmit() {
		    var isLoggedIn = ${not empty sessionScope.loggedInUser ? 'true' : 'false'};
		    
		    if (!isLoggedIn) {
		        if (confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")) {
		            window.location.href = "/user/login"; // 로그인 페이지로 이동
		        }
		        return false; // 폼 제출 방지
		    }
		    return true; // 로그인 상태면 폼 제출 허용
		}
	</script>


</body>
</html>