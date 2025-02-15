package com.app.service.festival;

import java.util.List;

import com.app.dto.festival.Festival;

public interface FestivalService {

	Festival getFestivalById(int festivalId);
	
	List<Festival> findFestivalList();
	
	int incrementLikeCount(int festivalId);
	
}
