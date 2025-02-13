package com.app.dao.review.post;

import java.util.List;

import com.app.dto.review.Post;

public interface PostDAO {
	
	List<Post> findPostList();

	Post findPostByUserId(String userId);
	
	Post findPostByPostId(int postId);

	int increasePostViews(int postId);
	
	int savePost(Post post);
}
