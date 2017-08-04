package com.action.background;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Replay;
import com.service.background.ReplyService;

@Controller
public class ReplyAction {
	@Autowired
	private ReplyService commentsService;
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/findCommentsReplay.html")
	public String findCommentsReplay() {
		List<Replay> list = commentsService.findCommentsReplay();
		request.setAttribute("list", list);
		return "background/commentsReplay";
	}
	
	
	
	@RequestMapping("/updateCommentsReplay-{id}-{text}.html")
	public String updateCommentsReplay(@PathVariable("id") String id,@PathVariable("text") String text) throws UnsupportedEncodingException
	{
		request.setAttribute("id", id);
		request.setAttribute("text", text);
		return "background/commentsReplay-update";
		
	}
	
	@RequestMapping("/updateCommentsReplyById.ajax")
	@ResponseBody
	public String updateCommentsReplyById() throws UnsupportedEncodingException{
		String id=request.getParameter("ID");
		String text=request.getParameter("text");
		commentsService.updateCommentsReplyById(id,text);
		return "success";
	}
	
	@RequestMapping("/deleteCommentsReplayById.ajax")
	@ResponseBody
	public String deleteCommentsReplayById()
	{
		String id=request.getParameter("ID");
		commentsService.deleteCommentsReplayById(id);
		return "success";
		
	}
	
	
	@RequestMapping("/deleteCommentsReplayALL.ajax")
	@ResponseBody
	public String deleteCommentsReplayALL(@RequestParam("list") int list[],@RequestParam("list2") int list2[])
	{
		
		commentsService.deleteCommentsReplayALL(list,list2);
		return "success";
		
		
		
	}
	
	
	
	
	
	
	

}
