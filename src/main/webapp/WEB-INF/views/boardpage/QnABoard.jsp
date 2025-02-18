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
	
	.QnABoardContainer {
		margin: auto;
		display: flex;
		flex-direction: column;
		align-items: center;
		margin-bottom: 100px;
		min-height: 50vh;
	}
	
	.QnABoardTitle {
		margin-top: 60px;
		padding: 20px;
		margin-bottom: 70px;
		font-size: 30px;
	}
	
	.goWriteQnAContainer {
		width: 77%;
		height: 50px;
		display: flex;
		justify-content: flex-end;
	}
	
	.goWriteQnA {
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
	.goWriteQnA:hover {
		background-color: lightblue;
		color: black;
	}

	.QnABoardListBox {
	width: 78%;
	height: auto;
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	align-content: center;
	margin-top: -15px;
	gap:5px;
	}
	
	.QnAListBox {
		height: 50px;
		width: 99%;
		border: 1px solid lightgray;
		border-radius: 12px;
		overflow: hidden;
		cursor: pointer;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		transition: background-color 0.1s ease-in-out;
	}
	
	.QnAListBox:hover {
		background-color: lightblue;
		color: black;
	}
	
	.QnAList {
		padding: 20px;
		width: 100%;
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: space-between;
		flex-direction: row;
		font-weight: bold;
	}
	
	.QnAUserInfo {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	}
	
	.QnAUserInfo p{
		font-size: 12px;
		color: gray;
		margin-left: 5px;
	}
	
</style>

</head>
<body>

	<%@ include file="../header/Header.jsp"%>



	<div class="QnABoardContainer">
		<div class="QnABoardTitle">
			<h1>질문 게시판</h1>
		</div>
		<div class = "goWriteQnAContainer">
			<c:if test="${not empty sessionScope.loggedInUser}">
				<div class="goWriteQnA" onclick="goWriteQnA()">질문 작성하기</div>
			</c:if>
			<c:if test="${empty sessionScope.loggedInUser}">
				<div class="goWriteQnA" onclick="checkLogin()">질문 작성하기</div>
			</c:if>
		</div>
		
		<div class="QnABoardListBox">
			<c:forEach var="QnAPostList" items="${QnAPostList}">
				<div class = "QnAListBox" onclick="location.href='${pageContext.request.contextPath}/QnADetail/${QnAPostList.postId}'">
					<div class="QnAList">
						<p>제목 : ${QnAPostList.title}</p> <br>
						<div class="QnAUserInfo">
							<p>작성자 : ${QnAPostList.nickName}</p>
							<p>조회수 : ${QnAPostList.postViews}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
	
	
	
	
	<%@ include file="../footer/Footer.jsp"%>


<script>

	//로그인 유무에 따른 질문작성이동
	function goWriteQnA() {
	    window.location.href = "/writeQnA?param=2"; // 후기 작성 페이지로 이동
	}
	
	function checkLogin() {
	    if (confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")) {
	        window.location.href = "/user/login"; // 로그인 페이지로 이동
	    }
	}

</script>
</body>
</html>