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
					<!-- 일괄 삭제 버튼 추가 -->
					<button id="deleteSelectedBtn" class="btn btn-danger">선택 삭제</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	// 개별 삭제 기능
	function resetUser(userId) {
	    if (confirm("신고 목록에서 삭제하시겠습니까?")) {
	        fetch('/admin/resetReport', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/x-www-form-urlencoded'
	            },
	            body: 'userIds=' + encodeURIComponent(userId)
	        }).then(response => {
	            if (response.ok) {
	                alert("삭제가 완료되었습니다.");
	                location.reload();
	            } else {
	                alert("삭제 중 오류가 발생했습니다.");
	            }
	        }).catch(error => {
	            console.error("삭제 요청 오류:", error);
	        });
	    }
	}

	// 전체 선택 기능
	document.getElementById('selectAll').addEventListener('change', function() {
	    const checkboxes = document.querySelectorAll('.postCheckbox');
	    checkboxes.forEach(checkbox => checkbox.checked = this.checked);
	});

	// 선택 삭제 기능
	document.getElementById('deleteSelectedBtn').addEventListener('click', function() {
	    let selectedUsers = [];
	    document.querySelectorAll('.postCheckbox:checked').forEach(checkbox => {
	        selectedUsers.push(checkbox.value);
	    });

	    if (selectedUsers.length === 0) {
	        alert("삭제할 항목을 선택하세요.");
	        return;
	    }

	    if (confirm("선택한 사용자를 삭제하시겠습니까?")) {
	        fetch('/admin/resetReport', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/x-www-form-urlencoded'
	            },
	            body: 'userIds=' + selectedUsers.map(id => encodeURIComponent(id)).join(',')
	        }).then(response => response.json())
	        .then(data => {
	            if (data.success) {
	                alert("삭제가 완료되었습니다.");
	                location.reload();
	            } else {
	                alert("삭제 중 오류가 발생했습니다.");
	            }
	        }).catch(error => {
	            console.error("삭제 요청 오류:", error);
	        });
	    }
	});
	</script>
</body>
</html>