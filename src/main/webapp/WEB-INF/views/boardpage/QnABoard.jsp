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
	
	.QnAListBox {
		height: 150px;
		width: 300px;
		border: 1px solid lightgray;
		border-radius: 12px;
		overflow: hidden;
		cursor: pointer;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		transition: transform 0.3s ease-in-out;
	}
	
	.QnAListBox.motion.motionUp.show:hover {
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
	
	.QnAList {
		padding: 20px;
		width: 100%;
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		font-weight: bold;
	}
	
	.QnAList p:nth-child(3), .QnAList p:nth-child(4) {
		font-size: 12px;
		color: gray;
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
			<div class="goWriteQnA" onclick="location.href='/writeQnA?param=2'">질문 작성하기</div>
		</div>
		
		<div class="QnABoardListBox">
			<c:forEach var="QnAPostList" items="${QnAPostList}">
				<div class = "QnAListBox" onclick="location.href='${pageContext.request.contextPath}/QnADetail/${QnAPostList.postId}'">
					<div class="QnAList">
						<p>제목 : ${QnAPostList.title}</p> <br>
						<p>작성자 : ${QnAPostList.nickName}</p>
						<p>조회수 : ${QnAPostList.postViews}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
	
	
	
	
	<%@ include file="../footer/Footer.jsp"%>

</body>
</html>