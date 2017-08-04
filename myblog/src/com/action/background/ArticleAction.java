package com.action.background;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.baidu.ueditor.ActionEnter;
import com.baidu.ueditor.define.ActionMap;
import com.pojo.Artic;
import com.pojo.Categories;
import com.pojo.Remark;
import com.service.background.ArticleService;

@Controller
public class ArticleAction {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private HttpServletRequest request;

	// 查询所有的文章
	@RequestMapping("/article.html")
	public String findArticle() {
		List<Artic> list = articleService.findArticle();
		HttpSession session = request.getSession();
		session.setAttribute("list", list);

		List<Categories> list2 = articleService.findCategory();
		request.setAttribute("list2", list2);

		return "background/art";
	}

	@RequestMapping("/searchArticle-like.html")
	public String searchArticleLike(String logmax, String logmin,
			String article, String status) {
		System.out
				.println(logmax + "-" + logmin + "-" + status + "-" + article);

		List<Artic> list = articleService.likeSearch(logmin, logmax, status,
				article);
		request.setAttribute("list", list);

		List<Categories> list2 = articleService.findCategory();
		request.setAttribute("list2", list2);
		return "background/art";

	}

	// 根据ID查询出文章的内容
	@RequestMapping("/updateArticle-{id}.html")
	public String toUpdateArticle(@PathVariable("id") String id) {
		List<Artic> list = articleService.findArticleById(id);
		request.setAttribute("list", list);
		List<Categories> list2 = articleService.findCategory();
		request.setAttribute("list2", list2);
		return "/background/article-update";

	}

	// 更新按钮的事件
	@RequestMapping("/updateArticle.html")
	public String updateArticle() throws UnsupportedEncodingException {
		String content = request.getParameter("editorValue");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String tags = request.getParameter("tags");
		/*
		 * System.out.println("content:" + content + "\n" + "title" + title +
		 * "\n" + "category" + category + "\n" + "tags" + tags + id);
		 */
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String Time = sdf.format(time);
		articleService.update(title, category, tags, content, Time, id);
		return "redirect:/article.html";

	}

	/**
	 * 
	 * @param file
	 *            前台接收的文件
	 * @param editorValue
	 *            文章内容
	 * @param title
	 *            文章标题
	 * @param category
	 *            文章分类
	 * @param tags
	 *            文章标签
	 * @return 返回文章网页
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/uploadArticle.html")
	public String uploadArticle(@RequestParam("file") MultipartFile file,
			String editorValue, String title, String category, String tags)
			throws IOException, ServletException {
		/*CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		commonsMultipartResolver.setDefaultEncoding("utf-8");
		MultipartHttpServletRequest multipartRequest = commonsMultipartResolver
				.resolveMultipart(request);*/
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String Time = sdf.format(time);
		String path = request.getSession().getServletContext()
				.getRealPath("/img"); // 获取项目的根路径，比如我的就是www.pengjiangyi.com/img
		String fileName = file.getOriginalFilename();// 获取你上传文件的初始文件名
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String imgPath = request.getContextPath() + "/img/" + fileName;// 获取图片的路径，存入数据库的路径
		// 最好用UUID避免文件会重复覆盖
		articleService
				.upload(title, category, tags, editorValue, Time, imgPath);

		return "redirect:/article.html";

	}

	// 查出所有的分类，显示在文章查询中
	@RequestMapping("/selectArticle.html")
	public String selectCategory() {
		List<Categories> list = articleService.selectCategory();
		request.setAttribute("list", list);
		return "background/article-add";
	}

	@RequestMapping("/deleteArticleById.html")
	@ResponseBody
	public String deleteArticleById() {
		String id = request.getParameter("ID");
		List<Remark> list = articleService.checkDelete(id);
		if (list.size() == 0) {
			articleService.deleteArticleById(id);
			return "success";

		} else
			return "error";

	}

}
