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
<body class="festival-main">
	<%@include file="../header/Header.jsp"%>
	<div class="festival-container">
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
				<option>전북특별자치도</option>
			</select>
			<button class="search_btn">검색</button>
		</div>
		<div class="festival-sort">
			<span id="sortByDate" class="active">축제일순</span> <span
				id="sortByPopularity">인기순</span>
		</div>
		<!-- 		DB에서 축제정보 가져올때 반복으로 만들기 -->
		<div class="festival-list">
			<c:forEach var="festival" items="${festivalList}">
				<div class="festival-card"
					onclick="location.href='/festivalpage/FestivalDetail/${festival.festivalId}'">
					<c:if test="${not empty festival.images}">
						<c:forEach var="image" items="${festival.images}">
							<div class="image-container">
								<img src="${image.filePath}" alt="${image.fileName}">
							</div>
						</c:forEach>
					</c:if>
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
</body>

<script>
document.getElementById("sortByDate").addEventListener("click", function () {
    this.classList.add("active");
    document.getElementById("sortByPopularity").classList.remove("active");
    sortFestivals("date");
});

document.getElementById("sortByPopularity").addEventListener("click", function () {
    this.classList.add("active");
    document.getElementById("sortByDate").classList.remove("active");
    sortFestivals("popularity");
});

function sortFestivals(criteria) {
    let festivalList = document.querySelector(".festival-list");
    let festivals = Array.from(festivalList.children);

    festivals.sort((a, b) => {
        let aValue, bValue;

        if (criteria === "date") {
            aValue = new Date(a.querySelector(".date").textContent.trim().split("📅")[1].split("~")[0].trim());
            bValue = new Date(b.querySelector(".date").textContent.trim().split("📅")[1].split("~")[0].trim());
            return aValue - bValue;
        } else if (criteria === "popularity") {
            aValue = parseInt(a.getAttribute("data-popularity")) || 0;
            bValue = parseInt(b.getAttribute("data-popularity")) || 0;
            return bValue - aValue; // 인기순은 내림차순
        }
    });

    festivalList.innerHTML = "";
    festivals.forEach(festival => festivalList.appendChild(festival));
}

document.querySelector(".search_btn").addEventListener("click", function () {
    let selectedLocation = document.querySelector(".select_box").value;
    let festivalList = document.querySelector(".festival-list");
    let festivals = Array.from(festivalList.children);

    festivals.forEach(festival => {
        let locationText = festival.querySelector(".location").textContent.trim();
        if (selectedLocation === "지역 선택" || locationText.includes(selectedLocation)) {
            festival.style.display = "block";
        } else {
            festival.style.display = "none";
        }
    });
});
</script>

</html>