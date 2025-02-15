package com.app.controller.signup;

import com.app.service.signup.UserService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.signup.User;

@Controller
public class SignupController {

	@Autowired
	UserService userService;

	@GetMapping("user/SignUp")
	public String signUp() {
		return "signup/signup";
	}

	@PostMapping("/user/signup")
	public String signupAction(User user) {

		user.setUserType("CUS");

		int result = userService.registerUser(user);

		System.out.println("회원가입 처리 결과 " + result);

		if (result > 0) {
			return "redirect:/user/login";
		} else {
			return "user/signup";
		}
	}
		
	@ResponseBody // 데이터만 전달 리턴 값의 텍스트가 돌아옴
	@RequestMapping("/user/checkDupId")  //아이디 중복체크
	public String checkDupId(@RequestBody String data) {
		
		System.out.println("/user/checkDupId 요청 들어옴");
		System.out.println(data);
		
		boolean result =  userService.isDuplicatedId(data); 
		
		
		if(result) {
			return "Y"; 
		}else {
			return "N";
		}
	}
	
	@ResponseBody // 데이터만 전달 리턴 값의 텍스트가 돌아옴
	@RequestMapping("/user/checkDupNickName")
	public String checkDupnickName(@RequestBody String data) {
		
		System.out.println("/user/checkDupnickName요청 들어옴");
		System.out.println(data);
		
		boolean result =  userService.isDuplicatedNick(data); 
		
		if(result) {
			return "Y"; 
		}else {
			return "N";
		}
	}
	
	
	@ResponseBody // 데이터만 전달 리턴 값의 텍스트가 돌아옴
	@RequestMapping("/user/checkDupJumin")
	public String checkDupJumin(@RequestBody String data) {
		
		System.out.println("/user/checkDupJumin요청 들어옴");
		System.out.println(data);
		
		boolean result =  userService.isDuplicatedJumin(data); 
		
		if(result) {
			return "Y"; 
		}else {
			return "N";
		}
	}
	
	@ResponseBody // 데이터만 전달 리턴 값의 텍스트가 돌아옴
	@RequestMapping("/user/checkDupTel")
	public String checkDupnickTel(@RequestBody String data) {
		
		System.out.println("/user/checkDupTel요청 들어옴");
		System.out.println(data);
		
		boolean result =  userService.isDuplicatedTel(data); 
		
		if(result) {
			return "Y"; 
		}else {
			return "N";
		}
	}
	
	@ResponseBody // 데이터만 전달 리턴 값의 텍스트가 돌아옴
	@RequestMapping("/user/checkDupEmail")
	public String checkDupEmail(@RequestBody String data) {
		
		System.out.println("/user/checkDupEmail요청 들어옴");
		System.out.println(data);
		
		boolean result =  userService.isDuplicatedEmail(data); 
		
		if(result) {
			return "Y"; 
		}else {
			return "N";
		}
	}
	
	
	
}
