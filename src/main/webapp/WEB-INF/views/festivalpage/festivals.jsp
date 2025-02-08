<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="festival" items="${festivalList}">
		<p>
			<a href="/festivalpage/festival/${festival.festivalId}">
				<h1>${festival.festivalName}</h1>
				<p>📍 위치: ${festival.location}</p>
				<p>📅 기간: ${festival.startDate} ~ ${festival.endDate}</p>
				<p>💰 입장료: ${festival.entranceFee}</p>
				<p>📞 전화번호: ${festival.tel}</p>
				<p>🏢 주최: ${festival.festivalHost}</p>
			</a>
		</p>
		<br>
	</c:forEach>
</body>
</html>