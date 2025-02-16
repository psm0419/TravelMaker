package com.app.controller.festivalpage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
	//증가된 좋아요 화면에 반환
	@PostMapping("/festival/like/{festivalId}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> likeFestival(@PathVariable int festivalId) {
	    // 축제의 좋아요 수를 1 증가시키기
	    int newLikeCount = festivalService.incrementLikeCount(festivalId);

	    // 결과를 반환
	    Map<String, Object> response = new HashMap<>();
	    response.put("newLikeCount", newLikeCount);

	    return ResponseEntity.ok(response);
	}
	
	@GetMapping("/searchFestival")
    public String searchFestival(@RequestParam("searchQuery") String searchQuery, Model model) {
        // 서비스 호출: 검색어를 바탕으로 축제를 찾음
        List<Festival> festivals = festivalService.searchFestivals(searchQuery);
        
        // 결과를 뷰에 전달
        model.addAttribute("festivals", festivals);
        return "search/Search";  // 검색 결과를 보여줄 뷰 페이지
    }
}
