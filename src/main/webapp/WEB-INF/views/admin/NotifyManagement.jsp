<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Arial', sans-serif;
}

body {
	display: flex;
	height: 100vh;
	background-color: #f4f4f4;
}

.sidebar {
	width: 250px;
	background-color: #5C7285;
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.sidebar h2 {
	margin-bottom: 20px;
}

.sidebar a {
	color: white;
	text-decoration: none;
	padding: 10px;
	display: block;
	margin: 5px 0;
	border-radius: 5px;
}

.sidebar a:hover {
	background-color: #34495e;
}
@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }
</style>
</head>
<body>
    <div class="sidebar">
        <h2>관리자 페이지</h2>
        <a href="/admin">대시보드</a>
        <a href="/admin/user">사용자 관리</a>
        <a href="/admin/content">콘텐츠 관리</a>
        <a href="/admin/festival">축제 정보 관리</a>
        <a href="/admin/notify">신고 관리</a>
        <a href="/admin/option">설정</a>
    </div>

</body>
</html>