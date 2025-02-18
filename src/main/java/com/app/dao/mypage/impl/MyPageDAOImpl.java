package com.app.dao.mypage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.mypage.MyPageDAO;
import com.app.dto.festival.Festival;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int getBookMarkCount(String userId) {
		
		return 0;
	}

	@Override
	public List<Festival> getBookmarkedFestivals(String userId) {
		List<Festival> bookmarkdList = sqlSessionTemplate.selectList("festival_mapper.")
		return ;
	}

}
