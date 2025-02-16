package com.app.controller.email;

import java.util.Map;
import java.util.Objects;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.service.signup.MailService;

@Controller
@RequestMapping("/user")
public class EmailSendController {

	  private MailService mailService;

	    @Autowired
//	    public UserController(MailService mailService) {
//	        this.mailService = mailService;
//	    }
	    public void setMailService(MailService mailService) {
	        this.mailService = mailService;
	    }

	    // 1️ 이메일 인증 코드 발송
	    @PostMapping("/sendVerificationEmail")
	    @ResponseBody
	    public String sendVerificationEmail(@RequestBody Map<String, String> request, HttpSession session) {
	        String email = request.get("email");

	        // 인증 코드 발송 및 저장
	        //랜덤 6자리 인증코드 생성
	        String verificationCode = String.format("%06d", new Random().nextInt(1000000));
	        
	        session.setAttribute("emailVerificationCode", verificationCode);
	        
	        //세션에 인증 코드 및 만료시간 저장
	        // 만료 시간 (3분 후)
	        long expirationTime = System.currentTimeMillis() + (3 * 60 * 1000);
	        session.setAttribute("emailVerificationExpiration", expirationTime);

	        // 비동기 메일 전송
	     // 콘솔에 인증 코드 출력 (테스트용)
	        System.out.println("발송된 인증 코드: " + verificationCode);
	        mailService.sendVerificationEmail(email, verificationCode);

	        return "이메일이 발송되었습니다. (3분 이내 입력)";
	    }

	    // 2️ 이메일 인증 코드 확인
	    @PostMapping("/verifyEmail")
	    @ResponseBody
	    public String verifyEmail(@RequestBody Map<String, String> request, HttpSession session) {
	      
	    	String inputCode = request.get("code");
	       
	    	String sessionCode = (String) session.getAttribute("emailVerificationCode");
	        Long expirationTime = (Long) session.getAttribute("emailVerificationExpiration");

	        System.out.println("사용자가 입력한 코드: " + inputCode);
	        System.out.println("세션에 저장된 코드: " + sessionCode);
	        
	        
	        if (sessionCode == null || expirationTime == null || System.currentTimeMillis() > expirationTime) {
	            session.invalidate(); // 세션 초기화
	            return "인증 코드가 만료되었습니다. 다시 요청하세요.";
	        }

	        if (Objects.equals(sessionCode.trim(), inputCode.trim())) {
	            session.invalidate();
	            return "인증 성공!";
	        } else {
	            return "인증 코드가 올바르지 않습니다.";
	        }
	    }
}
