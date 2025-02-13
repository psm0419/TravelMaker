package com.app.service.review.reviewDetail.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.review.reviewDetail.comment.CommentDAO;
import com.app.dto.review.Comment;
import com.app.service.review.reviewDetail.comment.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDAO commentDAO;

	@Override
	public List<Comment> findCommentListByPostId(int postId) {
		List<Comment> commentList = commentDAO.findCommentListByPostId(postId);
		
		return commentList;
	}

	@Override
	public int saveReviewDetailComment(int postId, String comment) {
		int result = commentDAO.saveReviewDetail(postId, comment);
		
		return result;
	}
	
	

}
