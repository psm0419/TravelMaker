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

.mainListContainer {
	width: 100%;
	max-width: 1200px; /* 너무 넓어지는 것 방지 */
	height: auto;
	display: flex;
	margin: auto;
	margin-top: 50px;
	justify-content: center;
	flex-direction: column;
	align-items: center;
}

.titleBar {
	font-size: 40px;
	color: blue;
	margin-bottom: 50px;
	text-align: center;
}

.mainList {
	display: flex;
	flex-wrap: wrap;
	gap: 40px;
	flex-direction: row;
	justify-content: center;
}

.festival-card {
	height: 350px;
	width: calc(33% - 80px); /* 중복된 width 제거 */
	background: white;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out;
	cursor: pointer;
}

.festival-card:hover {
	transform: translateY(-5px);
}

/* 링크 스타일 초기화 */
.festival-link {
	text-decoration: none;
	color: inherit;
	display: block; /* 박스 전체가 클릭되도록 */
}

.festival-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.festival-content {
	padding: 15px;
}

.festival-content h3 {
	margin: 10px 0;
	font-size: 18px;
}

.festival-content .date, .festival-content .location {
	font-size: 14px;
	padding-bottom: 5px;
	color: #666;
}

/* 반응형 디자인 */
@media ( max-width : 1024px) {
	.festival-card {
		width: calc(50% - 40px); /* 태블릿에서 2개씩 */
	}
}

@media ( max-width : 768px) {
	.festival-card {
		width: calc(100% - 40px); /* 모바일에서는 1개씩 */
	}
}
</style>

</head>
<body>
	<div class="mainListContainer">

		<div class="titleBar">축제 리스트</div>

		<div class="mainList">
			<c:forEach var="i" begin="1" end="12" step="1">
				<div class="festival-card"
					data-url="https://www.example.com/festival${i}">  <!-- 페이지별 이동경로 -->
					<img
						src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_c05ca1ee-a8ff-41a6-a5c5-9e78bfd913db_1.png"
						alt="청주시 도시농업 페스티벌">
					<div class="festival-content">
						<h3>청주시 도시농업 페스티벌 ${i}</h3>
						<p class="date">2025.05.02 ~ 2025.05.05</p>
						<p class="location">충청북도 청주시</p>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>



	<script>
	    document.addEventListener("DOMContentLoaded", function () {
	        const festivalCards = document.querySelectorAll(".festival-card");
	
	        festivalCards.forEach(card => {
	            card.addEventListener("click", function () {
	                const url = card.getAttribute("data-url"); // 개별 URL 가져오기
	                if (url) {
	                    window.location.href = url; // 해당 URL로 이동
	                }
	            });
	        });
	    });
	</script>

</body>
</html>