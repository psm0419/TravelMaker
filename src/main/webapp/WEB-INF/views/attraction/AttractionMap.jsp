<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관광지 지도</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07d2faa0d2999cbe5c196e0b7f2d35bf&libraries=services"></script>
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
	<h1 style="text-align: center;">📍 축제 주변 관광지, 숙소, 음식점</h1>
	
	<!-- 카테고리 버튼 추가 -->
	<div style="text-align: center; margin-bottom: 20px;">
    <button id="show-attractions" onclick="toggleMarkers('관광지')">관광지</button>
    <button id="show-restaurants" onclick="toggleMarkers('음식점')">음식점</button>
    <button id="show-accommodation" onclick="toggleMarkers('숙소')">숙소</button>
</div>

<div id="map" style="width: 900px; height: 600px; margin: 0 auto; display: block;"></div>

<script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 기본값 (서울)
        level: 5
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();
    var openedInfowindow = null;

    // 카테고리별 마커 저장
    var markers = {
        "관광지": [],
        "음식점": [],
        "숙소": []
    };

    var markerVisibility = {
        "관광지": true,  // 기본값을 true로 설정
        "음식점": true,  // 기본값을 true로 설정
        "숙소": true     // 기본값을 true로 설정
    };

    var festivalLocation = "${festival.location}";
    console.log("축제 주소:", festivalLocation);

    geocoder.addressSearch(festivalLocation, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var festivalLatLng = new kakao.maps.LatLng(result[0].y, result[0].x);
            map.setCenter(festivalLatLng);

            var festivalMarker = new kakao.maps.Marker({
                position: festivalLatLng,
                map: map
            });

            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px; font-size:14px;">' + festivalLocation + '</div>'
            });
            infowindow.open(map, festivalMarker);
        } else {
            console.error("주소 변환 실패: " + festivalLocation);
        }
    });

    // 전체 데이터를 한 번에 불러오고 카테고리에 따라 마커 분류
    $.getJSON("/attractions/list", function(attractions) {
        let geocodePromises = [];

        attractions.forEach(function (item) {
            let marker;
            let category = getCategory(item.hubCtgryLclsNm); // 카테고리 판별

            if (!category) return; // 카테고리 값이 없으면 무시

            if (item.mapX && item.mapY) {
                marker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(item.mapY, item.mapX),
                    map: map // 초기에는 보이도록 설정
                });
                markers[category].push(marker); // 해당 카테고리에 마커 추가
                addInfoWindow(marker, item);
            } else if (item.hubBsicAdres) {
                let promise = new Promise((resolve, reject) => {
                    geocoder.addressSearch(item.hubBsicAdres, function (result, status) {
                        if (status === kakao.maps.services.Status.OK) {
                            let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            marker = new kakao.maps.Marker({
                                position: coords,
                                map: map
                            });
                            markers[category].push(marker);
                            addInfoWindow(marker, item);
                            resolve(marker);
                        } else {
                            console.error("주소 변환 실패:", item.hubBsicAdres);
                            reject("주소 변환 실패: " + item.hubBsicAdres);
                        }
                    });
                });
                geocodePromises.push(promise);
            }
        });

        Promise.allSettled(geocodePromises).then(() => {
            console.log("모든 마커 추가 완료", markers);
        });
    });

    // 📌 카테고리 판별 함수 (DB에 저장된 카테고리명에 따라 설정)
    function getCategory(categoryName) {
        if (categoryName.includes("관광")) return "관광지";
        if (categoryName.includes("음식")) return "음식점";
        if (categoryName.includes("숙박") || categoryName.includes("숙소")) return "숙소";
        return null; // 해당하지 않으면 무시
    }

    // 🏷️ 카테고리별 마커 토글 버튼 기능
    function toggleMarkers(category) {
        markerVisibility[category] = !markerVisibility[category]; // 현재 상태 반전

        // 선택한 카테고리에 대한 마커 보이기/숨기기
        markers[category].forEach(marker => {
            marker.setMap(markerVisibility[category] ? map : null);
        });
    }

    // 정보창 추가
    function addInfoWindow(marker, item) {
        var content = '<div style="padding:10px; font-size:14px; width:250px; white-space:normal; word-break:break-all;">'
            + '<strong>' + (item.hubTatsNm || "이름 없음") + '</strong><br>'
            + '<span style="color: #2196F3;">' + item.hubCtgryLclsNm + '</span><br>'
            + '📍 주소: ' + (item.hubBsicAdres || "주소 없음") + '<br>'
            + '📌 지역: ' + item.areaNm + ' ' + item.signguNm + '<br>'
            + (item.hubRank ? '⭐ 순위: ' + item.hubRank + '위<br>' : ' ')
            + '📅 기준월: ' + item.baseYm + '<br>'
            + '<a href="' + createNaverSearchUrl(item.hubTatsNm) + '" class="search-link" target="_blank" '
            + 'style="display:block; margin-top:5px; text-align:center; padding:3px 0; background:#2196F3; '
            + 'color:white; text-decoration:none; border-radius:5px; width:100%; box-sizing:border-box;">🔍 네이버 검색</a>'
            + '</div>';

        var infowindow = new kakao.maps.InfoWindow({
            content: content,
            removable: true
        });

        kakao.maps.event.addListener(marker, 'click', function () {
            if (openedInfowindow) {
                openedInfowindow.close();
            }
            infowindow.open(map, marker);
            openedInfowindow = infowindow;
        });
    }

    // 네이버 검색 URL 생성
    function createNaverSearchUrl(placeName) {
        return 'https://search.naver.com/search.naver?query=' + encodeURIComponent(placeName);
    }
</script>
</body>
</html>