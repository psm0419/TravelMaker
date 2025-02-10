<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Bottom Slide</title>

<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	.bottomSlideContainer {
		width: 75%;
		height: 200px;
		margin: auto;
		margin-top: 200px;
		margin-bottom: 200px;
		padding-left: 15px;
	}
	
	.innerBottomSlideContainer {
		width: 100%;
		height: 100%;
		perspective: 500px;
		transform-style: preserve-3d;
	}
	
	.bottomSlide {
		transition: 0.5s;
		width: 250px;
		box-shadow: 0 5px 15px lightgray;
		height: 250px;
		background: white;
		border: 1px solid rgba(0, 0, 0, 0.1);
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
	
	.bottomSlide img {
		width: 250px;
		height: 250px;
	}

	.bottomSlide:nth-of-type(1), .bottomSlide:nth-of-type(2) {
		transform: translate(calc(-50% * 5.1), -50%) translateZ(-100px);
	}
	
	.bottomSlide:nth-of-type(3) {
		transform: translate(calc(-50% * 3.1), -50%) translateZ(-50px);
	}
	
	.bottomSlide:nth-of-type(4) {
		transform: translate(calc(-50% * 1.1), -50%) translateZ(50px);
	}
	
	.bottomSlide:nth-of-type(5) {
		transform: translate(calc(-50% * -0.9), -50%) translateZ(-50px);
	}
	
	.bottomSlide:nth-of-type(6), .bottomSlide:nth-of-type(7) {
		transform: translate(calc(-50% * -2.9), -50%) translateZ(-100px);
	}
	
	/*버튼 */
	.bottomSlideButtons {
		position: relative;
		z-index: 1;
		bottom: 60%;
		left: 49%;
		transform: translate(-50%);
		display: flex;
		justify-content: space-between;
	}
	
	.bottomSlidePrev, .bottomSlideNext {
		background-color: lightgray;
		border: none;
		width: 50px;
		height: 50px;
		cursor: pointer;
		border-radius: 20px;
	}
	
	.bottomSlidePrev:hover, .bottomSlideNext:hover {
		background-color: lightgreen;
	}
	
</style>

</head>
<body>

	<div class = "bottomSlideContainer">
		<div class="innerBottomSlideContainer">
			<div class='bottomSlide'><img src="/images/유채꽃축제.jpg"></div>
			<div class='bottomSlide'><img src="/images/유채꽃축제2.jpg"></div>
			<div class='bottomSlide'><img src="/images/유채꽃축제3.jpg"></div>
			<div class='bottomSlide'><img src="/images/유채꽃축제.jpg"></div>
			<div class='bottomSlide'><img src="/images/유채꽃축제2.jpg"></div>
			<div class='bottomSlide'><img src="/images/유채꽃축제3.jpg"></div>
			<div class='bottomSlide'><img src="/images/유채꽃축제.jpg"></div>
		</div>
	
		<div class='bottomSlideButtons'>
			<button class='bottomSlidePrev'><</button>
			<button class='bottomSlideNext'>></button>
		</div>
	</div>



	<script>
		
		const container = document.querySelector('.innerBottomSlideContainer');
		const prev = document.querySelector('.bottomSlidePrev')
		const next = document.querySelector('.bottomSlideNext')
	
		prev.addEventListener('click',()=>{
		  const slides = document.querySelectorAll('.bottomSlide')
		  
		  container.append(slides[0])
		})
	
		next.addEventListener('click',()=>{
		  const slides = document.querySelectorAll('.bottomSlide')
		  
		  container.prepend(slides[slides.length-1])
		})
	
	</script>

</body>
</html>