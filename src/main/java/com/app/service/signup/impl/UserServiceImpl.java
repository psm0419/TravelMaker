package com.app.service.signup.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.signup.UserDAO;
import com.app.dto.signup.User;
import com.app.service.signup.UserService;

@Service
public class UserServiceImpl implements UserService{

	 @Autowired
	    UserDAO userDAO;
	
	@Override
	public int registerUser(User user) { //유저 등록
		return userDAO.insertUser(user);
	}

	@Override
	public User getUser(String userId) {
		 return userDAO.getUserById(userId);
	}

	@Override
	public int modifyUser(User user) {
		return userDAO.updateUser(user);
	}

	@Override
	public int removeUser(String userId) {
		 return userDAO.deleteUser(userId);
	}

	@Override
	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

}
