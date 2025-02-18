package com.app.dao.review.post;

import java.util.List;

import com.app.dto.review.Post;
import com.app.dto.review.ReviewImages;

public interface PostDAO {
	
	List<Post> findPostList();

	Post findPostByUserId(String userId);
	
	Post findPostByPostId(int postId);

	int increasePostViews(int postId);
	
	int savePost(Post post);
	
	int saveReviewImage(ReviewImages reviewImages);
	
	List<ReviewImages> findReviewImages();
	
	List<Post> findPostListByUserId(String userId);
	
	int getLastPostId();
	
	ReviewImages findReviewImagesByPostId(int postId);
	
	List<Post> findPostListByBoardId(int boardId);
	
	String getUrlFilePathByPostId(int postId);
	
	int deletePostByPostId(int postId);
}
