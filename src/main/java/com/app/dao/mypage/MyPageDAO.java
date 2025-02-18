package com.app.dao.mypage;

import java.util.List;

import com.app.dto.festival.Festival;

public interface MyPageDAO {

	int getBookMarkCount(String userId);
	List<Festival> getBookmarkedFestivals(String userId);
}
