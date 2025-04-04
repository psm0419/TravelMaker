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
	
	List<User> userList = sqlSessionTemplate.selectList("user_mapper.getUserList");
			return userList;
	}

	@Override
	public User getUserByNickName(String nickName) {
		User user = sqlSessionTemplate.selectOne("user_mapper.getUserByNickname", nickName);
		return user;
	}

	@Override
	public User getUserByJumin(String jumin) {
		User user = sqlSessionTemplate.selectOne("user_mapper.getUserByJumin", jumin);
		return user;
	}

	@Override
	public User getUserByTel(String tel) {
		User user = sqlSessionTemplate.selectOne("user_mapper.getUserByTel", tel);
		return user;
	}

	@Override
	public User getUserByEmail(String email) {
		User user = sqlSessionTemplate.selectOne("user_mapper.getUserByEmail", email);
		return user;
	}

	@Override
	public User getUserByPw(String pw) {
		User user = sqlSessionTemplate.selectOne("user_mapper.getUserByPw", pw);
		return user;
	}

	@Override
	public List<User> NotifyUserList() {
		List<User> userList = sqlSessionTemplate.selectList("user_mapper.getNotifyUserList");
		return userList;
	}

	@Override
	public void resetReport(List<String> userIds) {
	    sqlSessionTemplate.update("user_mapper.resetReport", userIds);
	}
	
}
