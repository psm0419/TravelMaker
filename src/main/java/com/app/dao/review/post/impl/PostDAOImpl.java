package com.app.dao.review.post.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.review.post.PostDAO;
import com.app.dto.review.Post;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Post> findPostList() {
		List<Post> postList = sqlSessionTemplate.selectList("post_mapper.findPostList");
		
		return postList;
	}

	@Override
	public Post findPostByUserId(String userId) {
		Post post = sqlSessionTemplate.selectOne("post_mapper.findPostByUserId", userId);
		
		return post;
	}
	
	

}
