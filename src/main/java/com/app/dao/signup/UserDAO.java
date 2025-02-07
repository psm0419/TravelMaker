package com.app.dao.signup;

import java.util.List;

import com.app.dto.signup.User;

public interface UserDAO {

	int insertUser(User user);   // 회원가입
    User getUserById(String userId); // 사용자 조회
    int updateUser(User user);   // 정보 수정
    int deleteUser(String userId);  // 회원 삭제
    List<User> getAllUsers();    // 전체 회원 조회
	
}
