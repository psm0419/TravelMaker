package com.app.service.signup;

import java.util.List;

import com.app.dto.signup.User;

public interface UserService {

	int registerUser(User user);
    User getUser(String userId);
    int modifyUser(User user);
    int removeUser(String userId);
    List<User> getAllUsers();
}
