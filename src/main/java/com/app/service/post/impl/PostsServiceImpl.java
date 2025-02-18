package com.app.service.post.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.post.PostsDAO;
import com.app.dto.post.Posts;
import com.app.service.post.PostsService;
@Service
public class PostsServiceImpl implements PostsService{

	@Autowired
	PostsDAO postDAO;
	
	@Override
	public List<Posts> postList() {
		List<Posts> postList =postDAO.postList();
		return postList;
	}
	
	@Override
	public List<Posts> findPostById(int postId) {
		List<Posts> postIdList = postDAO.findPostById(postId);
		return postIdList;
	}
	
	@Override
	public List<Posts> NotifyPostList() {
		List<Posts> notifyPostList = postDAO.NotifyPostList();
		return notifyPostList;
	}

	@Override
	public int removePost(List<Integer> postIds) {
		int result = postDAO.removePosts(postIds);
		return result;
	}


}
