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
				<li><a href="/admin/option">설정</a></li>
			</ul>
		</div>

		<div class="main-content">
			<h1>축제 등록</h1>
			<div class="festivaldashboard">
				<div class="festivalcard">
					<form>
						<div class="form-group">
							<label for="festivalName">축제명:</label> <input type="text"
								id="festivalName" class="input-field" placeholder="축제 이름 입력"
								required>
						</div>

						<div class="form-group">
							<label for="location">장소:</label> <input type="text"
								id="location" class="input-field" placeholder="축제 장소 입력"
								required>
						</div>

						<div class="form-group">
							<label for="entryFee">입장료:</label> <input type="text"
								id="entryFee" class="input-field"
								placeholder="입장료 입력 (예: 무료, 10,000원)" required>
						</div>

						<div class="form-group">
							<label for="contact">연락처:</label> <input type="tel" id="contact"
								class="input-field" placeholder="010-1234-5678" required>
						</div>

						<div class="form-group">
							<label for="organizer">개최자:</label> <input type="text"
								id="organizer" class="input-field" placeholder="개최자 이름 입력"
								required>
						</div>

						<div class="form-group">
							<label for="startDate">시작일:</label> <input type="date"
								id="startDate" class="input-field" required>
						</div>

						<div class="form-group">
							<label for="endDate">마감일:</label> <input type="date" id="endDate"
								class="input-field" required>
						</div>

						<button type="submit" class="btn btn-submit">등록</button>
					</form>
				</div>
			</div>
		</div>
</body>
</html>