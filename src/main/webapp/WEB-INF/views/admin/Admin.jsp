<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/css/style.css">
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

/* 사이드바 스타일 */
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

/* 메인 컨텐츠 스타일 */
.main-content {
    flex: 1;
    padding: 20px;
}

.dashboard {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
}

.card {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.card h3 {
    margin-bottom: 10px;
}

@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }
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
        <h1>대시보드</h1>
        <div class="dashboard">
            <div class="card">
                <h3>총 사용자</h3>
                <p>${totalUsers}명</p>
            </div>
            <div class="card">
                <h3>총 게시물</h3>
                <p>${totalPosts}개</p>
            </div>
            <div class="card">
                <h3>오늘 방문자</h3>
                <p>${todayVisitors}명</p>
            </div>
            <div class="card">
                <h3>신고된 게시물</h3>
                <p>${reportedPosts}개</p>
            </div>
        </div>
    </div>

</body>
</html>