<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FestivalInfo</title>
<link rel="stylesheet" type="text/css"
	href="/css/festivalpage/FestivalPage.css">
</head>
<body>
	<div class="container">
		<div class="search-box">
			<select class="select_box">
				<option>지역 선택</option>
				<option>서울</option>
				<option>경기도</option>
				<option>충청남도</option>
				<option>충청북도</option>
				<option>강원도</option>
				<option>경상남도</option>
				<option>경상북도</option>
				<option>전라남도</option>
				<option>전라북도</option>
			</select>
			<button class="search_btn">검색</button>
		</div>
		<div class="festival-sort">
			<span id="sortByDate" class="active">축제일순</span> <span
				id="sortByPopularity">인기순</span>
		</div>
<!-- 		DB에서 축제정보 가져올때 반복으로 만들기 -->
		<div class="festival-container">
			<c:forEach var="festival" items="${festival}">
				<div class="festival-card" onclick="location.href='/festivalpage/FestivalDetail?id=${festival.festival_id}'">
					 <h3>${festival.festivalName}</h3>
	                <p>📍 ${festival.location}</p>
	                <p>📅 ${festival.startDate} ~ ${festival.endDate}</p>
	                <p>💰 ${festival.entranceFee}</p>
				</div>
			</c:forEach>
		</div>

		<div class="festival-list">
			<div class="festival-card"
				onclick="location.href='/festivalpage/FestivalDetail?id=${festival.festival_id}">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_c05ca1ee-a8ff-41a6-a5c5-9e78bfd913db_1.png"
					alt="청주시 도시농업 페스티벌">
				<div class="festival-content">
					<h3>청주시 도시농업 페스티벌</h3>
					<p class="date">2025.05.02 ~ 2025.05.05</p>
					<p class="location">충청북도 청주시</p>
				</div>
			</div>

			<div class="festival-card"
				onclick="location.href='FestivalDetail.jsp?id=2';">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_c34e66ec-0b3d-48be-96eb-c0ffbb6436ec_1.jpg"
					alt="영동 곶감 축제">
				<div class="festival-content">
					<h3>영동 곶감 축제</h3>
					<p class="date">2025.01.03 ~ 2025.01.05</p>
					<p class="location">충청북도 영동군</p>
				</div>
			</div>

			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_af789025-8035-4c59-8b84-5a9e0733d134_1.jpg"
					alt="태백 겨울 축제">
				<div class="festival-content">
					<h3>태백 겨울 축제</h3>
					<p class="date">2025.02.07 ~ 2025.02.16</p>
					<p class="location">강원특별자치도 태백시</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_c0f75de3-9cc2-4e84-8c7b-e77900e6ab13_1.JPG"
					alt="정월대보름 달맞이 축제">
				<div class="festival-content">
					<h3>정월대보름 달맞이 축제</h3>
					<p class="date">2025.02.12 ~ 2025.02.12</p>
					<p class="location">강원특별자치도 춘천시</p>
				</div>
			</div>

			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_86e5f381-79ef-4581-8676-a1e5b1610f35_1.JPG"
					alt="홍성 남당항 수산물 축제">
				<div class="festival-content">
					<h3>홍성 남당항 수산물 축제</h3>
					<p class="date">2025.02.07 ~ 2025.04.07</p>
					<p class="location">충청남도 홍성군</p>
				</div>
			</div>

			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_7be130ae-d136-45d7-9a5c-de3af5691c16_1.jpg"
					alt="태안 빛 축제">
				<div class="festival-content">
					<h3>태안 빛 축제</h3>
					<p class="date">2025.01.01 ~ 2025.12.31</p>
					<p class="location">충청남도 태안군</p>
				</div>
			</div>

			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_d2f258a8-33c2-4cd9-8736-41be5c9407d7_1.jpg"
					alt="낭만 등불 축제">
				<div class="festival-content">
					<h3>낭만 등불 축제</h3>
					<p class="date">2024.05.01 ~ 2025.04.30</p>
					<p class="location">경기도 남양주시</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_574f97f5-ed62-416b-b359-73cb1b3ca87a_1.JPG"
					alt="양평 빙어 축제">
				<div class="festival-content">
					<h3>양평 빙어 축제</h3>
					<p class="date">2025.02.17 ~ 2025.02.23</p>
					<p class="location">경기도 양평군</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_f1083d7d-3abb-4f3e-a27b-67f8ecd01a22_1.jpg"
					alt="관악 별빛 산책">
				<div class="festival-content">
					<h3>관악 별빛 산책</h3>
					<p class="date">2024.11.11 ~ 2025.02.09</p>
					<p class="location">서울 관악구</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_41577144-a7e0-482a-a7fd-1f94e273d6ad_1.jpg"
					alt="궁중 문화 축전">
				<div class="festival-content">
					<h3>궁중 문화 축전</h3>
					<p class="date">2025.04.26 ~ 2025.05.04</p>
					<p class="location">서울 종로구</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_3252dcb7-7b01-4e9d-84c0-bccfd010bffb_1.jpg"
					alt="청도 프로방스 빛 축제">
				<div class="festival-content">
					<h3>청도 프로방스 빛 축제</h3>
					<p class="date">2025.01.11 ~ 2025.11.30</p>
					<p class="location">경상북도 청도군</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/aa15dc9d-7421-493b-a909-50c3da205701_6.jpg"
					alt="안동 암산 얼음 축제">
				<div class="festival-content">
					<h3>안동 암산 얼음 축제</h3>
					<p class="date">2025.04.26 ~ 2025.05.04</p>
					<p class="location">경상북도 안동시</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_a212b550-67bf-422e-a110-7bb742e84672_1.jpg"
					alt="사천 에어쇼">
				<div class="festival-content">
					<h3>사천 에어쇼</h3>
					<p class="date">2025.10.29 ~ 2025.11.01</p>
					<p class="location">경상남도 사천시</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_7d5710ef-ecff-4b71-92f7-e9a404a1f1cc_1.jpg"
					alt="거제도 국제펭귄 수영 축제">
				<div class="festival-content">
					<h3>거제도 국제펭귄 수영 축제</h3>
					<p class="date">2025.01.11 ~ 2025.01.11</p>
					<p class="location">경상남도 거제시</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_b8b518b6-19c8-40b7-8da6-7dbd9f44d489_1.jpg"
					alt="영암 고구마 달빛 축제">
				<div class="festival-content">
					<h3>영암 고구마 달빛 축제</h3>
					<p class="date">2025.02.15 ~ 2025.02.15</p>
					<p class="location">전라남도 영암군</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_3c8b7d73-aac8-4052-b566-a6cb99e55beb_1.JPG"
					alt="강진 청자 축제">
				<div class="festival-content">
					<h3>강진 청자 축제</h3>
					<p class="date">2025.02.22 ~ 2025.03.03</p>
					<p class="location">전라남도 강진군</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_4dc65cd3-bdcd-40e2-bfbe-684501b7f268_1.jpg"
					alt="고창청농원 라벤더 축제">
				<div class="festival-content">
					<h3>고창청농원 라벤더 축제</h3>
					<p class="date">2025.05.23 ~ 2025.06.30</p>
					<p class="location">전라북도 고창군</p>
				</div>
			</div>
			<div class="festival-card">
				<img
					src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/300_49184d63-fc3d-4fc2-a7af-ac45c6a70cb4_1.jpg"
					alt="설맞이 작은문화축전">
				<div class="festival-content">
					<h3>설맞이 작은문화축전</h3>
					<p class="date">2025.01.28 ~ 2025.01.30</p>
					<p class="location">전라북도 전주시</p>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
