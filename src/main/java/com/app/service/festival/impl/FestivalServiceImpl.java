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
		// DAO에서 검색어를 바탕으로 축제 리스트를 가져옴
        return festivalDAO.findFestivalsBySearchQuery(searchQuery);
	}

	@Override
	public int toggleLike(String userId, int festivalId) {
	    // 기존 로직으로 좋아요 추가/취소 처리
	    boolean isLiked = isUserLikedFestival(userId, festivalId);

	    if (isLiked) {
	        // 좋아요 취소
	        festivalDAO.removeLike(userId, festivalId);
	    } else {
	        // 좋아요 추가
	        festivalDAO.addLike(userId, festivalId);
	    }

	    // 변경된 후, 새로운 좋아요 수 반환
	    int newLikeCount = festivalDAO.getLikeCount(festivalId);
	    return newLikeCount;
	}
 
	@Override
    public int getLikeCount(int festivalId) {
        return festivalDAO.getLikeCount(festivalId);
    }

	@Override
	public boolean isUserLikedFestival(String userId, int festivalId) {
        // FestivalDAO에서 해당 사용자와 축제에 대한 좋아요 상태를 확인
        return festivalDAO.isUserLikedFestival(userId, festivalId);
    }

	@Override
	public List<Festival> getRandomFestivalList(int count) {
		
		return festivalDAO.getRandomFestivalList(count);
	}

	public int updateFestival(Festival festival) {
		int result = festivalDAO.updateFestival(festival);
		return result;
	}


}
