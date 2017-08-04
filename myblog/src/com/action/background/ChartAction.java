package com.action.background;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChartAction {
	
	@RequestMapping("/chart-1.html")
	public String chart()
	{
		
		
		return "background/chart-1";
	}
	
	
}
