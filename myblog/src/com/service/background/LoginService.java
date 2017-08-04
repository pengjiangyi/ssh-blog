package com.service.background;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.User;

@Service
public class LoginService {

	@Autowired
	private HqlDAO hqlDAO;
	
	public List<User> checkLogin(String username, String password) {
		String hql="from User where username=? and password=?";
		List<User>  list=hqlDAO.findByHQL(hql, username,password);
		return list;
		
	}

}
