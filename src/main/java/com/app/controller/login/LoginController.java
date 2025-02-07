package com.app.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("user/login")
	public String signUp() {
		return"login/login";
	}
}
