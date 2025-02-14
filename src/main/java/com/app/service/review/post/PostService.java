package com.app.service.review.post;

import java.util.List;

import com.app.dto.review.Post;
import com.app.dto.review.ReviewImages;

public interface PostService {

	List<Post> findPostList();
	
	Post findPostByUserId(String userId);
	
	Post findPostByPostId(int postId);

	int increasePostViews(int postId);
	
	int savePost(Post post);
	
	int saveReviewImage(ReviewImages reviewImages);
	
	List<ReviewImages> findReviewImages();
	
	List<Post> findPostListByUserId(String userId);
}
