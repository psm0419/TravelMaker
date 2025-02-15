package com.app.dao.festival;

import java.util.List;

import com.app.dto.festival.FestivalImage;

public interface FestivalImageDAO {

	List<FestivalImage> findImagesByFestivalId(int festivalId);
}
