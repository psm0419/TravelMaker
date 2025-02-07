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
				<li><a href="/admin/option">설정</a></li>
			</ul>
		</div>
		<div class="main-content">
			<h1>축제 정보 관리</h1>
		</div>
		<div class="user-list">
			<c:forEach var="user" items="${userList}">
				<p>
					<a>
					<span class="user-type"> </span>
					</a>
				</p>
			</c:forEach>
		</div>
	</div>
	</div>

</body>
</html>