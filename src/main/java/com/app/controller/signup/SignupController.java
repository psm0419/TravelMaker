package com.app.controller.signup;

import com.app.service.signup.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.signup.User;

@Controller
public class SignupController {

	@Autowired
	UserService userService;
	
	@GetMapping("user/SignUp")
	public String signUp() {
		return"signup/signup";
	}
	
	@PostMapping("/user/signup")
	public String signupAction(User user) {
		
		user.setUserType("CUS");
		int result = userService.registerUser(user);
				
		System.out.println("회원가입 처리 결과 " + result);
		
		if(result > 0) {
			return "redirect:/main";
		}else {
			return "customer/signup";
		}
	}
	
	
	
	
}
