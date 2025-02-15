package com.app.service.attraction;

import java.util.List;

import com.app.dto.attraction.AttractionInfo;

public interface AttractionService {

	List<AttractionInfo> findAttractions();
}
