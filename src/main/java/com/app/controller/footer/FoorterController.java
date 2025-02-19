package com.app.controller.footer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoorterController {

	
	@GetMapping("/Terms")
	public String showTerms() {
		return "/footer/Terms";
	}
	
	@GetMapping("/Privacy")
	public String showPrivacy() {
		return "/footer/Privacy";
	}
}
