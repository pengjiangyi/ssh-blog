package com.ssm.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.test.TestMyBatis;


@Controller
@RequestMapping("/user")
public class UserController {
	
	private static Logger logger = Logger.getLogger(UserController.class);
	
	@Resource
	private UserService userservice;
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
		//User user=userservice.getUser();
		
		/*List<User> list=userservice.getUser2();
		System.out.println(list.size());*/
		//model.addAttribute("user",user);
		//logger.info(user);
		return "showUser";
	}
}
