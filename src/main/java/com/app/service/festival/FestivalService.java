package com.app.service.festival;

import java.util.List;

import com.app.dto.festival.Festival;

public interface FestivalService {
	List<Festival> getFestivalList();

	int saveFestival(Festival festival);
	
	Festival getFestivalById(int festivalId);
	
	int removeFestival(int festivalId);
	
	List<Festival> findFestivalList();
	
	int incrementLikeCount(int festivalId);
	
}
