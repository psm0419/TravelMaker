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
	
	.container {
		width: 100%;
		height: 100%;
		perspective: 500px;
		transform-style: preserve-3d;
	}
	
	.slide {
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

	.slide:nth-of-type(1), .slide:nth-of-type(2) {
		transform: translate(calc(-50% * 5.1), -50%) translateZ(-100px);
	}
	
	.slide:nth-of-type(3) {
		transform: translate(calc(-50% * 3.1), -50%) translateZ(-50px);
	}
	
	.slide:nth-of-type(4) {
		transform: translate(calc(-50% * 1.1), -50%) translateZ(50px);
	}
	
	.slide:nth-of-type(5) {
		transform: translate(calc(-50% * -0.9), -50%) translateZ(-50px);
	}
	
	.slide:nth-of-type(6), .slide:nth-of-type(7) {
		transform: translate(calc(-50% * -2.9), -50%) translateZ(-100px);
	}
	
	/*버튼 */
	.buttons {
		position: relative;
		z-index: 1;
		bottom: 50%;
		left: 49%;
		transform: translate(-50%);
	}
	
	.prev, .next {
		background-color: lightgray;
		border: none;
	}
	
	.prev:hover, .next:hover {
		background-color: lightgreen;
	}
	
</style>

</head>
<body>

	<div class = "bottomSlideContainer">
		<div class="container">
			<div class='slide'>1</div>
			<div class='slide'>2</div>
			<div class='slide'>3</div>
			<div class='slide'>4</div>
			<div class='slide'>5</div>
			<div class='slide'>6</div>
			<div class='slide'>7</div>
		</div>
	
		<div class='buttons'>
			<button class='prev'><</button>
			<button class='next'>></button>
		</div>
	</div>



	<script>
		
		const container = document.querySelector('.container');
		const prev = document.querySelector('.prev')
		const next = document.querySelector('.next')
	
		prev.addEventListener('click',()=>{
		  const slides = document.querySelectorAll('.slide')
		  
		  container.append(slides[0])
		})
	
		next.addEventListener('click',()=>{
		  const slides = document.querySelectorAll('.slide')
		  
		  container.prepend(slides[slides.length-1])
		})
	
	</script>

</body>
</html>