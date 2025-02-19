package com.app.dao.festival.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.festival.FestivalImageDAO;
import com.app.dto.festival.FestivalImage;

@Repository
public class FestivalImageDAOImpl implements FestivalImageDAO{
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
    public List<FestivalImage> findImagesByFestivalId(int festivalId) {
        return sqlSessionTemplate.selectList("festival_mapper.findImagesByFestivalId", festivalId);
    }

	@Override
	public List<FestivalImage> getRandomFestivalImages(int count) {
        return sqlSessionTemplate.selectList("festival_mapper.getRandomFestivalImages", count);  // 랜덤 쿼리 호출
    }
}
