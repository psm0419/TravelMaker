<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<link rel="stylesheet" type="text/css" href="/css/header/Header.css">

<style>
.mainHeaderContainer {
	width: 100%;
	height: 110px;
}
</style>

</head>
<body>
	<div class="mainHeaderContainer">
		<div class="headerContainer">
			<!-- 로고 -->
			<div class="headerLogo">
				<img src="/images/TravelMakerLogo.jpg" alt="logo"> Travel
				Maker
			</div>

			<!-- 메뉴 -->
			<div class="headerMenu">
				<div class="headerHome">홈</div>
				<div>축제</div>				
				<div>게시판</div>

				<form method="get" action="/searchFestival" class="search-box2">
					<input type="text" name="searchQuery" placeholder="검색어를 입력하세요">
					<button type="submit">검색</button>
				</form>

			</div>

			<!-- 드롭다운 메뉴 (한 개만 존재) -->
			<div class="dropdownMenu">
				<div class="festival">축제정보</div>				
				<div class="board">
					<div class="reviewBoard">후기게시판</div>
					<div class="QnABoard">Q&A게시판</div>
				</div>
			</div>

			<!-- 오른쪽 메뉴 로그인 했을때 마이페이지 표시 / 안했을때 로그인 회원가입 표시 -->
			<div class="headerRightMenu login">
				<!-- 로그인 상태 확인 -->
				<c:choose>
					<c:when test="${empty sessionScope.loggedInUser}">
						<div>로그인/회원가입</div>
						<!-- 로그인 안 한 상태 -->
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.loggedInUser.userType == 'CUS'}">
								<div class="page-link">마이페이지</div>
								<!-- 고객 로그인 -->
							</c:when>
							<c:when test="${sessionScope.loggedInUser.userType == 'ADM'}">
								<div class="page-link">관리자페이지</div>
								<!-- 관리자 로그인 -->
							</c:when>
						</c:choose>
						<a href="javascript:void(0);" class="logout">로그아웃</a>
						<!-- 로그아웃 버튼 -->
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(
				function() {
					// 새로고침 시 드롭다운 숨기기
					$(".dropdownMenu").hide();

					// 메뉴에 마우스 올리면 전체 드롭다운 표시
					$(".headerMenu > div:not(:first-child)").mouseenter(
							function() {
								$(".dropdownMenu").stop(true, true).slideDown(
										200);
							});
					// 마우스를 벗어나면 드롭다운 숨김
					$(".headerContainer").mouseleave(function() {
						$(".dropdownMenu").stop(true, true).slideUp(200);
					});

					// 로고버튼 클릭 시 메인화면으로 페이지 이동
					$(".headerLogo").click(function() {
						window.location.href = "/"; //메인페이지 경로로 수정할것 (아래경로들도 맞게 수정해야함)
					});
					// 홈 버튼 클릭 시 메인화면으로 페이지 이동
					$(".headerHome").click(function() {
						window.location.href = "/"; //메인페이지 경로로 수정할것 (아래경로들도 맞게 수정해야함)
					});
					// 축제정보 페이지 이동
					$(".festival").click(function() {
						window.location.href = "/festivalpage/FestivalPage";
					});

					// 후기 게시판 페이지 이동
					$(".reviewBoard").click(function() {
						window.location.href = "/reviewBoard?boardId=1";
					});
					
					// 후기 게시판 페이지 이동
					$(".QnABoard").click(function() {
						window.location.href = "/QnABoard?boardId=2";
					});

					$(".login").off('click').on('click', function() {
						var userType = "${sessionScope.loggedInUser.userType}";
						if (userType === "CUS") {
							window.location.href = "/mypage";
						} else if (userType === "ADM") {
							window.location.href = "/admin";
						} else {
							window.location.href = "/user/login";
						}
					});

					$(".logout").click(function (e) {
					    e.preventDefault(); // 기본 이벤트 중단
					    console.log("로그아웃 버튼 클릭됨"); // 디버깅 로그 추가

					    if (confirm("정말 로그아웃 하시겠습니까?")) {
					        console.log("사용자가 로그아웃 확인 클릭");

					        $.ajax({
					            url: "/user/logout",
					            type: "POST",
					            success: function (response) {
					                console.log("로그아웃 성공, 메인 페이지로 이동");
					                window.location.replace("/");
					            },
					            error: function (xhr, status, error) {
					                console.error("로그아웃 중 오류 발생:", error);
					                alert("로그아웃 처리 중 오류가 발생했습니다.");
					            }
					        });
					    } else {
					        console.log("사용자가 로그아웃 취소 클릭 - 아무 동작 없음");
					        return false; // 추가: 취소 시 명확하게 아무 동작도 하지 않도록 방지
					    }
					});

					// 헤더 메뉴 클릭 이벤트 바인딩
					function bindHeaderMenuClickEvents() {
						$(".headerLogo, .headerHome, .headerRightMenu").click(
								function(e) {
									e.preventDefault();
									window.location.href = "/";
								});
					}
				});
	</script>

</body>
</html>
