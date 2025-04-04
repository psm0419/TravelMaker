package com.app.dto.api;

import lombok.Data;

@Data
public class Attraction {

	  int attraction_id;
	  int festival_id;
	  String baseYm;
	  String mapX;
	  String mapY;
	  
	  String areaCd;
	  String areaNm;
	  String signguCd;
	  String signguNm;
	  String hubTatsNm;
	  String hubBsicAdres;
	  String hubCtgryLclsNm;
	  String hubCtgryMclsNm;
	  String hubRank;
	  
	  String tAtsNm;
	  String rlteTatsNm;
	  String rlteRegnCd;
	  String rlteRegnNm;
	  String rlteSignguCd;
	  String rlteSignguNm;
	  String rlteBsicAdres;
	  String rlteCtgryLclsNm;
	  String rlteCtgryMclsNm;
	  String rlteCtgrySclsNm;
	  String rlteRank;
}
