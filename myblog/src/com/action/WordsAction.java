package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.WordsReplay;
import com.service.WordsService;
import com.util.IpUtil;

@Controller
public class WordsAction {
@Autowired
private WordsService wordsService;
	
	@RequestMapping("/words-{page}.html")
	public String getWords(HttpServletRequest request,
			@PathVariable("page") String pageString, Model model)
	{
		int page = 1;
		int size = 12;
		String sizeString = request.getParameter("size");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		if (sizeString != null && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		Map map=wordsService.findWords(page,size);
		List<WordsReplay>  list2=wordsService.findWordsReply();
		model.addAttribute("map",map);
		model.addAttribute("list2", list2);
		
		
		return "words";
	}
	
	/*添加留言*/
	@RequestMapping("/addWords.ajax")
	@ResponseBody
	public String addComments(String cont,String username,String mail,HttpServletRequest request)
	{
		wordsService.addWords(cont,username,mail);
		  // System.out.println("getClientIpAddress:"+IpUtil.getClientIpAddr(request));
		return "words";
	}
	
	
	
}
