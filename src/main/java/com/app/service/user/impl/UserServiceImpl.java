package com.app.service.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.user.UserDAO;
import com.app.dto.user.User;
import com.app.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<User> getUserList() {
	    List<User> userList = userDAO.getUserList();
	    return userList;
	}

	@Override
	public User getUserById(String userId) {
		return userDAO.getUserById(userId);
	}

	@Override
	public int modifyUser(User user) {
		int result = userDAO.modifyUser(user);
		return result;
	}

	@Override
	public List<User> NotifyUserList() {
		List<User> userList = userDAO.NotifyUserList();
		return userList;
	}
	
	@Override
	public void resetReport(List<String> userIds) {
	    userDAO.resetReport(userIds); // 여러 개의 userId를 DAO로 전달
	}
}
