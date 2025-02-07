package com.app.controller.festivalpage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.festival.Festival;
import com.app.service.festival.FestivalService;

@Controller
public class FestivalPageController {

	@Autowired
    private FestivalService festivalService;
	
	@GetMapping("/festivalpage/FestivalPage")
	public String festivalPage() {
		return "festivalpage/FestivalPage";
	}
	
	 // 축제 상세 페이지 이동
    @GetMapping("/festivalpage/festivalDetail")
    public String getFestivalDetail(@RequestParam("festivalId") int festivalId, Model model) {
        Festival festival = festivalService.getFestivalById(festivalId);
        System.out.println(festival);
        model.addAttribute("festival", festival);
        return "festivalpage/FestivalDetail";
    }
}
