package com.app.service.review.post.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.review.post.PostDAO;
import com.app.dto.review.Post;
import com.app.service.review.post.PostService;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	PostDAO postDAO;

	@Override
	public List<Post> findPostList() {
		List<Post> postList = postDAO.findPostList();

		return postList;
	}

	@Override
	public Post findPostByUserId(String userId) {
		Post post = postDAO.findPostByUserId(userId);
		
		return post;
	}

	@Override
	public Post findPostByPostId(int postId) {
		Post post = postDAO.findPostByPostId(postId);
		
		return post;
	}

}
