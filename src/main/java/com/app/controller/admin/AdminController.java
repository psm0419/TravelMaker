package com.app.controller.admin;

import java.io.Console;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.festival.Festival;
import com.app.dto.post.Posts;
import com.app.dto.signup.User;
import com.app.service.festival.FestivalService;
import com.app.service.post.PostsService;
import com.app.service.signup.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService userService;
	@Autowired
	PostsService postService;
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
	    List<User> userList = userService.getAllUsers();
	    model.addAttribute("userList",userList);
	    return "admin/UserManagement";
	}
	
	@GetMapping("/admin/user/{userId}")
	public String users(@PathVariable("userId") String userId, Model model) {
		User user = userService.getUserById(userId);
		model.addAttribute("user",user);
		return "admin/Users";
	}
	
	@GetMapping("/admin/modifyUser")
	public String userUpdate(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		int userIdInt =Integer.parseInt(userId);
		User user = userService.getUserById(userId);
		request.setAttribute("user", user);
		return "admin/modifyUser";
	}
	@PostMapping("/admin/user/update")
	public String userUpdateAction(User user) {
		int result = userService.modifyUser(user);
		if(result >0) {
			return "redirect:/admin/user";
		} else {
			return "redirect:/admin/user/{userId}";
		}
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
		List<Posts> postList = postService.findPostByBoardId(1);
		model.addAttribute("postList", postList);
		return "admin/content/questionBoard";
	}
	
	@GetMapping("/admin/content/reviewBoard")
	public String reviewBoardManagement(Model model) {
		List<Posts> postList = postService.findPostByBoardId(2);
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
	
	@GetMapping("/admin/festival/festivalList")
	public String ModifyFestivals(Model model) {
		List<Festival> festivalList = festivalService.getFestivalList();
		model.addAttribute("festivalList",festivalList);
		return "admin/festival/ModifyFestival";
	}
	
	@GetMapping("/admin/festival/festivalList/{festivalId}")
	public String ModifyFestival(@PathVariable String festivalId, Model model) {
		int festivalIdInt = Integer.parseInt(festivalId);
		Festival festival = festivalService.getFestivalById(festivalIdInt);
		model.addAttribute("festival",festival);
		return "admin/festival/Festival";
	}
	@PostMapping("/admin/festival/ModifyFestival")
	public String updateFestival(@ModelAttribute Festival festival) {
	    int result = festivalService.updateFestival(festival);
	    System.out.println(festival);
	    if (result > 0) {
	    	System.out.println("성공");
	        return "redirect:/admin/festival/festivalList";
	        
	    } else {
	    	 System.out.println("실패");
	        return "admin/festival/Festival";
	    }
	}
	
	@GetMapping("/admin/festival/festivalList/removeFestival")
	public String removeFestival(HttpServletRequest request) {
		String festivalId = request.getParameter("festivalId");
		int festivalIdInt = Integer.parseInt(festivalId);
		int result = festivalService.removeFestival(festivalIdInt);
		return "redirect:/admin/festival/festivalList";
	}
	
	@GetMapping("/admin/notify")
	public String NotifyManagement(Model model) {
		return "admin/NotifyManagement";
	}
	
	@GetMapping("/admin/notifyPostList")
	public String Notify(Model model) {
		List<Posts> postList = postService.NotifyPostList();
		model.addAttribute("postList", postList);
		return "admin/notify/NotifyBoard";
	}
	
    @GetMapping("/admin/notifyUserList")
    public String NotifyUser(Model model) {
        model.addAttribute("userList", userService.NotifyUserList());
        return "admin/notify/NotifyUserBoard";
    }

    @PostMapping("/admin/resetReport")
    @ResponseBody
    public Map<String, Object> resetUser(@RequestParam("userIds") String userIds) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            System.out.println("Received userIds (raw string): " + userIds); 
            List<String> userIdList = Arrays.asList(userIds.split(",")); 

            
            System.out.println("Processed userIdList: " + userIdList);

            userService.resetReport(userIdList);
            response.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        return response;
    }

	
	@GetMapping("/admin/option")
	public String option(Model model) {
		return "admin/Option";
	}
}
