<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 상세 정보</title>
    <link href="/css/admin.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>관리자 페이지</h2>
            <ul>
                <li><a href="/admin">대시보드</a></li>
                <li><a href="/admin/user">사용자 관리</a></li>
                <li><a href="/admin/content">콘텐츠 관리</a></li>
                <li><a href="/admin/festival">축제 정보 관리</a></li>
                <li><a href="/admin/notify">신고 관리</a></li>
                <li><a href="/admin/option">설정</a></li>
            </ul>
        </div>

        <div class="main-content">
            <h1>사용자 상세 정보</h1>
            <div class="user-detail">
                <p>아이디: ${user.id}</p>
                <p>이름: ${user.name}</p>
                <p>이메일: ${user.email}</p>
                <p>가입일: ${user.joinDate}</p>
                <p>역할: 
                    <c:choose>
                        <c:when test="${user.userType == 'ADM'}">관리자</c:when>
                        <c:when test="${user.userType == 'CUS'}">고객사용자</c:when>
                    </c:choose>
                </p>
                <a href="/admin/user/edit/${user.id}" class="btn">수정하기</a>
            </div>
        </div>
    </div>
</body>
</html>
