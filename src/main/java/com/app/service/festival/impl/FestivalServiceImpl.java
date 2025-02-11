package com.app.service.festival.impl;

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
	public int saveFestival(Festival festival) {
		int result = festivalDAO.saveFestival(festival);
		return result;
	}

}
