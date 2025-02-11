<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${festival.festivalName}상세 정보</title>
<link rel="stylesheet" href="/css/festivalpage/FestivalDetail.css">
</head>
<body class="festival-detail">
	<header class="festival-detail">
		<h1 class="festival-detail">${festival.festivalName}</h1>
		<span class="badge">축제 진행 중</span>
	</header>
	<div class="poster-container">
		<div class="poster">
<!-- 			<img src="festival_poster.png" alt="태백산눈축제 포스터"> -->
		</div>
		<section class="festival-info">
			<p>📅 기간: ${festival.startDate} ~ ${festival.endDate}</p>
			<p>📍 위치: ${festival.location}</p>
			<p>💰 입장료: ${festival.entranceFee}</p>
			<p>🏢 주최: ${festival.festivalHost}</p>
			<p>📞 전화번호: ${festival.tel}</p>
		</section>
	</div>	
		<%@include file="../attraction/AttractionMap.jsp"%>
	<section class="restaurants">
		<h2>축제와 함께 즐기기 좋은 태백시 맛집</h2>
		<ul>
			<li>🍗 태백닭갈비 - 태백시 중앙남1길 10</li>
			<li>🍞 초록뿔언덕카페 - 태백시 고원로 369 (화전동)</li>
			<li>🥩 신가네식당 - 태백시 상장3길 26</li>
		</ul>
	</section>

	<a href="/festivalpage/FestivalPage" class="back-btn">목록으로 돌아가기</a>

	
	
</body>
</html>