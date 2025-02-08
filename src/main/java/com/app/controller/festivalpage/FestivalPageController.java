package com.app.controller.festivalpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.app.dto.festival.Festival;
import com.app.service.festival.FestivalService;

@Controller
public class FestivalPageController {

	@Autowired
	private FestivalService festivalService;

	@GetMapping("/festivalpage/FestivalPage")
	public String festivalPage(Model model) {
		List<Festival> festivalList = festivalService.findFestivalList();

		model.addAttribute("festivalList", festivalList);
		return "festivalpage/FestivalPage";
	}

	@GetMapping("/festivalpage/festivals")
	public String festivals(Model model) {
		List<Festival> festivalList = festivalService.findFestivalList();

		model.addAttribute("festivalList", festivalList);

		return "festivalpage/festivals";
	}

	// 축제 상세 페이지 이동
	@GetMapping("/festivalpage/FestivalDetail/{festivalId}")
	public String getFestivalDetail(@PathVariable int festivalId, Model model) {

		Festival festival = festivalService.getFestivalById(festivalId);
		System.out.println(festival);
		model.addAttribute("festival", festival);

		return "festivalpage/FestivalDetail";
	}
}
