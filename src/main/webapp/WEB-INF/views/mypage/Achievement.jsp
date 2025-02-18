<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업적</title>
<link rel="stylesheet" href="../css/mypageSub.css">
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
				<li><a href="/mypage/bookmark">즐겨찾기</a></li>
				<li><a href="/mypage/talk">댓글</a></li>
				<li class="selected"><a href="/mypage/achievement">업적</a></li>
				<li><a href="/mypage/review">후기</a></li>
				<li><a href="/mypage/correction">관광정보수정/신규요청</a></li>
				<li><a href="/mypage/qna">Q&A</a></li>
			</ul>
		</div>

		<div class="container">
			<h1 class="title">업적</h1>
			<p class="subtitle">
			</p>

			<div class="content">
				<div class="no-content">추후 업데이트 예정입니다.</div>
			</div>
		</div>
	</div>
<%@include file="../footer/Footer.jsp"%>
</body>
</html>