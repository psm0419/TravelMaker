<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
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

            <div class="recent-activities">
                <h2>최근 활동</h2>
                <ul>
                    <li>신규 사용자: ${latestUser}님 가입</li>
                    <li>신고 접수: <a href="/admin/reports/${latestReportedPost.id}">${latestReportedPost.title}</a></li>
                    <li>새 콘텐츠 추가됨: <a href="/admin/content/${latestContent.id}">${latestContent.title}</a></li>
                </ul>
            </div>

            <div class="admin-notice">
                <h2>공지사항</h2>
                <ul>
                    <c:forEach var="notice" items="${notices}">
                        <li><a href="/admin/notice/${notice.id}">${notice.title}</a> - ${notice.date}</li>
                    </c:forEach>
                </ul>
                <a href="/admin/notice" class="btn">더보기</a>
            </div>

            <div class="server-status">
                <h2>시스템 상태</h2>
                <ul>
                    <li>서버 상태: <span class="status">${serverStatus}</span></li>
                    <li>DB 연결: <span class="status">${dbStatus}</span></li>
                    <li>최근 백업 날짜: ${lastBackupDate}</li>
                </ul>
            </div>

            <div class="admin-logs">
                <h2>관리자 활동 로그</h2>
                <ul>
                    <c:forEach var="log" items="${adminLogs}">
                        <li>${log.timestamp} - ${log.adminName} 님이 ${log.action} 수행</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>
