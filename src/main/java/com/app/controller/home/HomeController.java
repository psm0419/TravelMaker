package com.app.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.festival.Festival;
import com.app.dto.review.Comment;
import com.app.dto.review.Post;
import com.app.service.festival.FestivalService;
import com.app.service.review.post.PostService;
import com.app.service.review.reviewDetail.comment.CommentService;

@Controller
public class HomeController {
	
	@Autowired
	FestivalService festivalService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	CommentService commentService;

	@GetMapping("/") // 홈 화면
	public String home(Model model) {
		List<Festival> festivalList = festivalService.findFestivalList();
		
		System.out.println(festivalList);
		
		model.addAttribute("festivalList",festivalList);
		
		return "mainpage/MainPage";
	}
	
	@GetMapping("/reviewboard") // 후기게시판 화면
	public String board(Model model) {
		List<Post> postList = postService.findPostList();
		
		System.out.println(postList);
		
		model.addAttribute("postList",postList);
		
		return "boardpage/ReviewBoard";
	}
	
//	@GetMapping("/reviewdetail")
//	public String reviewDetail(Model model) {
//		Post post = postService.findPostByUserId("유저아이디");
//		
//		System.out.println(post);
//		
//		model.addAttribute("postList",post);
//		
//		return "boardpage/ReviewDetail";
//	}
	
	@GetMapping("/reviewdetail/{postId}")
    public String getReviewDetail(@PathVariable int postId, Model model) {
		postService.increasePostViews(postId); // 조회수 증가
		
        Post post = postService.findPostByPostId(postId);
        
        List<Comment> commentList = commentService.findCommentListByPostId(postId);
        
        System.out.println(post);
        System.out.println(commentList);
        
        model.addAttribute("postList", post);
        model.addAttribute("commentList",commentList);
        return "boardpage/ReviewDetail"; // JSP 파일명
    }
	
	@PostMapping("/reviewdetail/{postId}/comment")
	public String saveReviewDetailComment(@PathVariable("postId") int postId, @RequestParam("content") String content) {
		
		int result = commentService.saveReviewDetailComment(postId, content);
		
		System.out.println(result);
		
		return "redirect:/reviewdetail/"+ postId;
	}
	


	
	
	
}
