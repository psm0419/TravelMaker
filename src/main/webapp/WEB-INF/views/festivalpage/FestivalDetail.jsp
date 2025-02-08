<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${festival.festivalName} 상세 정보</title>
</head>
<body>
	 <h1>${festival.festivalName}</h1>
    <p>📍 위치: ${festival.location}</p>
    <p>📅 기간: ${festival.startDate} ~ ${festival.endDate}</p>
    <p>💰 입장료: ${festival.entranceFee}</p>
    <p>📞 전화번호: ${festival.tel}</p>
    <p>🏢 주최: ${festival.festivalHost}</p>
    <a href="/festivalpage/FestivalPage">목록으로 돌아가기</a>
    
<!--     <div id="map" style="width:500px; height:400px;"></div> -->
<!--     <script> -->
<%--          var mapX = ${ festival.getMapX() }; --%>
<%--          var mapY = ${ festival.getMapY() }; --%>
        
<!--          var mapContainer = document.getElementById('map'),  -->
<!--              mapOption = { -->
<!--                 center: new kakao.maps.LatLng(mapY, mapX),  -->
<!--                 level: 3  -->
<!--              }; -->

<!--          var map = new kakao.maps.Map(mapContainer, mapOption); -->
<!--     </script> -->
</body>
</html>