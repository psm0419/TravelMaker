package com.app.controller.festivalpage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.app.dao.festival.FestivalImageDAO;
import com.app.dto.festival.Festival;
import com.app.dto.festival.FestivalImage;
import com.app.dto.signup.User;
import com.app.service.festival.FestivalService;

@Controller
public class FestivalPageController {

	@Autowired
	FestivalService festivalService;
	
	@Autowired
    FestivalImageDAO festivalImageDAO;

	@GetMapping("/festivalpage/FestivalPage")
	public String festivalPage(@RequestParam(defaultValue = "0") int festivalId, 
	                          Model model,
	                          @SessionAttribute(name = "loggedInUser", required = false) User loggedInUser) {
	    List<Festival> festivalList = festivalService.findFestivalList();
	    
	    // 로그인한 사용자의 좋아요 상태 확인
	    if (loggedInUser != null) {
	        String userId = loggedInUser.getUserId();
	        for (Festival festival : festivalList) {
	            boolean isLiked = festivalService.isUserLikedFestival(userId, festival.getFestivalId());
	            festival.setLiked(isLiked);
	            
	            // 이미지 설정
	            List<FestivalImage> images = festivalImageDAO.findImagesByFestivalId(festival.getFestivalId());
	            festival.setImages(images);
	        }
	    } else {
	        // 로그인하지 않은 경우 이미지만 설정
	        for (Festival festival : festivalList) {
	            List<FestivalImage> images = festivalImageDAO.findImagesByFestivalId(festival.getFestivalId());
	            festival.setImages(images);
	        }
	    }
	    
	    model.addAttribute("festivalList", festivalList);
	    model.addAttribute("loggedInUser", loggedInUser);
	    
	    return "festivalpage/FestivalPage";
	}

	// 축제 상세 페이지 이동
	@GetMapping("/festivalpage/FestivalDetail/{festivalId}")
	public String getFestivalDetail(@PathVariable int festivalId, Model model) {

		Festival festival = festivalService.getFestivalById(festivalId);
		model.addAttribute("festival", festival);
		
		return "festivalpage/FestivalDetail";
	}
	
	
	@GetMapping("/festival")
	public String getFestivalList(Model model, @SessionAttribute(name = "loggedInUser", required = false) User loggedInUser) {
	    List<Festival> festivalList = festivalService.getFestivalList();
	    
	    // 로그인한 경우, 좋아요 상태 추가
	    if (loggedInUser != null) {
	        String userId = loggedInUser.getUserId();  // 로그인된 유저의 ID 가져오기
	        
	        for (Festival festival : festivalList) {
	            boolean isLiked = festivalService.isUserLikedFestival(userId, festival.getFestivalId());
	            festival.setLiked(isLiked); // Festival 클래스에 liked 필드를 추가하여 좋아요 상태 저장
	        }
	    }
	    
	    model.addAttribute("festivalList", festivalList);
	    model.addAttribute("loggedInUser", loggedInUser); // 로그인한 유저 정보 모델에 추가
	    
	    return "festivalList"; // JSP나 Thymeleaf 페이지 이름
	}
	//증가된 좋아요 화면에 반환
	@ResponseBody
	@PostMapping("/festival/like")
	public ResponseEntity<String> toggleLike(@SessionAttribute(name = "loggedInUser", required = false) User loggedInUser, 
	                                         @RequestParam int festivalId) {
	    if (loggedInUser == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	    }

	    // 유저 객체에서 userId만 추출
	    String userId = loggedInUser.getUserId();
	    
	    // 좋아요 처리 후, 새로운 좋아요 수 얻기
	    int newLikeCount = festivalService.toggleLike(userId, festivalId);

	    // 새로운 좋아요 수를 반환
	    return ResponseEntity.ok(String.valueOf(newLikeCount));
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
