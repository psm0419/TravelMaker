package com.app.service.festival;

import java.util.List;

import com.app.dto.festival.FestivalImage;

public interface FestivalImageService {

	List<FestivalImage> findImagesByFestivalId(int festivalId);
}
