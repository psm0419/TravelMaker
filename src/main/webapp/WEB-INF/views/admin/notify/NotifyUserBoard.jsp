<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 유저 조회</title>
<link href="/css/admin.css" rel="stylesheet">
</head>
<body>
<body>
<%@include file="../../header/Header.jsp"%>
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
			<h1>신고된 유저 목록</h1>
			<div class="dashboard">
			<div class=card>
					<table>
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 60%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
						</colgroup>
						<tr>
							<th><input type="checkbox" id="selectAll"></th>
							<th>닉네임(아이디)</th>
							<th>사유</th>
							<th>비고</th>
						</tr>
						<c:forEach var="user" items="${userList}">
							<tr>
								<td><input type="checkbox" class="postCheckbox" value="${user.userId}"></td>
								<td>${user.nickName} (${user.userId})</td>
								<td>${user.report}</td>
								<td>
									<div class="btn btn-admin">
										<a href="/admin/user/${user.userId}">확인</a>
									</div>
									<div class="btn btn-ban" onclick="resetUser('${user.userId}')">삭제</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<button id="deleteSelectedBtn" class="btn btn-ban" onclick="deleteSelectedUsers()">선택 삭제</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	function resetUser(userId) {
	    console.log("Deleting userId:", userId);

	    fetch('/admin/resetReport', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	        body: `userIds=${userId}`
	    })
	    .then(response => response.json())
	    .then(data => {
	        console.log("Server Response:", data);

	        if (data.success) {
	            const checkboxes = document.querySelectorAll('.postCheckbox');
	            let found = false;
	            
	            checkboxes.forEach(checkbox => {
	                if (checkbox.value === userId) {
	                    checkbox.closest('tr').remove();
	                    found = true;
	                }
	            });

	            if (!found) {
	                console.error("❌ Error: User row not found in DOM.");
	            }
	        } else {
	            alert('삭제 실패: ' + data.error);
	        }
	    })
	    .catch(error => console.error('❌ Error:', error));
	}
		function deleteSelectedUsers() {
			const selected = document.querySelectorAll('.postCheckbox:checked');
			const userIds = Array.from(selected).map(checkbox => checkbox.value).join(',');

			if (!userIds) {
				alert('선택된 유저가 없습니다.');
				return;
			}

			fetch('/admin/resetReport', {
				method: 'POST',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `userIds=${userIds}`
			})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					location.reload();
				} else {
					alert('삭제 실패: ' + data.error);
				}
			})
			.catch(error => console.error('Error:', error));
		}
	</script>
</body>
</html>