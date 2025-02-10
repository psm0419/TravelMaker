<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

.headerContainer {
	width: 100%;
	height: 90px;
	background-color: lightblue;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 30px;
	position: fixed;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 300;
}

/* 로고 */
.headerLogo {
	font-size: 24px;
	font-weight: bold;
	color: #333333;
	display: flex;
	align-items: center;
	cursor: pointer;
}

/* 메뉴 스타일 */
.headerMenu {
	display: flex;
	gap: 50px;
	position: relative;
}

.headerMenu>div {
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	color: #333;
	padding: 10px 15px;
	position: relative;
}

/* 드롭다운 전체 박스 */
.dropdownMenu {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	background: #ffffff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 15px 0 15px 130px;
	z-index: 10;
	border-radius: 5px;
	display: flex;
	justify-content: center;
	z-index: 300;
	background-color : rgb(255,255,255); opacity : 0.9;
}

/* 드롭다운 내부 항목 */
.dropdownMenu div {
	min-width: 120px;
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	color: #333;
	padding: 10px 0;
	cursor: pointer;
	align-content: center;
}

.dropdownMenu div:hover {
	color: green;
	border-radius: 5px;
}

/* 오른쪽 메뉴 */
.headerRightMenu {
	display: flex;
	gap: 15px;
	align-items: center;
}

.headerRightMenu div {
	cursor: pointer;
	font-size: 14px;
}
</style>

</head>
<body>
	<div class="headerContainer">
		<!-- 로고 -->
		<div class="headerLogo">Travel Maker</div>

		<!-- 메뉴 -->
		<div class="headerMenu">
			<div class="headerHome">홈</div>
			<div>축제</div>
			<div>지역</div>
			<div>게시판</div>
		</div>

		<!-- 드롭다운 메뉴 (한 개만 존재) -->
		<div class="dropdownMenu">
			<div class="festival">축제정보</div>
			<div class="area">지역정보</div>
			<div class="board">
				<div class="reviewBoard">후기게시판</div>
				<div class="QnABoard">Q&A게시판</div>
			</div>
		</div>

		<!-- 오른쪽 메뉴 로그인 했을때 마이페이지 표시 / 안했을때 로그인 회원가입 표시 -->
		<div class="headerRightMenu">
			<!-- 로그인 상태 확인 -->
			<c:if test="${empty sessionScope.user}">
				<div>로그인/회원가입</div> <!-- 로그인 안 한 상태 -->
			</c:if>
			<c:if test="${not empty sessionScope.user}">
				<div>마이페이지</div> <!-- 로그인 한 상태 -->
			</c:if>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			// 메뉴에 마우스 올리면 전체 드롭다운 표시
			$(".headerMenu > div:not(:first-child)").mouseenter(function() {
				$(".dropdownMenu").stop(true, true).slideDown(200);
			});
			// 마우스를 벗어나면 드롭다운 숨김
			$(".headerContainer").mouseleave(function() {
				$(".dropdownMenu").stop(true, true).slideUp(200);
			});
			
			// 로고버튼 클릭 시 메인화면으로 페이지 이동
	        $(".headerLogo").click(function() {
	            window.location.href = "/header"; //메인페이지 경로로 수정할것 (아래경로들도 맞게 수정해야함)
	        });
			// 홈 버튼 클릭 시 메인화면으로 페이지 이동
	        $(".headerHome").click(function() {
	            window.location.href = "/header"; //메인페이지 경로로 수정할것 (아래경로들도 맞게 수정해야함)
	        });
			 // 축제정보 페이지 이동
	        $(".festival").click(function() {
	            window.location.href = "https://www.naver.com/";
	        });
	        // 지역정보 페이지 이동
	        $(".area").click(function() {
	            window.location.href = "https://www.naver.com/";
	        });
	        // 후기 게시판 페이지 이동
	        $(".reviewBoard").click(function() {
	            window.location.href = "https://www.naver.com/";
	        });
	        // 질문 답변 게시판 페이지 이동
	        $(".QnABoard").click(function() {
	            window.location.href = "https://www.naver.com/";
	        });
	     	// 로그인,회원가입 페이지 이동
	        $(".login").click(function() {
	            window.location.href = "https://www.naver.com/";
	        });
	     	
		});
	</script>

</body>
</html>
