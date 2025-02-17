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
	public List<Comment> findCommentListByUserId(String userId) {
		List<Comment> commentList = commentDAO.findCommentListByUserId(userId);
		
		return commentList;
	}

	@Override
	public List<Comment> findCommentListByPostId(int postId) {
		List<Comment> commentList = commentDAO.findCommentListByPostId(postId);
		
		return commentList;
	}
	
	@Override
	public int saveReviewDetailCommentByPostId(int postId, String comment, String nickName, String userId) {
		int result = commentDAO.saveReviewDetailCommentByPostId(postId, comment, nickName, userId);
		
		return result;
	}

	@Override
	public int saveQnADetailCommentByPostId(int postId, String comment, String nickName, String userId) {
		int result = commentDAO.saveQnADetailCommentByPostId(postId, comment, nickName, userId);
		
		return result;
	}

	@Override
	public int deleteReviewDetailCommentByPostIdAndCommentId(int postId, int commentId) {
		int result = commentDAO.deleteReviewDetailCommentByPostIdAndCommentId(postId, commentId);
		return result;
	}

	
	

}
