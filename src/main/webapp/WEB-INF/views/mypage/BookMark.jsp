<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 즐겨찾기</title>
<link rel="stylesheet" href="../css/mypage2.css">
</head>
<body>
	<div class="mainHeaderContainer">
		<header>
			<%@include file="../header/Header.jsp"%>
		</header>
	</div>
	
	<h1 class="betweenHeader">마이페이지</h1>
	
	<div class="main-container">

		<div class="sidebar">
			<ul>
				<li class="selected"><a href="/mypage/bookmark">즐겨찾기</a></li>
				<li><a href="/mypage/talk">여행톡</a></li>
				<li><a href="/mypage/achievement">업적</a></li>
				<li><a href="/mypage/review">후기</a></li>
				<li><a href="/mypage/correction">관광정보 수정/신규 요청</a></li>
				<li><a href="/mypage/qna">Q&A</a></li>
			</ul>
		</div>

		<div class="container">
			<h1 class="title">즐겨찾기</h1>
			<p class="subtitle">
				총 <strong>0</strong> 건
			</p>

			<div class="content">
				<div class="no-content">즐겨찾기한 항목이 없습니다.</div>
			</div>
		</div>
	</div>

</body>
</html>