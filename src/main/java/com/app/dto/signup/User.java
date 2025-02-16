package com.app.dto.signup;

import lombok.Data;

@Data
public class User {

	private String userId; //   유저 아이디 pk
    private String userName; // 유저 이름
    private String nickName; // 유저 닉네임
    private String pw;		//  유저 비밀번호
    private String email;	//  유저 이메일 
    private String tel;		// 	유저 전화번호
    private String jumin;	// 	유저 주민등록번호
    private String userType;// 	유저 타입
    private String report; // 신고
}
