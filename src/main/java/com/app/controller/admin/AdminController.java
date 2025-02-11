package com.app.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.festival.Festival;
import com.app.dto.post.Posts;
import com.app.dto.user.User;
import com.app.service.festival.FestivalService;
import com.app.service.post.PostService;
import com.app.service.user.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	@Autowired
	FestivalService festivalService;
	
	@GetMapping("/admin")
	public String admin(Model model) {
		 model.addAttribute("totalUsers", 1230);
	     model.addAttribute("totalPosts", 5678);
	     model.addAttribute("todayVisitors", 456);
	     model.addAttribute("reportedPosts", 12);
		return "admin/Admin";
	}
	@GetMapping("/admin/notice")
	public String notice(Model model) {
		return "admin/Notice";
	}
	
	@GetMapping("/admin/user")
	public String userManagement(Model model) {
	    List<User> userList = userService.getUserList();
	    model.addAttribute("userList",userList);
	    return "admin/UserManagement";
	}
	
	@GetMapping("/admin/user/{userId}")
	public String users(@PathVariable("userId") String userId, Model model) {
		User user = userService.getUserById(userId);
		model.addAttribute("user",user);
		return "admin/Users";
	}
	
	@PostMapping("/admin/user/{userId}")
	public String bannedUser() {
		return "redirect:/admin/user/{userId}";
	}
	
	@GetMapping("/admin/content")
	public String contentManagement(Model model) {
		return "admin/ContentManagement";
	}
	
	@GetMapping("/admin/content/questionBoard")
	public String questionBoardManagement(Model model) {
		List<Posts> postList = postService.postList();
		model.addAttribute("postList", postList);
		return "admin/content/questionBoard";
	}
	
	@GetMapping("/admin/content/reviewBoard")
	public String reviewBoardManagement(Model model) {
		List<Posts> postList = postService.postList();
		model.addAttribute("postList", postList);
		return "admin/content/reviewBoard";
	}
	
	@PostMapping("/admin/removePosts")
	@ResponseBody
	public Map<String, Object> removePosts(@RequestBody Map<String, List<Integer>> requestBody) {
	    List<Integer> postIds = requestBody.get("postIds");

	    if (postIds == null || postIds.isEmpty()) {
	        return Map.of("success", false, "message", "삭제할 게시물을 선택하세요.");
	    }

	    int deletedCount = postService.removePost(postIds);

	    return Map.of("success", deletedCount > 0, "deletedCount", deletedCount);
	}

	@GetMapping("/admin/festival")
	public String festivalManagement(Model model) {
		return "admin/FestivalManagement";
	}
	
	@GetMapping("/admin/festival/saveFestival")
	public String saveFestival() {
		return "admin/festival/SaveFestival";
	}
	@PostMapping("/admin/festival/saveFestival")
	public String saveFestivalAction(Festival festival) {
		int result=festivalService.saveFestival(festival);
		if(result >0) {
			return"redirect:/admin/festival";
		} else {
		return "admin/festival/SaveFestival";
		}
	}
	
	@GetMapping("/admin/notify")
	public String NotifyManagement(Model model) {
		return "admin/NotifyManagement";
	}
	
	@GetMapping("/admin/option")
	public String option(Model model) {
		return "admin/Option";
	}
}
