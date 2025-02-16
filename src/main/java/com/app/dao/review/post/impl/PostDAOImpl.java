package com.app.dao.review.post.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.review.post.PostDAO;
import com.app.dto.review.Post;
import com.app.dto.review.ReviewImages;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Post> findPostList() {
		List<Post> postList = sqlSessionTemplate.selectList("post_mapper.findPostList");
		
		return postList;
	}
	
	@Override
	public List<Post> findPostListByUserId(String userId) {
		List<Post> postList = sqlSessionTemplate.selectList("post_mapper.findPostByUserId",userId);
		
		return postList;
	}

	@Override
	public Post findPostByUserId(String userId) {
		Post post = sqlSessionTemplate.selectOne("post_mapper.findPostByUserId", userId);
		
		return post;
	}

	@Override
	public Post findPostByPostId(int postId) {
		Post post = sqlSessionTemplate.selectOne("post_mapper.findPostByPostId",postId);
		
		return post;
	}
	
	public int increasePostViews(int postId) {
		int result = sqlSessionTemplate.update("post_mapper.increasePostViews", postId);
		
		return result;
	}

	@Override
	public int savePost(Post post) {
		int result = sqlSessionTemplate.insert("post_mapper.savePost", post);
		
		return result;
	}

	@Override
	public int saveReviewImage(ReviewImages reviewImages) {
		int result = sqlSessionTemplate.insert("post_mapper.saveReviewImage", reviewImages);
		
		return result;
	}

	@Override
	public List<ReviewImages> findReviewImages() {
		List<ReviewImages> reviewImages = sqlSessionTemplate.selectList("post_mapper.findReviewImages");
		
		return reviewImages;
	}

	@Override
	public int getLastPostId() {
		int result = sqlSessionTemplate.selectOne("post_mapper.getLastPostId");
		
		return result;
	}

	@Override
	public ReviewImages findReviewImagesByPostId(int postId) {
		ReviewImages reviewImages = sqlSessionTemplate.selectOne("findReviewImagesByPostId",postId);
		return reviewImages;
	}

	@Override
	public List<Post> findPostListByBoardId(int boardId) {
		List<Post> result = sqlSessionTemplate.selectList("findPostListByBoardId", boardId);
		
		return result;
	}

	@Override
	public String getUrlFilePathByPostId(int postId) {
		String result = sqlSessionTemplate.selectOne("getUrlFilePathByPostId",postId);
				
		return result;
	}
	
	

}
