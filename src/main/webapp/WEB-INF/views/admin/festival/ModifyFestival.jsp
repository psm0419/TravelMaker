<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 상세 수정</title>
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
			<h1>축제 목록 관리</h1>
			<div class="dashboard">
				<div class="table-container">
					<table>
						<colgroup>
							<col style="width: 45%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
						</colgroup>
						<tr>
							<th>축제명</th>
							<th>개최장소</th>
							<th>개최자</th>
							<th>비고</th>
						</tr>
						<c:forEach var="festival" items="${festivalList}">
							<tr>
								<td>${festival.festivalName}</td>
								<td>${festival.location}</td>
								<td>${festival.festivalHost}</td>
								<td><div class="btn btn-admin"><a href="/admin/festival/festivalList/${festival.festivalId}">수정</a></div>
									<div class="btn btn-ban" onClick="removeFestival(${festival.festivalId})">삭제</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
<script>
	function removeFestival(festivalId){
		if(confirm("삭제하시겠습니까?")){
			location.href='/admin/festival/festivalList/removeFestival?festivalId='+festivalId;
		}
	}
</script>
</body>
</html>