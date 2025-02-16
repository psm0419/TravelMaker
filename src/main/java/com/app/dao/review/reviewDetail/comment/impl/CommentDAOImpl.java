package com.app.dao.review.reviewDetail.comment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.review.reviewDetail.comment.CommentDAO;
import com.app.dto.review.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Comment> findCommentListByUserId(String userId) {
		List<Comment> commentList = sqlSessionTemplate.selectList("comment_mapper.findCommentListByUserId", userId);
		
		return commentList;
	}

	@Override
	public List<Comment> findCommentListByPostId(int postId) {
		List<Comment> commentList = sqlSessionTemplate.selectList("comment_mapper.findCommentListByPostId", postId);
		
		return commentList;
	}

	@Override
	public int saveReviewDetailCommentByPostId(int postId, String comment, String nickName, String userId) {
		Map<String, Object> params = new HashMap<>();
        params.put("postId", postId);
        params.put("content", comment);
        params.put("nickName", nickName);
        params.put("userId", userId);
		
		int result = sqlSessionTemplate.insert("comment_mapper.saveReviewDetailCommentByPostId", params);
		
		return result;
	}

	@Override
	public int saveQnADetailCommentByPostId(int postId, String comment, String nickName, String userId) {
		Map<String, Object> params = new HashMap<>();
        params.put("postId", postId);
        params.put("content", comment);
        params.put("nickName", nickName);
        params.put("userId", userId);
		
		int result = sqlSessionTemplate.insert("comment_mapper.saveQnADetailCommentByPostId", params);
		
		return result;
	}


	
	
	
}
