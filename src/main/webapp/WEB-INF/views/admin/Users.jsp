<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보</title>
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
        <div class="main-content user-detail">
            <h1>${user.userName} 님의 정보</h1>
             <button class="btn btn-edit" onclick="toggleEditMode()">수정</button>
             <form id="editForm" action="/admin/user/update" method="post">
                <input type="hidden" name="userId" value="${user.userId}">

                <label>아이디:</label>
                <input type="text" name="userId" value="${user.userId}" disabled><br>

                <label>이름:</label>
                <input type="text" name="userName" value="${user.userName}" disabled><br>

                <label>닉네임:</label>
                <input type="text" name="nickName" value="${user.nickName}" disabled><br>

                <label>이메일:</label>
                <input type="email" name="email" value="${user.email}" disabled><br>

                <label>전화번호:</label>
                <input type="tel" name="tel" value="${user.tel}" disabled><br>

                <label>회원 유형:</label>
                <select name="userType" disabled>
                    <option value="ADM" ${user.userType == 'ADM' ? 'selected' : ''}>관리자</option>
                    <option value="CUS" ${user.userType == 'CUS' ? 'selected' : ''}>고객</option>
                </select><br>

                <label>계정 정지:</label>
                <div class="radio-group">
                	<label><input type="radio" name="banned" value="0" checked> 정상</label>
                    <label><input type="radio" name="banned" value="7"> 7일</label>
                    <label><input type="radio" name="banned" value="30"> 30일</label>
                    <label><input type="radio" name="banned" value="9999"> 영구 정지</label>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-save" style="display: none;" id="saveBtn">저장</button>
                    <a href="/admin/user" class="btn btn-back">목록으로</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        function toggleEditMode() {
            let inputs = document.querySelectorAll('#editForm input, #editForm select');
            let saveBtn = document.getElementById('saveBtn');

            inputs.forEach(input => {
                if (input.hasAttribute('disabled')) {
                    input.removeAttribute('disabled');
                } else {
                    input.setAttribute('disabled', 'disabled');
                }
            });

            saveBtn.style.display = saveBtn.style.display === 'none' ? 'inline-block' : 'none';
        }
    </script>
</body>