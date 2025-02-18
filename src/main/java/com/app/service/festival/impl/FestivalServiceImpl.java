package com.app.service.festival.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.festival.FestivalDAO;
import com.app.dto.festival.Festival;
import com.app.service.festival.FestivalService;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	FestivalDAO festivalDAO;
	
	@Override
	public List<Festival> getFestivalList() {
		List<Festival> festivalList = festivalDAO.getFestivalList();
		return festivalList;
	}
	
	@Override
	public int saveFestival(Festival festival) {
		int result = festivalDAO.saveFestival(festival);
		return result;
	}

	@Override
	public Festival getFestivalById(int festivalId) {
		Festival festival=festivalDAO.getFestivalById(festivalId);
		return festival;
	}

	@Override
	public int removeFestival(int festivalId) {
		int result = festivalDAO.removeFestival(festivalId);
		return result;
	}
	public List<Festival> findFestivalList() {
		List<Festival> festivalList	= festivalDAO.findFestivalList();
				
		return festivalList;
	}	

	@Override
	public List<Festival> searchFestivals(String searchQuery) {

        return festivalDAO.findFestivalsBySearchQuery(searchQuery);
	}

	@Override
	public int toggleLike(String userId, int festivalId) {

	    boolean isLiked = isUserLikedFestival(userId, festivalId);

	    if (isLiked) {

	        festivalDAO.removeLike(userId, festivalId);
	    } else {

	        festivalDAO.addLike(userId, festivalId);
	    }


	    int newLikeCount = festivalDAO.getLikeCount(festivalId);
	    return newLikeCount;
	}
 
	@Override
    public int getLikeCount(int festivalId) {
        return festivalDAO.getLikeCount(festivalId);
    }

	@Override
	public boolean isUserLikedFestival(String userId, int festivalId) {
        return festivalDAO.isUserLikedFestival(userId, festivalId);
    }

	@Override
	public int updateFestival(Festival festival) {
		int result = festivalDAO.updateFestival(festival);
		return result;
	}


	public List<Festival> getRandomFestivalList(int count) {
		
		return festivalDAO.getRandomFestivalList(count);
	}

}
