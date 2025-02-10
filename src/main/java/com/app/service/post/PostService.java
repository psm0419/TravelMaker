package com.app.service.post;

import java.util.List;

import com.app.dto.post.Posts;

public interface PostService {
	List<Posts> postList();
	
	/*
	 * int removePost(int postId);
	 */
	int removePost(List<Integer> postIds);
}
