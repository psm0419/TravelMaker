<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TM 마이페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.mypageContainer {
	width: 500px;
	height: 300px;
}
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f0f0;
    margin: 0;
}

.mypage {
    display: grid;
    grid-template-columns: 1fr 1.5fr;
    grid-template-rows: auto auto;
    gap: 10px;
    width: 500px;
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.achievements {
    grid-column: 1 / 2;
    grid-row: 1 / 2;
    background: #4A90E2;
    color: white;
    padding: 15px;
    border-radius: 10px;
}

.icons {
    grid-column: 2 / 3;
    grid-row: 1 / 2;
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    background: #4A90E2;
    padding: 10px;
    border-radius: 10px;
    justify-content: center;
    align-items: center;
}

.icon {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    background: white;
    border-radius: 5px;
}

.calendar {
    grid-column: 1 / 2;
    grid-row: 2 / 3;
    background: #3498db;
    color: white;
    padding: 15px;
    border-radius: 10px;
}

.recent-visits {
    grid-column: 2 / 3;
    grid-row: 2 / 3;
    background: #3498db;
    color: white;
    padding: 15px;
    border-radius: 10px;
}
</style>
</head>
<body>
	<h1>my 페이지</h1>
	<br/><br/>
	<div class=mypageContainer>
	 <div class="achievements">업적배지<br>유저명<br>달성업적</div>
    	<div class="icons">
        <div class="icon"><i class="fa-regular fa-heart"></i></div>
        <div class="icon"><i class="fa-regular fa-pen-nib"></i></div>
        <div class="icon"><i class="fa-solid fa-chess-rook"></i></div>
        <div class="icon"></div>
        <div class="icon"></div>
        <div class="icon"><i class="fa-brands fa-quora"></i></div>
    	</div>
     <div class="calendar">달력</div>
    <div class="recent-visits">최근에 본 축제관광지</div>
	</div>
</body>
</html>