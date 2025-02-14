package com.app.service.post;

import java.util.List;

import com.app.dto.post.Posts;

public interface PostService {
	List<Posts> postList();
	List<Posts> NotifyPostList();
	
	int removePost(List<Integer> postIds);
}
