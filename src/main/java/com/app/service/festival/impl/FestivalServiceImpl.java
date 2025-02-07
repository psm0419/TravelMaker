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
	public Festival getFestivalById(int festivalId) {
		Festival festival = festivalDAO.getFestivalById(festivalId);
		return festival;
	}

}
