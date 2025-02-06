<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
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
.main-content {
    flex: 1;
    padding: 20px;
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
    
    <div class="main-content">
		<h1>사용자 관리 페이지</h1>
		<br>
		<div>
			<div>
				<h3>회원정보관리</h3>
			</div>
			<div>
				<h3>권한부여</h3>
			</div>
			<div>
				<h3>전체메일발송</h3>
			</div>
		</div>
	</div>
</body>
</html>