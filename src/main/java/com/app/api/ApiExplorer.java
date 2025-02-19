package com.app.api;

import java.util.List;
import com.app.dto.api.Attraction;

public class ApiExplorer {
    public static void main(String[] args) {
        String areaCd = "52"; // 시도 코드
        String signguCd = "52113"; // 시군구 코드

        List<Attraction> attractionInfoList = null;

        try {
        	attractionInfoList = ArplApiService.attractionInfoList(areaCd, signguCd);

            if (attractionInfoList == null || attractionInfoList.isEmpty()) {
                System.out.println("저장할 데이터가 없습니다.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return; // 예외 발생 시 종료
        }

        // ArplInfo 객체 -> DB에 저장
        ArplDAO arplDAO = new ArplDAO();
        int count = 0;

        for (Attraction ai : attractionInfoList) {
            count += arplDAO.saveArplInfo(ai);
        }

        System.out.println(count + "개 저장 성공!");
    }
}
