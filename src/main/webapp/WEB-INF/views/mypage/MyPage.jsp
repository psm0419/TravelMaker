<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="../css/mypage.css">
</head>
<body class="mypage-body">
	
			<%@include file="../header/Header.jsp"%>
			<div class="mypage-container">
				<div class="sidebar">
					<div class="profile">
						<img src="/images/유저이미지.jpg" alt="작성자 이미지" class="rounded-circle" style="border-radius: 5px; width: 120px;">
						<br>
						<p>
							반가워요!<br>${sessionScope.loggedInUser.nickName}
							님
						</p>
						<br>
						<button
							style="background: white; color: #0D47A1; border: none; padding: 5px 10px; border-radius: 5px; cursor:pointer;">프로필
							이미지 설정</button>
					</div>
				</div>
				<div class="main-content">
					<div class="activities">
						<h3>나의 활동</h3>
						<div class="activities-icons">
							<div class="activity">
								<a href="/mypage/bookmark"><i class="fa-regular fa-bookmark"></i>
									<p>즐겨찾기</p></a>
							</div>
							<div class="activity">
								<a href="/mypage/talk"><i class="fa-solid fa-comments"></i>
									<p>댓글</p></a>
							</div>
							<div class="activity">
								<a href="/mypage/achievement"><i class="fa-solid fa-paw"></i>
									<p>업적</p></a>
							</div>
							<div class="activity">
								<a href="mypage/review"><i class="fa-solid fa-map"></i>
									<p>후기</p></a>
							</div>
							<div class="activity">
								<a href="/mypage/correction"><i class="fa-solid fa-pen"></i>
									<p>관광정보 수정요청</p></a>
							</div>
							<div class="activity">
								<a href="/mypage/qna"><i class="fa-solid fa-question"></i>
									<p>Q&A</p></a>
							</div>
						</div>
					</div>
					<div class="recent-festivals">
						<h3>최근 본 축제</h3>
						<c:forEach var="post" items="${recentFestivals}">
							<p>${post}</p>
						</c:forEach>
					</div>
				</div>
				
			</div>
			
		
	<%@include file="../footer/Footer.jsp"%>
</body>
</html>

