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

.mainHeaderContainer{
}

.slideContainer{
	margin: auto;
	padding-top: 150px;
	width: 69%;
	height: 100%;
	overflow:hidden;
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
	border-radius: 30px;
}

/* effect */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@-webkit-keyframes fade {
    from { opacity: .4; }
    to { opacity: 1; }
}

@keyframes fade {
    from { opacity: .4; }
    to { opacity: 1; }
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
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

</head>
<body>
	<div class=mainHeaderContainer>
		<jsp:include page="../header/Header.jsp" />
	</div>
	
	<div class="slideContainer">
		<div class="slideshow-container">			<!-- 이미지크기 940x527 -->
			<div class="mySlideDiv fade active">
				<a href="https://www.naver.com">
					<img src="/images/유채꽃축제.jpg">
				</a>
			</div>
	
			<div class="mySlideDiv fade">
				<a href="https://www.naver.com">
					<img src="/images/유채꽃축제2.jpg">
				</a>
			</div>
	
			<div class="mySlideDiv fade">
				<a href="https://www.naver.com">
					<img src="/images/유채꽃축제.jpg">
				</a>
			</div>
			
			<div class="mySlideDiv fade">
				<a href="https://www.naver.com">
					<img src="/images/유채꽃축제2.jpg">
				</a>
			</div>
			
			<div class="mySlideDiv fade">
				<a href="https://www.naver.com">
					<img src="/images/유채꽃축제3.jpg">
				</a>
			</div>
	
			<a class="prev" onclick="prevSlide()">&#10094;</a> <a class="next"
				onclick="nextSlide()">&#10095;</a>
		</div>
	</div>
	
	
	<jsp:include page="../mainlistpage/MainList.jsp" />
		
	
	
	
	
	
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