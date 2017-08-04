package com.action.background;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Remark;
import com.pojo.Replay;
import com.service.background.RemarkService;
import com.util.MailUtil;

@Controller
public class RemarkAction {
	@Autowired
	private RemarkService remarkService;
	@Autowired
	private HttpServletRequest request;
	
	@Resource(name="threadPool")
	private TaskExecutor taskExecutor;
	
	@RequestMapping("/remark.html")
	public String getRemark() {
		List<Remark> list = remarkService.findComments();
		List<Replay> list2 = remarkService.findReply();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		return "background/comments";

	}
	@RequestMapping("/remark-like.html")
	public String remarkLike(String status,String logmin,String logmax,String keywords)
	{
		List<Remark>  list=remarkService.LikeSearch(status,logmin,logmax,keywords);
		
		
		List<Replay> list2 = remarkService.findReply();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		return "background/comments";
		
	}
	
	

	// 获取评论的ID，跳转到回复评论子界面
	@RequestMapping("getid-{id}-getmail-{mail}")
	public String getRemarkId(@PathVariable("id") String id,@PathVariable("mail") String mail) {
		request.setAttribute("id", id);
		request.setAttribute("mail", mail);
		return "background/comments-reply";

	}
	//回复评论的AJAX
	@RequestMapping("/addCommentsReply.ajax")
	@ResponseBody
	public String addCommentsReply() throws MessagingException, GeneralSecurityException {
		String id = request.getParameter("ID");
		String text = request.getParameter("text");
		String username = "博主彭江毅(回复)";
		final String mail=request.getParameter("mail");
		remarkService.addCommentReply(id, text, username);
		
		taskExecutor.execute(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					MailUtil.sendEmail(mail);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (GeneralSecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
		
		return "success";
	}
	
	
	@RequestMapping("/deleteCommentById.html")
	@ResponseBody
	public String deleteCommentsById(){
		String id=request.getParameter("ID");
		//查看是否存在二级回复
		List<Replay> list=remarkService.checkComments(id);
		
		if(list.size()==0)
		{
		remarkService.deleteCommentById(id);
			return "success";
		}
		else{

			return "false";
		}
		
}
	@RequestMapping("/deleteCommentALL.ajax")
	@ResponseBody
	public String deleteCommentReplayALL(@RequestParam("list") int list[])
	{
		remarkService.deleteCommentReplayALL(list);
		return "success";
	}
	
	

	
	
	
}
