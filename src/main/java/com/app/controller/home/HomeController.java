package com.app.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.festival.Festival;
import com.app.dto.festival.FestivalImage;
import com.app.service.festival.FestivalImageService;
import com.app.service.festival.FestivalService;

@Controller
public class HomeController {

	@Autowired
	FestivalService festivalService;
	
	@Autowired
	FestivalImageService festivalImageService;
	
	@GetMapping("/") // 홈 화면
    public String home(Model model) {
       
        
		List<FestivalImage> randomImages = festivalImageService.getRandomFestivalImages(5);
	    model.addAttribute("randomImages", randomImages);

	    List<Festival> festivalList = festivalService.getRandomFestivalList(4);
	    model.addAttribute("festivalList", festivalList); // 이미지 정보만 전달

	    for (Festival festival : festivalList) {
	        System.out.println("축제 이름: " + festival.getFestivalName());
	    }
	    
        return "mainpage/MainPage";
    }
	
	/*
	 * @GetMapping("/MainTravelNews") // 오늘의 여행 소식 public String TrevalNews(Model
	 * model) {
	 * 
	 * List<Festival> festivalList = festivalService.getRandomFestivalList(4);
	 * model.addAttribute("festivalList", festivalList); // 이미지 정보만 전달
	 * 
	 * for (Festival festival : festivalList) { System.out.println("축제 이름: " +
	 * festival.getFestivalName()); }
	 * 
	 * return "mainpage/MainTravelNews"; // JSP 페이지로 이동 }
	 */
}
