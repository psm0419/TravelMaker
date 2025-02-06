package com.app.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@GetMapping("mypage")
	public String mypage() {
		
		return "mypage/MyPage";
	}
}
