<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin.css">
<title>질문게시판 목록</title>
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
			<h1>질문게시판 관리</h1>

			<div class="dashboard">
				<div class="table-container">
					<table>
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 65%;">
							<col style="width: 30%;">
						</colgroup>
						<tr>
							<th><input type="checkbox" id="selectAll"></th>
							<th>제목</th>
							<th>닉네임(아이디)</th>
						</tr>
						<c:forEach var="post" items="${postList}">
							<tr>
								<td><input type="checkbox" class="postCheckbox"
									name="postIds[]" value="${post.postId}"></td>
								<td><a href="/admin/content/questionBoard/${post.postId}">${post.title}</a></td>
								<td>${post.nickName}(${post.userId})</td>
							</tr>
						</c:forEach>
					</table>

					<button id="deleteSelectedBtn" class="btn btn-ban btn-delete">삭제</button>

					<script>
						document.getElementById('selectAll').addEventListener('change', function() {
						    const checkboxes = document.querySelectorAll('.postCheckbox');
						    checkboxes.forEach(checkbox => checkbox.checked = this.checked);
						});
						
						document.getElementById('deleteSelectedBtn').addEventListener('click', function() {
						    let selectedPosts = [];
						    document.querySelectorAll('.postCheckbox:checked').forEach(checkbox => {
						        selectedPosts.push(checkbox.value);
						    });
						
						    if (selectedPosts.length === 0) {
						        alert("삭제할 게시물을 선택하세요.");
						        return;
						    }
						
						    if (confirm("선택한 게시물을 삭제하시겠습니까?")) {
						        fetch('/admin/removePosts', {
						            method: 'POST',
						            headers: {
						                'Content-Type': 'application/json'
						            },
						            body: JSON.stringify({ postIds: selectedPosts })
						        })
						        .then(response => response.json())
						        .then(data => {
						            if (data.success) {
						                alert("삭제가 완료되었습니다.");
						                location.reload();
						            } else {
						                alert("삭제 중 오류가 발생했습니다.");
						            }
						        });
						    }
						});
					</script>
</body>
</html>