package com.app.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.festival.Festival;
import com.app.service.mypage.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService myPageService;

	@GetMapping("/mypage")
	public String mypage() {
		return "mypage/MyPage";
	}

	@GetMapping("/mypage/bookmark")
	public String bookmark(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		// 즐겨찾기 개수 조회
		int bookmarkCount = myPageService.getBookMarkCount(userId);
		model.addAttribute("bookmarkCount", bookmarkCount);

		// 즐겨찾기한 축제 목록 조회
		List<Festival> bookmarkedFestivals = myPageService.getBookmarkedFestivals(userId);
		model.addAttribute("bookmarkedFestivals", bookmarkedFestivals);
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
