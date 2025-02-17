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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
				<div class="festival-card" data-festival-id="${festival.festivalId}"
					data-popularity="${festival.likeCount}"
					onclick="location.href='/festivalpage/FestivalDetail/${festival.festivalId}'">
					<div class="image-container">
						<button class="like-button"
							onclick="likeFestival(event, ${festival.festivalId})">
							<i class="${festival.liked ? 'fas' : 'far'} fa-heart"
								style="color: ${festival.liked ? 'red' : 'black'};"></i>
						</button>
						<p class="like-count">${festival.likeCount}좋아요</p>
						<c:if test="${not empty festival.images}">
							<c:forEach var="image" items="${festival.images}">
								<img src="${image.filePath}" alt="${image.fileName}">
							</c:forEach>
						</c:if>
					</div>
					<div class="festival-content">
						<div class="title-like-container">
							<h3>${festival.festivalName}
								<span class="like-count">(${festival.likeCount})</span>
							</h3>
						</div>
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

function likeFestival(event, festivalId) {
    event.stopPropagation(); // 이벤트 버블링 중지
    event.preventDefault(); // 기본 이벤트 방지

    let loggedInUser = '${loggedInUser}';

    if (!loggedInUser) {
        alert("로그인 후 좋아요를 눌러주세요.");
        window.location.href = "/user/login";
        return;
    }

    // 좋아요 버튼 요소 가져오기
    const likeButton = event.currentTarget;
    const festivalCard = likeButton.closest('.festival-card');
    const heartIcon = likeButton.querySelector('i');
    const titleElement = festivalCard.querySelector('.title-like-container .like-count');
    let currentCount = parseInt(titleElement.textContent.replace(/[()]/g, ''));  // 현재 좋아요 수
    const isLiked = heartIcon.classList.contains('fas'); // 현재 좋아요 상태 확인

    // AJAX로 좋아요 처리
    $.ajax({
        url: "/festival/like",
        type: "POST",
        data: {
            userId: loggedInUser,
            festivalId: festivalId
        },
        success: function(response) {
            const newLikeCount = parseInt(response);  // 서버에서 반환된 새로운 좋아요 수

            // 좋아요 상태에 따른 하트 아이콘 변경
            if (!isLiked) {  // 좋아요 추가
                heartIcon.classList.remove('far');
                heartIcon.classList.add('fas');
                heartIcon.style.color = "red";
            } else {  // 좋아요 취소
                heartIcon.classList.remove('fas');
                heartIcon.classList.add('far');
                heartIcon.style.color = "black";
            }

            // 좋아요 수 갱신
            titleElement.textContent = `(${newLikeCount})`;  // 새로운 좋아요 수
            festivalCard.dataset.popularity = newLikeCount; // data-popularity 업데이트
        },
        error: function(error) {
            console.error("좋아요 처리 중 오류 발생:", error);
            alert("좋아요 처리 중 오류가 발생했습니다.");
        }
    });
}
</script>

</html>