package com.app.dao.user;

import java.util.List;

import com.app.dto.user.User;

public interface UserDAO {

	List<User> getUserList();
	
	User getUserById(String userId);
	
	int modifyUser(User user);
	
}