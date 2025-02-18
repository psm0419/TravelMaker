<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 즐겨찾기</title>
<link rel="stylesheet" href="../css/mypageSub.css">
</head>
<body>
	<div class="mainHeaderContainer">
		<header>
			<%@include file="../header/Header.jsp"%>
		</header>
	</div>

	<h1 class="betweenHeader">마이페이지</h1>

	<div class="main-container">

		<div class="sidebar">
			<ul>
				<li class="selected"><a href="/mypage/bookmark">즐겨찾기</a></li>
				<li><a href="/mypage/talk">댓글</a></li>
				<li><a href="/mypage/achievement">업적</a></li>
				<li><a href="/mypage/review">후기</a></li>
				<li><a href="/mypage/correction">관광정보 수정/신규 요청</a></li>
				<li><a href="/mypage/qna">Q&A</a></li>
			</ul>
		</div>

		<div class="container">
			<h1 class="title">즐겨찾기</h1>
			<p class="subtitle">
				총 <strong>${bookmarkCount}</strong> 건
			</p>

			<div class="content">
				<c:choose>
					<c:when test="${empty bookmarkedFestivals}">
						<div class="no-content">즐겨찾기한 항목이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="bookmark-list">
							<c:forEach var="festival" items="${bookmarkedFestivals}">
								<div class="bookmark-item">
									<div class="festival-info">
										<h3>
											<a href="/festival/detail?id=${festival.festivalId}">${festival.festivalName}</a>
										</h3>
										<p>위치: ${festival.location}</p>
										<p>기간: ${festival.startDate} ~ ${festival.endDate}</p>
										<div class="action-buttons">
											<button class="remove-bookmark"
												onclick="removeLike('${festival.festivalId}')">즐겨찾기
												삭제</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
<%@include file="../footer/Footer.jsp"%>
	<script>
function removeLike(festivalId) {
    if(confirm('정말 즐겨찾기를 삭제하시겠습니까?')) {
        fetch('/mypage/removeLike', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                festivalId: festivalId
            })
        })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                alert('즐겨찾기가 삭제되었습니다.');
                location.reload();
            } else {
                alert('즐겨찾기 삭제에 실패했습니다.');
            }
        });
    }
}
</script>
</body>
</html>