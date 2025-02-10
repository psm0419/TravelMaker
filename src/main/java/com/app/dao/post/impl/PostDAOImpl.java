package com.app.dao.post.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.post.PostDAO;
import com.app.dto.post.Posts;
@Repository
public class PostDAOImpl implements PostDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Posts> postList() {
		List<Posts> postList = sqlSessionTemplate.selectList("post_mapper.findPostList");
		return postList;
	}
	@Override
	public int removePosts(List<Integer> postIds) {
	    return sqlSessionTemplate.delete("post_mapper.removePosts", postIds);
	}

}
