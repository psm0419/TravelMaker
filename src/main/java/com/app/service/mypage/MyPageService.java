package com.app.service.mypage;

import java.util.List;

import com.app.dto.festival.Festival;

public interface MyPageService {

	int getBookMarkCount(String userId);
	List<Festival> getBookmarkedFestivals(String userId);
}
