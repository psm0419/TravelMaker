package com.app.service.review.reviewDetail.comment;

import java.util.List;

import com.app.dto.review.Comment;

public interface CommentService {
	
	List<Comment> findCommentListByPostId(int postId);
	
	int saveReviewDetailComment(int postId, String comment);
	
}
