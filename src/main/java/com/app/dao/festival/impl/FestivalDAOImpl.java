package com.app.dao.festival.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.festival.FestivalDAO;
import com.app.dto.festival.Festival;
@Repository
public class FestivalDAOImpl implements FestivalDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Festival> getFestivalList() {
		List<Festival> festivalList = sqlSessionTemplate.selectList("festival_mapper.findFestivalList");
		return festivalList;
	}

	@Override
	public int saveFestival(Festival festival) {
		
		int result = sqlSessionTemplate.insert("festival_mapper.saveFestival", festival);
		
		return result;
	}

	@Override
	public Festival getFestivalById(int festivalId) {
		Festival festival = sqlSessionTemplate.selectOne("festival_mapper.getFestivalById", festivalId);
		return festival;
	}

	@Override

	public int removeFestival(int festivalId) {
		int result = sqlSessionTemplate.delete("festival_mapper.removeFestival",festivalId);
		return result;
	}

	public List<Festival> findFestivalList() {
		
		List<Festival> festivalList = sqlSessionTemplate.selectList("festival_mapper.findFestivalList");
		
		return festivalList;
	}

	@Override
	public int incrementLikeCount(int festivalId) {
		return sqlSessionTemplate.update("festival_mapper.incrementLikeCount", festivalId);
	}

}
