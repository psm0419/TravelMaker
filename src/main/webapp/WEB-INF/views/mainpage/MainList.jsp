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
	font-weight: bold;
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
	height: 380px;
	width: calc(33% - 80px);
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

.festival-link {
	text-decoration: none;
	color: inherit;
	display: block;
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

.festival-content .date, .festival-content .location, .festival-content.fee {
	font-size: 14px;
	padding-bottom: 8px;
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
			<c:forEach var="festival" items="${festivalList}">
				<div class="festival-card"
					onclick="location.href='/festivalpage/FestivalDetail/${festival.festivalId}'">
					<img
						src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_c05ca1ee-a8ff-41a6-a5c5-9e78bfd913db_1.png"
						alt="${festival.festivalName}">
					<div class="festival-content">
						<h3>${festival.festivalName}</h3>
						<p class="date">📅 ${festival.startDate} ~ ${festival.endDate}</p>
						<p class="location">📍 ${festival.location}</p>
						<p class="fee">💰 ${festival.entranceFee}</p>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	



	<script>
	    
	</script>

</body>
</html>