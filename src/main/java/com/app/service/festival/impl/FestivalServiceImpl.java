package com.app.service.festival.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.app.dao.festival.FestivalDAO;
import com.app.dto.festival.Festival;
import com.app.service.festival.FestivalService;

public class FestivalServiceImpl implements FestivalService {
	
	@Autowired
	FestivalDAO festivalDAO;

	@Override
	public List<Festival> findFestivalList() {
		
		List<Festival> festivalList = festivalDAO.findFestivalList();

		return festivalList;
	}
	
	

}
