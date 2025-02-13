package com.app.service.review.post;

import java.util.List;

import com.app.dto.review.Post;

public interface PostService {

	List<Post> findPostList();
	
	Post findPostByUserId(String userId);
	
	Post findPostByPostId(int postId);

	int increasePostViews(int postId);
	
}
