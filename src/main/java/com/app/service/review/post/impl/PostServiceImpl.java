package com.app.service.review.post.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.review.post.PostDAO;
import com.app.dto.review.Post;
import com.app.dto.review.ReviewImages;
import com.app.service.review.post.PostService;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	PostDAO postDAO;

	@Override
	public List<Post> findPostList() {
		List<Post> postList = postDAO.findPostList();

		return postList;
	}

	@Override
	public Post findPostByUserId(String userId) {
		Post post = postDAO.findPostByUserId(userId);
		
		return post;
	}

	@Override
	public Post findPostByPostId(int postId) {
		Post post = postDAO.findPostByPostId(postId);
		
		return post;
	}

	public int increasePostViews(int postId) { // 조회수 증가
		int result = postDAO.increasePostViews(postId);
		
		return result;
	}

	@Override
	public int savePost(Post post) {
		int result = postDAO.savePost(post);
		
		return result;
	}

	@Override
	public int saveReviewImage(ReviewImages reviewImages) {
		int result = postDAO.saveReviewImage(reviewImages);
		
		return result;
	}

	@Override
	public List<ReviewImages> findReviewImages() {
		List<ReviewImages> reviewImages = postDAO.findReviewImages();
		
		return reviewImages;
	}
	
	@Override
	public List<Post> findPostListByUserId(String userId){
		List<Post> result = postDAO.findPostListByUserId(userId);
		
		return result;
	}

	@Override
	public int getLastPostId() {
		int result = postDAO.getLastPostId();
		return result;
	}

	@Override
	public ReviewImages findReviewImagesByPostId(int postId) {
		ReviewImages reviewImages = postDAO.findReviewImagesByPostId(postId);
		
		return reviewImages;
	}

	@Override
	public List<Post> findPostListByBoardId(int boardId) {
		List<Post> result = postDAO.findPostListByBoardId(boardId);
		
		return result;
	}
	
	@Override
    public void setImageUrlForPost(Post post) {
        // 해당 게시글의 이미지 URL을 설정
        String urlFilePath = postDAO.getUrlFilePathByPostId(post.getPostId());
        post.setUrlFilePath(urlFilePath);  // Post 객체의 urlFilePath 필드에 이미지 URL 할당
    }

	@Override
	public String getUrlFilePathByPostId(int postId) {
		String result = postDAO.getUrlFilePathByPostId(postId);
		
		return result;
	}

	@Override
	public int deletePostByPostId(int postId) {
		int result = postDAO.deletePostByPostId(postId);
		
		return result;
	}
	
	@Override
	public int deletePostImagesByPostId(int postId) {
		int result = postDAO.deletePostImagesByPostId(postId);
		
		return result;
	}

	@Override
	public int reportPostByPostId(int postId) {
		int result = postDAO.reportPostByPostId(postId);
		
		return result;
	}

	

}
