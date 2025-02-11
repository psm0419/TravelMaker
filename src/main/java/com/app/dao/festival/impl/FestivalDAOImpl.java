package com.app.dao.festival.impl;

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
	public int saveFestival(Festival festival) {
		
		int result = sqlSessionTemplate.insert("festival_mapper.saveFestival", festival);
		
		return result;
	}

}
