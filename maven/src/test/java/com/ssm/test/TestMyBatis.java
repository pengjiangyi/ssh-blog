package com.ssm.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.service.impl.UserServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestMyBatis {
   
    
	@Resource
    private UserService userService;;
	
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
	
   

    @Test
    public void test() {
        // System.out.println(user.getUserName());
    	User user=userService.getUser();
         logger.info("值："+JSON.toJSONString(user));
 
    }
}