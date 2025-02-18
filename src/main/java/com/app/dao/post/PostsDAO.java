package com.app.dao.post;

import java.util.List;

import com.app.dto.post.Posts;

public interface PostsDAO {
	
	List<Posts> postList();
	List<Posts> findPostById(int postId);
	List<Posts> NotifyPostList();
	 int removePosts(List<Integer> postIds);
}
