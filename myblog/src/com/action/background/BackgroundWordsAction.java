package com.action.background;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Words;
import com.pojo.WordsReplay;
import com.service.background.BackgroundWordsService;
import com.util.JsonFilter;
import com.util.MailUtil;

/*author:pjy
 time:2017-6-25
 phone:15673305382*/
@Controller
public class BackgroundWordsAction {
	@Autowired
	private BackgroundWordsService wordsService;
	@Autowired
	private HttpServletRequest request;

	@Resource(name = "threadPool")
	private TaskExecutor taskExecutor;

	/* 找出所有的留言 */
	@RequestMapping("/findWords.html")
	public String findWords() {
		// 查出留言表的数据
		List<Words> list = wordsService.findWords();
		// 查出留言回复表的数据
		List<WordsReplay> list2 = wordsService.findWordsReplay();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		return "background/words";
	}

	@RequestMapping("/findWords-like.html")
	public String findWordsLike(String status, String logmin, String logmax,
			String keywords) {
		// 查出留言表的数据
		List<Words> list = wordsService.findWordsLikeSearch(status, logmin,
				logmax, keywords);
		// 查出留言回复表的数据
		List<WordsReplay> list2 = wordsService.findWordsReplay();
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		return "background/words";
	}

	/* 根据ID来删除留言 通过Ajax返回判断 */
	@RequestMapping("/deleteWordsById.ajax")
	@ResponseBody
	public String deleteWordsById() {
		String id = request.getParameter("ID");
		// 检查是否存在回复
		List<WordsReplay> list = wordsService.checkReplay(id);
		if (list.size() == 0) {
			wordsService.deleteWordsById(id);
			// 进行删除
			return "success";
		} else
			return "false";

	}

	@RequestMapping("/deleteWordsall.ajax")
	@ResponseBody
	public String deleteWordsall() {
		String array = request.getParameter("arr");

		String str[] = array.split(",");
		String data[] = new String[str.length];
		for (int i = 0; i < str.length - 1; i++) {
			data[i] = str[i].substring(1, str[i].length() - 1);
		}
		data[0] = str[0].substring(2, str[0].length() - 1);
		if (str.length == 1) {
			data[0] = str[0].substring(2, str[0].length() - 2);
		} else if (str.length == 2) {
			data[0] = str[0].substring(2, str[0].length() - 1);
			data[1] = str[1].substring(1, str[1].length() - 2);
		} else
			data[str.length - 1] = str[str.length - 1].substring(1,
					str[str.length - 1].length() - 2);
		wordsService.deleteALL(data);
		return "success";

	}

	/* 回复留言 只起到一个传递ID的作用 */
	@RequestMapping("/wordsReplay-{id}-{mail}.html")
	public String wordsReplay(@PathVariable("id") String id,
			@PathVariable("mail") String mail) {
		request.setAttribute("id", id);
		request.setAttribute("mail", mail);
		return "background/words-reply";

	}

	// 回复留言模块
	@RequestMapping("/addWordsReply.ajax")
	@ResponseBody
	public String addWordsReply() throws MessagingException,
			GeneralSecurityException {
		String id = request.getParameter("ID");
		String text = request.getParameter("text");
		String username = "博主彭江毅(回复)";
		wordsService.addWordsReply(id, text, username);
		final String mail = request.getParameter("mail");
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

	/* 查询我的留言回复进行操作 */
	@RequestMapping("/findWordsReplay.html")
	public String findWordsReplay() {
		List<WordsReplay> list = wordsService.findWordsReplay();
		request.setAttribute("list", list);
		return "background/wordsReplay";

	}

	/* 修改我的回复内容 传值 */
	@RequestMapping("/updateWordsReplay-{id}-{text}.html")
	public String updateWordsReplay(@PathVariable("id") String id,
			@PathVariable String text) throws UnsupportedEncodingException {
		request.setAttribute("id", id);
		request.setAttribute("text", text);
		return "background/wordsReplay-update";
	}

	/* 根据ID来更新 */
	@RequestMapping("/updateWordsReplyById.ajax")
	@ResponseBody
	public String updateWordsReplyById() throws UnsupportedEncodingException {
		String id = request.getParameter("ID");
		String text = request.getParameter("text");
		wordsService.updateWordsReplay(id, text);
		return "success";
	}

	@RequestMapping("/deleteWordsReplayById.ajax")
	@ResponseBody
	public String deleteWordsReplayById() {
		String id = request.getParameter("ID");
		String wordid = request.getParameter("Wordid");
		wordsService.deleteWordsReplayById(id, wordid);
		return "success";

	}

	/**
	 * 
	 * @param list
	 *            获取的回复留言的ID
	 * @param list2
	 *            获取的留言id
	 * @return 批量删除留言回复
	 */
	@RequestMapping("/deleteWordsReplayALL.ajax")
	@ResponseBody
	public String deleteWordsReplayALL(
			@RequestParam(value = "list") int list[],
			@RequestParam("list2") int list2[]) {
		wordsService.deleteWordsReplayALL(list, list2);

		return "success";
	}

}
