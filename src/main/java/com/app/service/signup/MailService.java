package com.app.service.signup;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailService {
    private JavaMailSender mailSender;

    // Setter 주입 방식
    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    // 비동기 방식으로 이메일 발송
    @Async
    public void sendVerificationEmail(String email, String code) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("이메일 인증 코드");
        message.setText("이메일 인증 코드: " + code + " (3분 이내 입력)");
        mailSender.send(message);
    }
}
