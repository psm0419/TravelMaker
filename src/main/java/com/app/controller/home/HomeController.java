package com.app.controller.home;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.festival.Festival;
import com.app.service.festival.FestivalService;

@Controller
public class HomeController {
	
	@Autowired
	FestivalService festivalService;

	@GetMapping("/")
	public String home(Model model) {
		List<Festival> festivalList = festivalService.findFestivalList();
		
		System.out.println(festivalList);
		
		model.addAttribute("festivalList",festivalList);
		
		return "mainpage/MainPage";
	}
	
	
	
}
