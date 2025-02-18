package com.app.dao.festival.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.festival.FestivalDAO;
import com.app.dto.festival.Festival;

@Repository
public class FestivalDAOImpl implements FestivalDAO {

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
		int result = sqlSessionTemplate.delete("festival_mapper.removeFestival", festivalId);
		return result;
	}

	public List<Festival> findFestivalList() {

		List<Festival> festivalList = sqlSessionTemplate.selectList("festival_mapper.findFestivalList");

		return festivalList;
	}

	@Override
	public List<Festival> findFestivalsBySearchQuery(String searchQuery) {
		return sqlSessionTemplate.selectList("festival_mapper.searchFestivals", "%" + searchQuery + "%");
	}

	@Override
	public boolean isUserLikedFestival(String userId, int festivalId) {
		// SQL 쿼리를 통해 사용자가 해당 축제에 대해 좋아요를 눌렀는지 확인
		Integer count = sqlSessionTemplate.selectOne("festival_mapper.isUserLikedFestival",
				Map.of("userId", userId, "festivalId", festivalId));
		return count != null && count > 0;
	}

	@Override
	public void addLike(String userId, int festivalId) {
		// userId만 사용하여 삽입
		sqlSessionTemplate.insert("festival_mapper.addLike", Map.of("userId", userId, "festivalId", festivalId));
	}

	@Override
	public void removeLike(String userId, int festivalId) {
		// userId만 사용하여 삭제
		sqlSessionTemplate.delete("festival_mapper.removeLike", Map.of("userId", userId, "festivalId", festivalId));
	}

	@Override
	public int getLikeCount(int festivalId) {
		return sqlSessionTemplate.selectOne("festival_mapper.getLikeCount", festivalId);
	}

	@Override
	public void updateLikeCount(int festivalId, int likeCount) {
		sqlSessionTemplate.update("festival_mapper.updateLikeCount",
				Map.of("festivalId", festivalId, "likeCount", likeCount));
	}

	@Override
	public List<Festival> getRandomFestivalList(int count) {
		return sqlSessionTemplate.selectList("festival_mapper.getRandomFestivalList", count);
	}
	public int updateFestival(Festival festival) {
		int result = sqlSessionTemplate.update("festival_mapper.updatefestival",festival);
		return result;
	}

}
