package com.app.dao.signup.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.signup.UserDAO;
import com.app.dto.signup.User;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired			
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertUser(User user) {
		
		int result = sqlSessionTemplate.insert("user_mapper.insertUser", user);
		
		return result;
	}

	@Override
	public User getUserById(String userId) {
		
		User user = sqlSessionTemplate.selectOne("user_mapper.getUserById", userId); 
		
		return user;
	}

	@Override
	public int updateUser(User user) {
		
		int result = sqlSessionTemplate.update("user_mapper.updateUser",user);

		return result;
	}

	@Override
	public int deleteUser(String userId) {
	
		int result = sqlSessionTemplate.delete("user_mapper.deleteUser",userId);
		return result;
	}

	@Override
	public List<User> getAllUsers() {
	
	List<User> userList = sqlSessionTemplate.selectList("user_mapper.getAllUsers");
			return userList;
	}
	
}
