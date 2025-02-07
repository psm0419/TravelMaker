<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${festival.name} 상세 정보</title>
</head>
<body>
	 <h1>${festival.festival_name}</h1>
    <p>📍 위치: ${festival.location}</p>
    <p>📅 기간: ${festival.start_date} ~ ${festival.end_date}</p>
    <p>💰 입장료: ${festival.entrance_fee}</p>
    <p>📞 전화번호: ${festival.tel}</p>
    <p>🏢 주최: ${festival.festival_host}</p>
    <a href="/fetivalpage/FestivalPage">목록으로 돌아가기</a>
    
    <div id="map" style="width:500px; height:400px;"></div>
    <script>
        var mapX = ${ festival.getMapX() };
        var mapY = ${ festival.getMapY() };
        
        var mapContainer = document.getElementById('map'), 
            mapOption = {
                center: new kakao.maps.LatLng(mapY, mapX), 
                level: 3 
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);
    </script>
</body>
</html>