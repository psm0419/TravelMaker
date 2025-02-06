package com.app.controller.signup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignupController {

	@GetMapping("user/SignUp")
	public String signUp() {
		return"signup/signup";
	}
}
