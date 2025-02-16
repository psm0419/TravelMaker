package com.app.service.festival.impl;

import java.util.List;

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
	public int incrementLikeCount(int festivalId) {
		return festivalDAO.incrementLikeCount(festivalId);
	}

	@Override
	public List<Festival> searchFestivals(String searchQuery) {
		// DAO에서 검색어를 바탕으로 축제 리스트를 가져옴
        return festivalDAO.findFestivalsBySearchQuery(searchQuery);
	}

}
