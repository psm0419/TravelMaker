package com.app.dao.attraction;

import java.util.List;

import com.app.dto.attraction.AttractionInfo;

public interface AttractionDAO {

	 List<AttractionInfo> findAttractions();
}
