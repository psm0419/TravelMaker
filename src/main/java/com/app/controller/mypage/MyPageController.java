package com.app.controller.mypage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyPageController {

	@GetMapping("/mypage")
	public String mypage() {
		return "mypage/MyPage";
	}
	
	@GetMapping("/mypage/bookmark")
	public String bookmark(Model model) {
//		List<FestivalLike> bookMarkList = FestivalLikeService.bookMarkList();
//		model.addAttribute("bookMarkList",bookMarkList);
		return "mypage/BookMark";
	}
	
	@GetMapping("/mypage/talk")
	public String talk() {
		return "mypage/Talk";
	}
	
	@GetMapping("/mypage/achievement")
	public String achievement() {
		return "mypage/Achievement";
	}
	
	@GetMapping("/mypage/review")
	public String review() {
		return "mypage/Review";
	}
	
	@GetMapping("/mypage/correction")
	public String correction() {
		return "mypage/Correction";
	}
	
	@GetMapping("/mypage/qna")
	public String qna() {
		return "mypage/QNA";
	}
}
