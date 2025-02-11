<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관광지 지도</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07d2faa0d2999cbe5c196e0b7f2d35bf"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.info-window {
	padding: 15px;
	font-size: 14px;
	max-width: 300px;
	border-radius: 5px;
}

.info-window h3 {
	margin: 0 0 10px 0;
	font-size: 16px;
	color: #333;
}

.info-window p {
	margin: 5px 0;
	color: #666;
}

.info-category {
	color: #2196F3;
	font-size: 13px;
}

.info-rank {
	color: #FF5722;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>📍 관광지 지도</h1>
	<div id="map" style="width: 800px; height: 600px;"></div>

	<script>
        var mapContainer = document.getElementById('map'); 
        var mapOption = {
            center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울 중심 좌표
            level: 5
        };

        var map = new kakao.maps.Map(mapContainer, mapOption);
        
        var openedInfowindow = null; // 열린 인포윈도우 저장 변수
        
        //네이버 검색 연결
        function createNaverSearchUrl(placeName) {
            return 'https://search.naver.com/search.naver?query=' + encodeURIComponent(placeName);
        }
        
        // 관광지 좌표 가져오기
        $.getJSON("/attractions/list", function(attractions) {
        	
            attractions.forEach(function(attraction) {
                var marker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(attraction.mapY, attraction.mapX),
                    map: map
                });
                
                var content = '<div style="padding:5px; font-size:14px;">' +
                '<strong>' + (attraction.hubTatsNm || "이름 없음") + '</strong><br>' +
                '<span style="color: #2196F3;">' + attraction.hubCtgryLclsNm + ' > ' + attraction.hubCtgryMclsNm + '</span><br>' +
                '주소: ' + (attraction.hubBsicAdres || "주소 없음") + '<br>' +
                '지역: ' + attraction.areaNm + ' ' + attraction.signguNm + '<br>' +
                (attraction.hubRank ? '순위: ' + attraction.hubRank + '위<br>' : '') +
                '기준월: ' + attraction.baseYm + '<br>' +
                '<a href="' + createNaverSearchUrl(attraction.hubTatsNm) + '" class="search-link" target="_blank">🔍 네이버에서 자세히 보기</a>' +
                '</div>';
                   
                var infowindow = new kakao.maps.InfoWindow({
		            content: content,
		            removable: true
        		});

                kakao.maps.event.addListener(marker, 'click', function() {
                	console.log(`📌 마커 클릭됨! (장소: ${attraction.hubTatsNm})`);
                	
                	if (openedInfowindow) {
                        openedInfowindow.close(); // 기존 인포윈도우 닫기
                    }                	
                	
                    infowindow.open(map, marker);
                    openedInfowindow = infowindow;
                });
            });
        });
    </script>
</body>
</html>