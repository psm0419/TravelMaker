<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오맵</title>

</head>
<body>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07d2faa0d2999cbe5c196e0b7f2d35bf&libraries=services"></script>
	<script>
<%--         var address = "<%=address%>"; --%>
		// JSP에서 가져온 주소
		
<%-- 		var mapX = <%= mapX %>; // DB에서 가져온 경도 --%>
<%--         var mapY = <%= mapY %>; // DB에서 가져온 위도 --%>

		var mapContainer = document.getElementById('map'), 
			mapOption = {
			center : new kakao.maps.LatLng(37.5665, 126.9780),
			level : 3
		};
		// 									위도, 경도 순서
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		//마커
		var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(mapY, mapX)
        });
		//주소로 찾고자 하는 경우
// 		var geocoder = new kakao.maps.services.Geocoder();

// 		geocoder.addressSearch(address, function(result, status) {
// 			if (status === kakao.maps.services.Status.OK) {
// 				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

// 				var marker = new kakao.maps.Marker({
// 					map : map,
// 					position : coords
// 				});

// 				map.setCenter(coords);
// 			} else {
// 				alert("주소를 찾을 수 없습니다.");
// 			}
// 		});
	</script>
</body>
</html>