package com.ssm.service;


import java.util.List;

import com.ssm.pojo.User;

public interface UserService {
	 public User getUserById(int userId);
	 public User getUser();
	 public int insert(User user);
	 public List<User> getUser2();
}
