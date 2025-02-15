package com.app.service.user;

import java.util.List;

import com.app.dto.user.User;

public interface UserService {
	List<User> getUserList();
	
	User getUserById(String userId);
	
	int modifyUser(User user);
	
	List<User> NotifyUserList();
	
	void resetReport(List<String> userIds); // 여러 개 처리 가능하도록 수정
	
}
