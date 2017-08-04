package com.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Artic;
import com.pojo.Remark;
import com.pojo.Replay;
import com.pojo.Tags;
import com.pojo.Words;
import com.service.IndexService;
import com.test.POP3ReceiveMailTest;
import com.util.ArchiveUtil;

import edu.emory.mathcs.backport.java.util.Collections;

@Controller
public class IndexAction {
	@Autowired
	private IndexService indexService;

	public List<ArchiveUtil> getArchive() {
		List<Artic> list3 = indexService.findArticle();
		int yearMonth[][] = new int[4000][100];
		int k = 0;
		List<ArchiveUtil> ll = new ArrayList<ArchiveUtil>();
		for (int i = 0; i < list3.size(); i++) {
			char[] ch = list3.get(i).getCreateTime().toString().toCharArray();
			int year = 0;
			int month = 0;
			for (int j = 0; j < 4; j++) {
				year = year * 10 + (ch[j] - '0');
			}
			for (int j = 5; j < 7; j++) {
				month = month * 10 + (ch[j] - '0');
			}
			yearMonth[year][month]++;
		}
		for (int i = 2014; i < 2114; i++) {
			for (int j = 1; j <= 12; j++) {

				if (yearMonth[i][j] != 0) {
					ArchiveUtil s = new ArchiveUtil();
					s.setYm(i + "年" + j + "月");
					s.setCount(yearMonth[i][j]);
					ll.add(s);
				}
			}
		}
		Collections.reverse(ll);
		return ll;

	}

	@RequestMapping("/index-{page}.html")
	public String getArticle(HttpServletRequest request,
			@PathVariable("page") String pageString, Model model) {
		int page = 1;
		int size = 6;
		String sizeString = request.getParameter("size");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		if (sizeString != null && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		// begin--查询文章，只在当前页面使用,存在request域
		Map map = indexService.pageQuery(page, size);
		model.addAttribute("map", map);
		// end--
		
		ServletContext application = request.getSession().getServletContext();
		
		// begin--查询分类以及每一类的数量
		HttpSession session = request.getSession();
		List<Object[]> category = indexService.findCategory();
		application.setAttribute("category", category);
		// end--

		// begin--查询阅读排行
		List<Artic> readCount = indexService.findTopRead();
		application.setAttribute("readCount", readCount);
		// end--

		// begin -- 查询文章存档
		List<ArchiveUtil> ll = getArchive();
		application.setAttribute("ll", ll);

		// end--

		// begin--查出最新的留言
		List<Words> words = indexService.findWords();
		application.setAttribute("words", words);
		// end--

		// begin--查出最新的评论
		List<Remark> remark = indexService.findRemark();
		application.setAttribute("remark", remark);
		// end--

		List<Tags> tags = indexService.findTags();
		Set set = new HashSet();
		List tag = new ArrayList();
		for (int i = 0; i < tags.size(); i++) {
			String x[] = tags.get(i).getName().split(",");
			for (int j = 0; j < x.length; j++) {
				set.add(x[j]);
			}
		}
		for (Object object : set) {
			tag.add(object);
		}
		application.setAttribute("tag", tag);
		return "main2";

	}

	// 根据ID去查文章的具体信息
	@RequestMapping("/index-article-detail-{id}.html")
	public String getArticleDetail(@PathVariable("id") String ID, Model model) {

		if (ID == null) {
			return "404";
		} else {
			// 文章信息
			List<Artic> article = indexService.findArticleById(ID);
			model.addAttribute("article", article);

			// 评论信息
			List<Remark> comments = indexService.findCommentsById(ID);
			model.addAttribute("comments", comments);
			int n = indexService.findCommentsCount(ID);
			model.addAttribute("n", n);
			// 回复信息
			List<Replay> replay = indexService.findAllReplay();
			model.addAttribute("replay", replay);
			model.addAttribute("id", ID);
			
			List<Artic> top=indexService.findTopArticle(ID);
			List<Artic> down=indexService.findDownArticle(ID);

			model.addAttribute("down",down);
			model.addAttribute("top",top);
			return "art2";

		}
	}
	
	
	@RequestMapping("/tags-article-{page}-{tagsname}.html")
	public String getTagsArticle(@PathVariable("tagsname") String tagsname,Model model,@PathVariable("page") String pageString,HttpServletRequest request)
	{
		int page = 1;
		int size = 6;
		String sizeString = request.getParameter("size");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		if (sizeString != null && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		Map map = indexService.findTagsArticle(page, size, tagsname);
		model.addAttribute("map", map);
		request.setAttribute("tagsname", tagsname);
		return "tags-article";
	}
	
	

	/* 添加文章的评论 */
	@RequestMapping("/index-article-detail-addcomments.ajax")
	@ResponseBody
	public String addComments(String cont, String username, String mail,
			String id) {
		if (id == null) {
			return "404";
		}

		indexService.addComments(cont, username, mail, id);
		return "success";

	}

	/* 根据分类去分页查询文章 */
	@RequestMapping("/category-article-{page}-{id}.html")
	public String getCategoryArticle(Model model,
			@PathVariable("page") String pageString,
			@PathVariable("id") String id, HttpServletRequest request) {
		int page = 1;
		int size = 6;
		String sizeString = request.getParameter("size");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		if (sizeString != null && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		System.out.println(page + "//" + id);
		Map map = indexService.findCategoryArticle(page, size, id);
		model.addAttribute("map", map);
		request.setAttribute("catid", id);
		return "category-article2";

	}

	/**
	 * 
	 * @param pageString
	 * @param request
	 * @param time
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/archive-{page}/{ym}")
	public String getArchiveArticle(@PathVariable("page") String pageString,
			HttpServletRequest request, @PathVariable("ym") String time)
			throws UnsupportedEncodingException {
		int page = 1;
		int size = 6;
		String sizeString = request.getParameter("size");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		if (sizeString != null && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		String year = time.substring(0, 4);
		String month = time.substring(5, 6);
		if (Integer.parseInt(month) < 10) {
			month = "0" + month;
		}
		String Time = year + "-" + month;
		Map map = indexService.selectArticleByTime(page, size, Time);
		request.setAttribute("map", map);
		request.setAttribute("ym", time);
		return "archive-article2";
	}
	
	
	@RequestMapping("/sendemail.ajax")
	@ResponseBody
	public String sendEmail(String username,String mail,String cont)
	{
		System.out.println(username+"-"+mail+"-"+cont);
		
		
		return null;
		
	}

}
