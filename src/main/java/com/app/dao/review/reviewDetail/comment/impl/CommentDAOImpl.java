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
	public List<Comment> findCommentListByPostId(int postId) {
		List<Comment> commentList = sqlSessionTemplate.selectList("comment_mapper.findCommentListByPostId", postId);
		
		return commentList;
	}

	@Override
	public int saveReviewDetail(int postId, String comment) {
		Map<String, Object> params = new HashMap<>();
        params.put("postId", postId);
        params.put("content", comment);
		
		int result = sqlSessionTemplate.insert("comment_mapper.saveReviewDetailcomment", params);
		
		return result;
	}

	
	
	
}
