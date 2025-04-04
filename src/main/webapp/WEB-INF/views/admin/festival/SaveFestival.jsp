<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제등록</title>
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
		<div class="mainHeaderContainer">
			<header>
				<%@include file="../../header/Header.jsp"%>
			</header>
		</div>
		<div class="main-content">
			<h1>축제 등록</h1>
			<br>
			<div class=dashboard">
				<div class="festivalcard">
					<form action="/admin/festival/saveFestival" method="post">
						<div class="form-group">
							<label for="festivalName">축제명:</label> <input type="text"
								id="festivalName" name="festivalName" class="input-field"
								required>
						</div>

						<div class="form-group">
							<label for="location">장소:</label> <input type="text"
								id="location" name="location" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="entryFee">입장료:</label> <input type="text"
								id="entryFee" name="entranceFee" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="contact">연락처:</label> <input type="tel" id="contact"
								name="tel" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="organizer">개최자:</label> <input type="text"
								id="organizer" name="festivalHost" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="URL">홈페이지(URL):</label> <input type="text" id="URL"
								name="homepageUrl" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="startDate">시작일:</label> <input type="date"
								id="startDate" name="startDate" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="endDate">마감일:</label> <input type="date" id="endDate"
								name="endDate" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="content">내용:</label>
							<textarea></textarea>
						</div>

						<button type="submit" class="btn btn-submit">등록</button>
					</form>
				</div>
			</div>
		</div>
</body>
</html>