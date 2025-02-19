package com.app.service.festival;

import java.util.List;

import com.app.dto.festival.Festival;
import com.app.dto.festival.FestivalImage;

public interface FestivalService {
	List<Festival> getFestivalList();

	int saveFestival(Festival festival);
	
	Festival getFestivalById(int festivalId);
	
	int removeFestival(int festivalId);
	int updateFestival(Festival festival);
	List<Festival> findFestivalList();
	
	List<Festival> searchFestivals(String searchQuery);
	
	int toggleLike(String userId, int festivalId);
    int getLikeCount(int festivalId);
    boolean isUserLikedFestival(String userId, int festivalId);
    List<Festival> getRandomFestivalList(int count);
    
}
