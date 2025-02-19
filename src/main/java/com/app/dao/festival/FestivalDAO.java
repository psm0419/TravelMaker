package com.app.dao.festival;

import java.util.List;

import com.app.dto.festival.Festival;
import com.app.dto.festival.FestivalImage;

public interface FestivalDAO {

	List<Festival> getFestivalList();
	
	int saveFestival(Festival festival);
	
	Festival getFestivalById(int festivalId);
	
	int removeFestival(int festivalId);
	int updateFestival(Festival festival);
	List<Festival> findFestivalList();	
	
	
	List<Festival> findFestivalsBySearchQuery(String searchQuery);
	
	boolean isUserLikedFestival(String userId, int festivalId);
    void addLike(String userId, int festivalId);
    void removeLike(String userId, int festivalId);
    int getLikeCount(int festivalId);
    void updateLikeCount(int festivalId, int likeCount);
    List<Festival> getRandomFestivalList(int count); //랜덤함수
}
