<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Maker</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.mainHeaderContainer {
	margin-bottom: -100px;
}

.slideContainer {
	margin: auto;
	padding-top: 150px;
	width: 69%;
	height: 100%;
	overflow: hidden;
}

/* Slideshow container */
.slideshow-container {
	position: relative;
	margin: 0;
	padding: 0;
	height: 140%;
}

.mySlideDiv {
	width: 100%;
	height: 100%;
}

.slideshow-container img {
	width: 100%; /* 이미지가 슬라이드 컨테이너에 맞게 조정됨 */
	height: 100%;
	object-fit: contain;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* effect */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {from { opacity:.4;
	
}

to {
	opacity: 1;
}

}
@
keyframes fade {from { opacity:.4;
	
}

to {
	opacity: 1;
}

}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: black;
	font-weight: bold;
	font-size: 28px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}
</style>
<link rel="stylesheet" type="text/css"
	href="/css/travelNewsContainer/travelNewsContainer.css">
</head>
<body>
	<div class=mainHeaderContainer>
		<%@include file="../header/Header.jsp"%>
	</div>

	<div class="slideContainer">
		<div class="slideshow-container">
			<!-- 이미지크기 940x527 -->
			<div class="mySlideDiv fade active">
				<img
					src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=e0423c22-ed8c-494b-83fd-871aaf6957b0&mode=raw">
			</div>
			<div class="mySlideDiv fade">
				<img
					src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f0b64486-59e3-469b-a3b9-f5150d19e653&mode=raw">
			</div>
			<div class="mySlideDiv fade">
				<img
					src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ffe260f9-2a29-4865-892b-75a9bb43d921&mode=raw">
			</div>
			<div class="mySlideDiv fade">
				<img
					src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=48304ca9-7f0e-4710-bc7d-7f4c3918f402&mode=raw">
			</div>
			<div class="mySlideDiv fade">
				<img
					src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=780d41aa-9cc7-4719-9ce2-a3d4f45e0f55&mode=raw">
			</div>
			<a class="prev" onclick="prevSlide()">&#10094;</a> <a class="next"
				onclick="nextSlide()">&#10095;</a>
		</div>
	</div>



	<div class="travelNewsContainer">
		<div class="newsBox">
		<div class="imgBox">
			<div class="newsImage">
				<img src="/images/여행소식.jpg" alt="여행 소식">
			</div>
			</div>
			<div class="newsText">
				<div class="newsHeader">오늘의 축제 추천</div>
				<br>
				<c:forEach var="festival" items="${festivalList}">
					<div class="newsList">
						<p>"${festival.festivalName}"</p>
					</div>
					<br>
				</c:forEach>
			</div>
		</div>
	</div>


	<%@include file="MainBottomSlide.jsp"%>


	<%@ include file="../footer/Footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".mySlideDiv").not(".active").hide(); // 첫번째 슬라이드만 보이게 설정하고 나머지는 숨김

			setInterval(nextSlide, 4000); // 4초마다 다음 슬라이드로 넘어감
		});

		// 이전 슬라이드
		function prevSlide() {
			var allSlide = $(".mySlideDiv");
			var currentIndex = 0;

			$(".mySlideDiv").each(function(index, item) {
				if ($(this).hasClass("active")) {
					currentIndex = index;
				}
			});

			var newIndex = currentIndex <= 0 ? allSlide.length - 1
					: currentIndex - 1;

			$(".mySlideDiv").removeClass("active");
			$(".mySlideDiv").eq(newIndex).addClass("active");
			$(".mySlideDiv").hide().eq(newIndex).show();
		}

		// 다음 슬라이드
		function nextSlide() {
			var allSlide = $(".mySlideDiv");
			var currentIndex = 0;

			$(".mySlideDiv").each(function(index, item) {
				if ($(this).hasClass("active")) {
					currentIndex = index;
				}
			});

			var newIndex = currentIndex >= allSlide.length - 1 ? 0
					: currentIndex + 1;

			$(".mySlideDiv").removeClass("active");
			$(".mySlideDiv").eq(newIndex).addClass("active");
			$(".mySlideDiv").hide().eq(newIndex).show();
		}
	</script>

</body>
</html>