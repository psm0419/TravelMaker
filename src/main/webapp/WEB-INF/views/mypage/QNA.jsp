<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
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
				<li><a href="/mypage/achievement">업적</a></li>
				<li><a href="/mypage/review">후기</a></li>
				<li><a href="/mypage/correction">관광정보 수정 <br>신규 요청</a></li>
				<li class="selected"><a href="/mypage/qna">Q&A</a></li>
			</ul>
		</div>

		<div class="container">
			<h1 class="title">Q&A</h1>
			<p class="subtitle">
				총 <strong>0</strong> 건
			</p>

			<div class="content">
				<div class="no-content">Q&A 항목이 없습니다.</div>
			</div>
		</div>
	</div>
	<%@include file="../footer/Footer.jsp"%>
</body>
</html>