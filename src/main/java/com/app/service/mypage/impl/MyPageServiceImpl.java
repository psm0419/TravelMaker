package com.app.service.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.mypage.MyPageDAO;
import com.app.dto.festival.Festival;
import com.app.service.mypage.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	MyPageDAO mypageDAO;

	@Override
	public int getBookMarkCount(String userId) {
		int markCount = mypageDAO.getBookMarkCount(userId);
		return markCount;
	}

	@Override
	public List<Festival> getBookmarkedFestivals(String userId) {
		List<Festival> bookmarkedList = mypageDAO.getBookmarkedFestivals(userId);
		return bookmarkedList;
	}

}
