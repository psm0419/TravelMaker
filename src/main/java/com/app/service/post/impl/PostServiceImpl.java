package com.app.service.post.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.post.PostDAO;
import com.app.dto.post.Posts;
import com.app.service.post.PostService;
@Service
public class PostServiceImpl implements PostService{

	@Autowired
	PostDAO postDAO;
	
	@Override
	public List<Posts> postList() {
		List<Posts> postList =postDAO.postList();
		return postList;
	}


	@Override
	public int removePost(List<Integer> postIds) {
		int result = postDAO.removePosts(postIds);
		return result;
	}
}
