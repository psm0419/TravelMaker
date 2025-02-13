package com.app.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.app.dto.api.Attraction;

public class ArplDAO {

	Connection conn; // db연결
	PreparedStatement psmt; // 주로 이거씀, 연결하여 sql 명령을 실행해주는 객체
	ResultSet rs;

	public int saveArplInfo(Attraction attractionInfo) {
		conn = DBConnectionManager.connectDB();
		int result = 0;
		if (attractionInfo.getHubCtgryLclsNm() != null && 
		        "음식".equals(attractionInfo.getHubCtgryLclsNm().trim())){
									
			// 쿼리 준비 괄호는 모든컬럼 넣을때는 생략가능
			String sqlQuery = "INSERT INTO attraction_info (attraction_id, baseYm, mapX, mapY, areaCd, areaNm, signguCd, signguNm, " +
	                "hubTatsNm, hubBsicAdres, hubCtgryLclsNm, hubCtgryMclsNm, hubRank) " +
	                "VALUES ((SELECT NVL(MAX(attraction_id), 0) + 1 FROM attraction_info), " +
	                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			try {
				// 쿼리 실행 후 데이터 후속 처리
				psmt = conn.prepareStatement(sqlQuery);
				// 객체만들어지고 실행 전에 파라미터 세팅해줘야한다
				// 파라미터 셋팅
				// (파라미터인덱스(1부터시작), 값)
				psmt.setString(1, attractionInfo.getBaseYm());
	            psmt.setString(2, attractionInfo.getMapX() != null ? attractionInfo.getMapX() : null); // mapX 값
	            psmt.setString(3, attractionInfo.getMapY() != null ? attractionInfo.getMapY() : null); // mapY 값
	            psmt.setString(4, attractionInfo.getAreaCd());
	            psmt.setString(5, attractionInfo.getAreaNm());
	            psmt.setString(6, attractionInfo.getSignguCd());
	            psmt.setString(7, attractionInfo.getSignguNm());
	            psmt.setString(8, attractionInfo.getHubTatsNm());
	            psmt.setString(9, attractionInfo.getHubBsicAdres());
	            psmt.setString(10, attractionInfo.getHubCtgryLclsNm());
	            psmt.setString(11, attractionInfo.getHubCtgryMclsNm());
	            psmt.setString(12, attractionInfo.getHubRank());

				result = psmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// DB 연결 종료
				DBConnectionManager.disconnectDB(conn, psmt, rs);
			}
		} else {
			System.out.println("음식 카테고리가 아닌 데이터는 저장되지 않았습니다.");
		}
		return result;
	}
}
