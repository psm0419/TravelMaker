package com.app.dto.attraction;

import lombok.Data;

@Data
public class AttractionInfo {
	
	 int attractionId;
     String baseYm;
     double mapX;
     double mapY;
     String areaCd;
     String areaNm;
     String signguCd;
     String signguNm;
     String hubTatsNm;      // 관광지 이름
     String hubBsicAdres;   // 주소
     String hubCtgryLclsNm; // 대분류
     String hubCtgryMclsNm; // 중분류
     String hubRank;        // 관광지 랭킹
}
