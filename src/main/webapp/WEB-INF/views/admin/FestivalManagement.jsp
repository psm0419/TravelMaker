<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 정보 관리</title>
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
			</ul>
		</div>
		<div class="main-content">
			<h1>축제 정보 관리</h1>
			<div class="dashboard">
				<div class="card">
				<h3>축제 등록</h3>
					<a href="/admin/festival/saveFestival"><p>더보기</p></a>
				</div>
				<div class="card">
				<h3>축제 상세 수정</h3>
					<a href="/admin/festival/festivalList"><p>더보기</p></a>
				</div>
			</div>
		</div>

	</div>
</body>
</html>