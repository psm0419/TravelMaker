package com.app.dao.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.user.UserDAO;
import com.app.dto.user.User;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
    @Override
    public List<User> getUserList() {
        List<User> userList = sqlSessionTemplate.selectList("user_mapper.getUserLists");
        return userList;
    }

	@Override
	public User getUserById(String userId) {
		return sqlSessionTemplate.selectOne("user_mapper.getUserByIds",userId);
	}

	@Override
	public int modifyUser(User user) {
		int result = sqlSessionTemplate.update("user_mapper.modifyUser",user);
		return result;
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
