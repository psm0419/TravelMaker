package com.app.dao.festival;

import java.util.List;

import com.app.dto.festival.Festival;

public interface FestivalDAO {

	List<Festival> getFestivalList();
	
	int saveFestival(Festival festival);
	
	Festival getFestivalById(int festivalId);
	
	int removeFestival(int festivalId);
	Festival getFestivalById(int festivalId);
	
	List<Festival> findFestivalList();	
	
	int incrementLikeCount(int festivalId);
	
}
