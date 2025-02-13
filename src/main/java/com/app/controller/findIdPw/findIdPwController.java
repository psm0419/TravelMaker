package com.app.controller.findIdPw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class findIdPwController {

	//아이디 비밀번호 찾기 버튼
	@GetMapping("/user/findIdPw")
	public String findIdPw() {
		//아이디 비밀번호 찾기 버튼 홈페이지
		return"findIdPw/findIdPw";
	}
	
	//아이디 찾기
	@GetMapping("/user/findId")
	public String findId() {
		// 아이디 찾기 홈페이지
		return"findIdPw/findId";
	}
	
	//아이디 찾기 포스트 매핑
	@ResponseBody
	@PostMapping("/user/findId")
	public String findIdAction(){
		
		return null;
	}
	
	//비밀번호 찾기
	@GetMapping("/user/findPw")
	public String findPw() {
		// 비밀번호 찾기 홈페이지
		return"findIdPw/findPw";
	}
	
	//비밀번호 찾기 매핑
	@ResponseBody
	@PostMapping("/user/findPw")
	public String findPwAction(){
		
		return null;
	}
}
