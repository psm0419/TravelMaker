package com.app.controller.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.signup.User;
import com.app.service.signup.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	@GetMapping("user/login")
	public String loginPage() {
		
		return"login/login";
	}
	
	@ResponseBody
	@PostMapping(value = "user/login", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String login(@RequestBody Map<String, String> loginInfo, HttpSession session) {
//		 System.out.println(user);
		 
		 
		String userId = loginInfo.get("userId");
        String userPw = loginInfo.get("pw");
        
        System.out.println(userId);
        System.out.println(userPw);
      
        
        User user = userService.getUser(userId);

        if (user == null) { //유저가 존재 하지 않을 경우
            return "아이디가 존재하지 않습니다.";
        }

        // 비밀번호 검증 (암호화 없이 일반 비교)
        if (!userPw.equals(user.getPw())) { //매개변수 입력된 유저 비밀번호와 비교
            return "비밀번호가 틀렸습니다.";
        }

        // 로그인 성공 → 세션 저장
//        session.setAttribute("loggedInUser", user.getUserId());
//        session.setAttribute("loggedInUserType", user.getUserType());
//        session.setAttribute("loggedInNickName", user.getNickName());
          session.setAttribute("loggedInUser", user);
        return "로그인 성공!";
		
	}
	
	 
	@PostMapping("user/logout")
	public ResponseEntity<String> logout(HttpSession session) {
	    session.invalidate();
	    return ResponseEntity.ok().body("로그아웃 성공");
	}
	
}
