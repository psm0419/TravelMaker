package com.app.service.attraction.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.attraction.AttractionDAO;
import com.app.dto.attraction.AttractionInfo;
import com.app.service.attraction.AttractionService;

@Service
public class AttractionServiceImpl implements AttractionService {

    @Autowired
    AttractionDAO attractionDAO;

    @Override
    public List<AttractionInfo> findAttractions() {
        return attractionDAO.findAttractions();
    }
}
