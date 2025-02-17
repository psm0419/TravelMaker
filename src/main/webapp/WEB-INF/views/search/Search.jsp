<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/css/search/Search.css">
</head>
<body class="search-main">
    <h2 class="search-title">검색 결과</h2>

    <c:if test="${not empty festivals}">
        <ul class="festival-list">
            <c:forEach var="festival" items="${festivals}">
                <li class="festival-item">
                    <a href="/festivalpage/FestivalDetail/${festival.festivalId}" class="festival-link">${festival.festivalName}</a>
                    <span class="festival-location">- ${festival.location}</span>
                </li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty festivals}">
        <p class="no-results">검색된 축제가 없습니다.</p>
    </c:if>
</body>
</html>