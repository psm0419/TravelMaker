package com.app.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.review.Comment;
import com.app.dto.review.Post;
import com.app.service.file.FileService;
import com.app.service.review.post.PostService;
import com.app.service.review.reviewDetail.comment.CommentService;
import com.app.service.user.UserService;

@Controller
public class BoardController {
	
	@Autowired
	PostService postService;

	@Autowired
	CommentService commentService;

	@Autowired
	FileService fileService;
	
	@Autowired
	UserService userService;
	

	@GetMapping("/reviewBoard") // 후기게시판 화면
	public String board(Model model) {
		List<Post> postList = postService.findPostList(); // 게시글리스트 전체호출

		System.out.println("포스트리스트:" + postList);

		model.addAttribute("postList", postList); // 화면에 표시

		return "boardpage/ReviewBoard";
	}


	@GetMapping("/reviewDetail/{postId}") // 후기게시판 후기글 페이지
	public String getReviewDetail(@PathVariable int postId, Model model) {
		
		postService.increasePostViews(postId); // 조회수 증가
		
		Post post = postService.findPostByPostId(postId); // postId에맞는 post객체 호출
		
		model.addAttribute("postList", post); // 호출된 post 표시
		
		List<Comment> commentList = commentService.findCommentListByPostId(postId); //postId에맞는 comment들 호출
		
		model.addAttribute("commentList", commentList); //comment들 표시
		
		return "boardpage/ReviewDetail"; // JSP 파일명
	}

	
	@PostMapping("/reviewDetail/{postId}/comment")
	public String saveReviewDetailComment(@PathVariable("postId") int postId,
											@RequestParam("content") String content,
											 @RequestParam("nickName") String nickName,
											 @RequestParam("userId") String userId) {
		
		int result = commentService.saveReviewDetailCommentByPostId(postId, content, nickName, userId);

		System.out.println("결과값:" + result);

		return "redirect:/reviewDetail/" + postId;
	}
	

	@GetMapping("/writeReview")
	public String writeReview(Model model) {
		
		return "boardpage/WriteReview";
	}
	

	@PostMapping("/saveWriteReview")
	public String saveWriteReview(@RequestParam("userId") String userId,
									@RequestParam("nickName") String nickName,
									@RequestParam("title") String title,
									@RequestParam("content") String content,
									@RequestParam("reviewImage") String reviewImage) {
		
		
		
		
		return "redirect:/reviewBoard/";
	}

}
