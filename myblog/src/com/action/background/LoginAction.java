package com.action.background;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.User;
import com.service.background.LoginService;

@Controller
public class LoginAction {

	
	
@Autowired
private LoginService loginService;
	
	@RequestMapping("/login.ajax")
	public String login(String username,String password)
	{
	 List<User>  list=loginService.checkLogin(username,password);
	 if(list.size()==0||list==null)
		 return "redirect:login.jsp";
	 else
	return "background/index";
	}
}
