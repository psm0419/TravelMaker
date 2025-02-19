<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	.travelNewsContainer {
		width: 100%;
		max-width: 1200px; /* 너무 넓어지는 것 방지 */
		height: auto;
		display: flex;
		margin: auto;
		margin-top: 100px;
		margin-bottom: 50px;
		justify-content: center;
		align-items: center;
	}
	
	.newsBox {
		width: 89%;
		height: 280px;
		border-radius: 12px;
		overflow: hidden;
		display: flex;
		flex-direction: row;
	}
	
	.newsImage {
		width: 50%;
		height: 100%;
		padding: 15px;
		display: flex;
		align-items: center;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	.newsImage img {
		height: 100%;
		width: 100%;
		border-radius: 12px;
		margin: auto;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		cursor: pointer;
	}
	
	.newsText {
		width: 50%;
		height: 100%;
		padding: 15px;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	.newsHeader {
		font-size: 20px;
		font-weight: bold;
	}
	.newsList {
		cursor: pointer;
		font-size: 14px;
		font-weight: bold;
	}
	
</style>

</head>
<body>

	<div class="travelNewsContainer">
    <div class="newsBox">
        <div class="newsImage">
            <img src="/images/여행소식.jpg" alt="여행 소식">
        </div>
        <div class="newsText">
            <div class="newsHeader">오늘의 여행 소식</div>
            <br>
            <c:forEach var="festival" items="${festivalList}">
                <div class="newsList">
                    <p> "${festival.festivalName}"</p> 
                </div>
                <br>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>