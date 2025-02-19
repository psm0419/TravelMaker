package com.app.dao.attraction.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.attraction.AttractionDAO;
import com.app.dto.attraction.AttractionInfo;

@Repository
public class AttractionDAOImpl implements AttractionDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<AttractionInfo> findAttractions() {
        return sqlSessionTemplate.selectList("attraction_mapper.findAttractions");
    }
}
