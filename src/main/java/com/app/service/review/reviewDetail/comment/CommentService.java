package com.app.service.review.reviewDetail.comment;

import java.util.List;

import com.app.dto.review.Comment;

public interface CommentService {
	
	List<Comment> findCommentListByUserId(String userId);
	
	List<Comment> findCommentListByPostId(int postId);
	
	int saveReviewDetailCommentByPostId(int postId, String comment, String nickName, String userId);
	
	int saveQnADetailCommentByPostId(int postId, String comment, String nickName, String userId);
	
	int deleteReviewDetailCommentByPostIdAndCommentId(int postId, int commentId);
}
