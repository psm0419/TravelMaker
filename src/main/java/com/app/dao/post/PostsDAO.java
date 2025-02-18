package com.app.dao.post;

import java.util.List;

import com.app.dto.post.Posts;

public interface PostsDAO {
	
	List<Posts> postList();
	List<Posts> findPostByBoardId(int boardId);
	List<Posts> NotifyPostList();
	 int removePosts(List<Integer> postIds);
}