document.getElementById("sortByDate").addEventListener("click", function() {
    this.classList.add("active");
    document.getElementById("sortByPopularity").classList.remove("active");

    // 축제 목록을 '축제일순' 기준으로 정렬하는 로직 추가
    sortFestivals("date");
});

document.getElementById("sortByPopularity").addEventListener("click", function() {
    this.classList.add("active");
    document.getElementById("sortByDate").classList.remove("active");

    // 축제 목록을 '인기순' 기준으로 정렬하는 로직 추가
    sortFestivals("popularity");
});
function sortFestivals(criteria) {
    let festivalList = document.getElementById("fstvlList");
    let festivals = Array.from(festivalList.children);

    festivals.sort((a, b) => {
        let aValue, bValue;

        if (criteria === "date") {
            aValue = new Date(a.querySelector(".date").textContent.trim().split("~")[0]);
            bValue = new Date(b.querySelector(".date").textContent.trim().split("~")[0]);
        } else if (criteria === "popularity") {
            aValue = parseInt(a.getAttribute("data-popularity")) || 0;
            bValue = parseInt(b.getAttribute("data-popularity")) || 0;
        }

        return aValue - bValue;
    });

    festivalList.innerHTML = "";
    festivals.forEach(festival => festivalList.appendChild(festival));
}
</script>
</html>