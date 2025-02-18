package com.app.service.post;

import java.util.List;

import com.app.dto.post.Posts;

public interface PostsService {
	List<Posts> postList();
	List<Posts> NotifyPostList();
	List<Posts> findPostById(int postId);
	int removePost(List<Integer> postIds);
}
