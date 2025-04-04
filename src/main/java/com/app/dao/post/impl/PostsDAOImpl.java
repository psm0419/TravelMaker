package com.app.dao.post.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.post.PostsDAO;
import com.app.dto.post.Posts;
@Repository
public class PostsDAOImpl implements PostsDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Posts> postList() {
		List<Posts> postList = sqlSessionTemplate.selectList("post_mapper.findPostList");
		return postList;
	}

	@Override
	public List<Posts> findPostByBoardId(int boardId) {
		List<Posts> boardIdList = sqlSessionTemplate.selectList("post_mapper.findPostByBoardId",boardId); 
		return boardIdList;
	}
	
	@Override
	public List<Posts> NotifyPostList() {
		List<Posts> NotifyPostList = sqlSessionTemplate.selectList("post_mapper.NotifyPostList");
		return NotifyPostList; 
	}
	@Override
	public int removePosts(List<Integer> postIds) {
		Map<String , Object> params = new HashMap<>();
		params.put("postIds", postIds);
	    return sqlSessionTemplate.delete("post_mapper.removePosts", params);
	}


}
