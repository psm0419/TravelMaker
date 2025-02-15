package com.app.service.user;

import java.util.List;

import com.app.dto.user.User;

public interface UserService {
	List<User> getUserList();
	
	User getUserById(String userId);
	
	int modifyUser(User user);
}