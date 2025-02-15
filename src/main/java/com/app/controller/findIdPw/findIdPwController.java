package com.app.controller.findIdPw;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.signup.User;
import com.app.service.signup.MailService;
import com.app.service.signup.UserService;

@Controller
public class findIdPwController {
	
	private MailService mailService;
	
	@Autowired
	UserService userService;
	
	 @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
	    }
	
	//아이디 비밀번호 찾기 버튼
	@GetMapping("/user/findIdPw")
	public String findIdPw() {
		//아이디 비밀번호 찾기 버튼 홈페이지
		return"findIdPw/findIdPw";
	}
	
	//아이디 찾기
	@GetMapping("/user/findId")
	public String findId() {
		// 아이디 찾기 홈페이지
		return"findIdPw/findId";
	}
	
	//아이디 찾기 포스트 매핑
	@ResponseBody
	@PostMapping("/user/findId")
	public String findIdAction(@RequestBody Map<String, String> findIdinfo){
		
		String userJumin = findIdinfo.get("findIdForJumin");
		String userEmail = findIdinfo.get("findIdForEmail");
		
		  System.out.println(userJumin);
	      System.out.println(userEmail);
	      
	      User userjumin = userService.getUserForJumin(userJumin);
	      User useremail = userService.getUserForEmain(userEmail);
	      
	      if(userjumin == null) { //주민등록 번호가 null 일 경우
	    	  return "가입되지 않은 회원입니다.";
	      }
	      
	      if(useremail == null) { //이메일이 null 일 경우
	    	  return "해당 이메일이 존재하지 않습니다.";
	      }
		
		     System.out.println(userjumin.getUserId());
		      mailService.sendIdEmail(userEmail, userjumin.getUserId());
		      
	        return "이메일로 아이디가 발송 되었습니다.";
	}
	
	//비밀번호 찾기
	@GetMapping("/user/findPw")
	public String findPw() {
		// 비밀번호 찾기 홈페이지
		return"findIdPw/findPw";
	}
	
	//비밀번호 찾기 매핑
	@ResponseBody
	@PostMapping("/user/findPw")
	public String findPwAction(@RequestBody Map<String, String> findPwinfo){
		
		String userId = findPwinfo.get("findPwForId");
		String userJumin = findPwinfo.get("findPwForJumin");
		String userEmail = findPwinfo.get("findPwForEmail");
		
		// 요청 데이터 출력
	    System.out.println("아이디: " + userId);
	    System.out.println("주민등록번호: " + userJumin);
	    System.out.println("이메일: " + userEmail);
	      
	    //유저 정보 조회
	    User userid = userService.getUser(userId);
	    User userjumin = userService.getUserForJumin(userJumin);
	    User useremail = userService.getUserForEmain(userEmail);
	      
	      if(userid == null) {
	    	  return "아이디를 확인하세요.";
	      }
	      
	      if(userjumin == null) { //주민등록 번호가 null 일 경우
	    	  return "가입되지 않은 회원입니다.";
	      }
	      
	      if(useremail == null) { //이메일이 null 일 경우
	    	  return "해당 이메일이 존재하지 않습니다.";
	      }
		
		     System.out.println("비밀번호: " + userid.getPw());
		      mailService.sendPwEmail(userEmail, userid.getPw());
		      
	        return "비밀번호가 해당 이메일로 발송 되었습니다.";
	}
}
