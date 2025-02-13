package com.app.controller.festivalpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dao.festival.FestivalImageDAO;
import com.app.dto.festival.Festival;
import com.app.dto.festival.FestivalImage;
import com.app.service.festival.FestivalService;

@Controller
public class FestivalPageController {

	@Autowired
	FestivalService festivalService;
	
	@Autowired
    FestivalImageDAO festivalImageDAO;

	@GetMapping("/festivalpage/FestivalPage")
	public String festivalPage(@RequestParam(defaultValue = "0") int festivalId, Model model) {
		List<Festival> festivalList = festivalService.findFestivalList();
		model.addAttribute("festivalList", festivalList);
		
		for (Festival festival : festivalList) {
	        List<FestivalImage> images = festivalImageDAO.findImagesByFestivalId(festival.getFestivalId());
	        festival.setImages(images);  // Festival 클래스에 images 필드가 있어야 함
	    }
		
		return "festivalpage/FestivalPage";
	}

	// 축제 상세 페이지 이동
	@GetMapping("/festivalpage/FestivalDetail/{festivalId}")
	public String getFestivalDetail(@PathVariable int festivalId, Model model) {

		Festival festival = festivalService.getFestivalById(festivalId);
		model.addAttribute("festival", festival);
		
		return "festivalpage/FestivalDetail";
	}
}
