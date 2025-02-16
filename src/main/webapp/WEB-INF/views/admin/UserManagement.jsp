<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 목록</title>
    <link rel="stylesheet" href="/css/admin.css">
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
            </ul>
        </div>
        
        <div class="main-content">
            <h1>사용자 목록</h1>
            
            <div class="dashboard">
                <div class="table-container">
                    <table>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>회원 유형</th>
                            <th>비고</th>
                        </tr>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.userId}</td>
                                <td>${user.userName}</td>
                                <td>${user.nickName}</td>
                                <td>${user.email}</td>
                                <td>${user.tel}</td>
                                <td>${user.userType == 'ADM' ? '관리자' : '고객'}</td>
                                <td><div class="btn btn-admin"> <a href="/admin/user/${user.userId}">수정</a></div>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
