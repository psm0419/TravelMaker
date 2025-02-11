package com.app.dto.user;

import lombok.Data;

@Data
public class User {
	
	String userId;  //유저아이디
	String userName; //유저실명
	String nickName; //유저닉네임
	String pw;		//유저 비번
	String email;	//유저 이메일
	String tel;		//유저 폰번
	String jumin;	//유저 주번
	String userType; //유저 타입 (cus,adm)

}
