package com.app.service.signup.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.signup.UserDAO;
import com.app.dto.signup.User;
import com.app.service.signup.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public int registerUser(User user) { // 유저 등록
		return userDAO.insertUser(user);
	}

	@Override
	public User getUser(String userId) { 
		return userDAO.getUserById(userId);
	}
	
	public User getUserForJumin(String userJumin) { 
		return userDAO.getUserByJumin(userJumin);
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

	@Override
	public boolean isDuplicatedId(String id) {

		// 아이디 중복체크

		User user = userDAO.getUserById(id);

		if (user == null) { // 객체가 없다 -> 중복X
			return false;
		} else { // 해당 아이디와 동일한 객체가 있다 -> 중복 O
			return true;
		}
	}

	public boolean isDuplicatedNick(String nickName) {

		// 닉네임 중복체크
		User user = userDAO.getUserByNickName(nickName);
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean isDuplicatedJumin(String jumin) {
		// 주민등록번호 로 조회 중복체크
		User user = userDAO.getUserByJumin(jumin);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean isDuplicatedTel(String tel) {
		// 전화번호로 조회 중복체크
		User user = userDAO.getUserByTel(tel);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean isDuplicatedEmail(String email) {
		// 이메일로 조회 중복체크
		User user = userDAO.getUserByEmail(email);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public boolean isDuplicatedPw(String pw) {
		// 이메일로 조회 중복체크
		User user = userDAO.getUserByEmail(pw);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public User getUserForEmain(String userEmail) {
		return userDAO.getUserByEmail(userEmail);
	}

}
