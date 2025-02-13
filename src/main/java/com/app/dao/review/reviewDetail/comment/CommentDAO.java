package com.app.dao.review.reviewDetail.comment;

import java.util.List;

import com.app.dto.review.Comment;

public interface CommentDAO {
	
	List<Comment> findCommentListByPostId(int postId);
	
	int saveReviewDetail(int postId, String comment);

}
