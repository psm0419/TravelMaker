<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="../css/mypage.css">
</head>
<body>
    <div>
        <h1>마이페이지</h1>
        <div class="mypageContainer">
            <div class="achievements">
                <h3>업적 배지</h3>
                <p>유저명: 홍길동</p>
                <p>달성 업적: 10개</p>
            </div>
            <div class="icons">
                <div class="icon"><i class="fa-regular fa-heart"></i></div>
                <div class="icon"><i class="fa-regular fa-pen-nib"></i></div>
                <div class="icon"><i class="fa-solid fa-chess-rook"></i></div>
                <div class="icon"><i class="fa-brands fa-quora"></i></div>
                <div class="icon"><i class="fa-solid fa-star"></i></div>
                <div class="icon"><i class="fa-solid fa-trophy"></i></div>
            </div>
            <div class="calendar">
                <h3>달력</h3>
                <p>이곳에 달력이 표시됩니다.</p>
            </div>
            <div class="recent-visits">
                <h3>최근 방문한 축제/관광지</h3>
                <p>1. 서울 불꽃축제</p>
                <p>2. 제주 올레길</p>
                <p>3. 부산 국제영화제</p>
            </div>
        </div>
    </div>
</body>
</html>
