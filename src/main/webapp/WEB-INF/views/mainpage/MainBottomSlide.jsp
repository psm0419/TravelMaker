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
		height: 350px;
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
		bottom: 50%;
		left: 49%;
		transform: translate(-50%);
		display: flex;
		justify-content: space-between;
		width: 1150px;
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
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/c34e66ec-0b3d-48be-96eb-c0ffbb6436ec_3.jpg"></div>
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/d2f258a8-33c2-4cd9-8736-41be5c9407d7_3.jpg"></div>
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/f1083d7d-3abb-4f3e-a27b-67f8ecd01a22_3.jpg"></div>
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/3252dcb7-7b01-4e9d-84c0-bccfd010bffb_3.jpg"></div>
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/a212b550-67bf-422e-a110-7bb742e84672_3.jpg"></div>
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/b8b518b6-19c8-40b7-8da6-7dbd9f44d489_3.jpg"></div>
			<div class='bottomSlide'><img src="https://kfescdn.visitkorea.or.kr/kfes/upload/contents/db/7d5710ef-ecff-4b71-92f7-e9a404a1f1cc_3.jpg"></div>
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