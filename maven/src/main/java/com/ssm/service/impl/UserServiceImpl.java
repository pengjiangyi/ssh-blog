package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.dao.UserMapper;
import com.ssm.pojo.User;
import com.ssm.service.UserService;


@Service
public class UserServiceImpl implements UserService{
	@Resource
    private UserMapper userDao;
	public User getUserById(int userId) {
	 return this.userDao.selectByPrimaryKey(userId);
	}

	@Override
	public User getUser() {
		return this.userDao.getUser();
	}

	@Override
	public int insert(User user) {
		
		return this.userDao.insert(user);
	}

	@Override
	public List<User> getUser2() {
		return this.userDao.getUser2();
	}
	

	
	
	
	
}
