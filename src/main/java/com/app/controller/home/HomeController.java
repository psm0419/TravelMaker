package com.app.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.app.dto.festival.Festival;
import com.app.dto.review.Post;
import com.app.service.festival.FestivalService;
import com.app.service.review.post.PostService;

@Controller
public class HomeController {
	
	@Autowired
	FestivalService festivalService;
	
	@Autowired
	PostService postService;

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
        Post post = postService.findPostByPostId(postId);
        
        System.out.println(post);
        
        model.addAttribute("postList", post);
        return "boardpage/ReviewDetail"; // JSP 파일명
    }

	
	
	
}
