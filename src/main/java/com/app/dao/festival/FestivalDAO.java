package com.app.dao.festival;

import java.util.List;

import com.app.dto.festival.Festival;

public interface FestivalDAO {

	Festival getFestivalById(int festivalId);
	
	List<Festival> findFestivalList();
}
