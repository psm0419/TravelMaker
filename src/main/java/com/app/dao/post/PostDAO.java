package com.app.dao.post;

import java.util.List;

import com.app.dto.post.Posts;

public interface PostDAO {
	
	List<Posts> postList();
	List<Posts> NotifyPostList();
	
//	int removePost(int postId);
	 int removePosts(List<Integer> postIds);
}
