package com.app.service.festival.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.festival.FestivalImageDAO;
import com.app.dto.festival.FestivalImage;
import com.app.service.festival.FestivalImageService;

@Service
public class FestivalImageServiceImpl implements FestivalImageService{
	
	@Autowired
    private FestivalImageDAO festivalImageDAO;
	
	@Override
	public List<FestivalImage> findImagesByFestivalId(int festivalId) {
		return festivalImageDAO.findImagesByFestivalId(festivalId);
	}

}
