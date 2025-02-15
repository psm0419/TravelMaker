package com.app.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.app.dto.api.Attraction;

public class ArplApiService {

	public static String attractionInfo(String areaCd, String signguCd) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/TarRlteTarService/areaBasedList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=6qMx95HkwBtugOGITKFbYuVdBUh88sIitPYUMcTWCgzYjVy9Hgd7fIwU2yGAby5HmUjk7Y8egOXgwC7cm5DVQQ%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("WEB", "UTF-8")); /*OS 구분 : IOS (아이폰), AND (안드로이드), WEB(웹), ETC(기타)*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("TravelMaker", "UTF-8")); /*서비스명(어플명)*/
		urlBuilder.append("&" + URLEncoder.encode("baseYm","UTF-8") + "=" + URLEncoder.encode("202501", "UTF-8")); /*기준 날짜 조회(형식:YYYYMM)*/
		urlBuilder.append("&" + URLEncoder.encode("areaCd","UTF-8") + "=" + URLEncoder.encode(areaCd, "UTF-8")); /*중심지 지역 코드*/
		urlBuilder.append("&" + URLEncoder.encode("signguCd","UTF-8") + "=" + URLEncoder.encode(signguCd, "UTF-8")); /*중심지 시군구 코드*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답메세지 형식*/

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		System.out.println(sb.toString());


		return sb.toString();
	}

	public static List<Attraction> attractionInfoList(String areaCd, String signguCd) throws IOException {

		List<Attraction> arplList = new ArrayList<Attraction>();

		 try {
		        String jsonText = attractionInfo(areaCd, signguCd);

		        System.out.println("******* API 응답 JSON *******");
		        System.out.println(jsonText); 

		        JSONParser jsonParser = new JSONParser();
		        JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonText);
		        JSONObject response = (JSONObject) jsonObj.get("response");

		        JSONObject header = (JSONObject) response.get("header");
		        System.out.println("응답 메시지: " + header.get("resultMsg"));
		        System.out.println("응답 코드: " + header.get("resultCode"));

		        JSONObject body = (JSONObject) response.get("body");
		        System.out.println("총 개수: " + body.get("totalCount"));

		        JSONObject items = (JSONObject) body.get("items");  // items 객체 가져오기
		        JSONArray itemArray = (JSONArray) items.get("item"); // "item" 배열 가져오기

		        for (int i = 0; i < itemArray.size(); i++) {
		            JSONObject item = (JSONObject) itemArray.get(i);
		            System.out.println(">>> index: " + i);
		            System.out.println("장소명: " + item.get("tAtsNm"));
		            System.out.println("주소: " + item.get("rlteBsicAdres"));

		            Attraction ai = new Attraction();
		            ai.setBaseYm(convertValueToString(item.get("baseYm")));
		            ai.setMapX(convertValueToString(item.get("mapX")));
		            ai.setMapY(convertValueToString(item.get("mapY")));
		            ai.setAreaCd(convertValueToString(item.get("areaCd")));
		            ai.setAreaNm(convertValueToString(item.get("areaNm")));
		            ai.setSignguCd(convertValueToString(item.get("signguCd")));
		            ai.setSignguNm(convertValueToString(item.get("signguNm")));
		            ai.setHubTatsNm(convertValueToString(item.get("rlteTatsNm")));
//		            ai.setHubBsicAdres(convertValueToString(item.get("hubBsicAdres")));
//		            ai.setHubCtgryLclsNm(convertValueToString(item.get("hubCtgryLclsNm")));
//		            ai.setHubCtgryMclsNm(convertValueToString(item.get("hubCtgryMclsNm")));
		            ai.setHubBsicAdres(convertValueToString(item.get("rlteBsicAdres")));
		            ai.setHubCtgryLclsNm(convertValueToString(item.get("rlteCtgryLclsNm")));
		            ai.setHubCtgryMclsNm(convertValueToString(item.get("rlteCtgryMclsNm")));
		            ai.setHubRank(convertValueToString(item.get("rlteRank")));

		            arplList.add(ai);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		return arplList;
	}


	public static String convertValueToString(Object obj) {
		return obj == null ? "" : obj.toString();
	}
}
