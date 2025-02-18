<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광정보수정요청</title>
<link rel="stylesheet" href="../css/mypageSub.css">
</head>
<body>
	<div class="mainHeaderContainer">
		<header>
			<%@include file="../header/Header.jsp"%>
		</header>
	</div>

	<!-- 메인 콘텐츠 & 사이드바 (가로 정렬) -->
	<div class="main-container">
		
		<!-- 사이드바 -->
		<div class="sidebar">
			<ul>
				<li><a href="/mypage/bookmark">즐겨찾기</a></li>
				<li><a href="/mypage/talk">여행톡</a></li>
				<li><a href="/mypage/achievement">업적</a></li>
				<li><a href="/mypage/review">후기</a></li>
				<li class="selected"><a href="/mypage/correction">관광정보수정/신규요청</a></li>
				<li><a href="/mypage/qna">Q&A</a></li>
			</ul>
		</div>

		<!-- 메인 콘텐츠 -->
		<div class="container">
			<h1 class="title">관광정보 수정요청</h1>
			<p class="subtitle">
				총 <strong>0</strong> 건
			</p>

			<div class="content">
				<!-- 즐겨찾기 목록이 없을 때 표시 -->
				<div class="no-content">요청한 항목이 없습니다.</div>
			</div>
		</div>
	</div>

</body>
</html>