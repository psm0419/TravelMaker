package com.app.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.user.User;
import com.app.service.user.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;
	
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
	
	@PostMapping()
	public String bannedUser() {
		return "redirect:/admin/user/{userId}";
	}
	
	@GetMapping("/admin/content")
	public String contentManagement(Model model) {
		return "admin/ContentManagement";
	}
	
	@GetMapping("/admin/festival")
	public String festivalManagement(Model model) {
		return "admin/FestivalManagement";
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
