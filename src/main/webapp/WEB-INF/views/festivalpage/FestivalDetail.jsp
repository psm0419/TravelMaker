<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${festival.festivalName}상세 정보</title>
<link rel="stylesheet" href="/css/festivalpage/FestivalDetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="festival-detail">
	<!-- 오늘 날짜를 문자열로 저장 -->
<c:set var="today"><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></c:set>

<c:choose>
    <c:when test="${today < festival.startDate}">
        <c:set var="festivalStatus" value="개최 예정" />
    </c:when>
    <c:when test="${today > festival.endDate}">
        <c:set var="festivalStatus" value="종료" />
    </c:when>
    <c:otherwise>
        <c:set var="festivalStatus" value="축제 진행 중" />
    </c:otherwise>
</c:choose>

<!-- 출력 -->
<header class="festival-detail">
    <h1 class="festival-detail">${festival.festivalName}</h1>
    <span class="badge">${festivalStatus}</span>
</header>
	<div class="poster-container">
		<div class="poster">
			<img src="/image/${festival.festivalId}.jpg">			
		</div>
		<section class="festival-info">
			<p>• 기간: ${festival.startDate} ~ ${festival.endDate}</p>
			<p>• 위치: ${festival.location}</p>
			<p>• 입장료: ${festival.entranceFee}</p>
			<p>• 주최: ${festival.festivalHost}</p>
			<p>• 전화번호: ${festival.tel}</p>
			<button onclick="goToHomepage('${festival.homepageUrl}')" class="homepage-btn">
            <i class="fas fa-globe"></i> 공식 홈페이지 방문하기
        	</button>
		</section>
	</div>
	
	<div class="festival-content">
		<div class="content-text">
			<p>${festival.content}</p>
		</div>
	</div>	
	
		<%@include file="../attraction/AttractionMap.jsp"%>	
		<br>
	<a href="/festivalpage/FestivalPage" class="back-btn">목록으로 돌아가기</a>
		
		<%@include file="../footer/Footer.jsp"%>

<script>
    // 서버에서 JSON 데이터 가져오기
    fetch('/attractions/list')
        .then(response => response.json())
        .then(data => {
            let shuffled = data.sort(() => 0.5 - Math.random()); // 배열 섞기
            let selected = shuffled.slice(0, 5); // 5개 선택

            let listHTML = "";
            selected.forEach(restaurant => {
                listHTML += `<li>🍽 ${attraction_info.hubtatsnm} - ${attraction_info.hubbsicadres}</li>`;
            });

            document.getElementById("attractions-list").innerHTML = listHTML;
        })
        .catch(error => console.error('음식점 데이터를 불러오는 중 오류 발생:', error));
</script>
	
<script>
	function goToHomepage(url) {
    if (url) {
        window.open(url, '_blank');
    } else {
        alert('홈페이지 주소가 없습니다.');
    }
}
</script>
</body>
</html>