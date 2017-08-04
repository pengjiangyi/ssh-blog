package com.action.background;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Categories;
import com.service.background.CategoryService;

@Controller
public class CategoryAction {
@Autowired
private CategoryService categoryService;
@Autowired
private HttpServletRequest request;




@RequestMapping("/category.html")
public String findCategory() {
	List<Categories> list = categoryService.findCategory();
	request.setAttribute("list", list);
	return "background/category";
}

@RequestMapping("/addCategory.ajax")
@ResponseBody
public String addCategory() {
	String name = request.getParameter("name");
	categoryService.addCategory(name);
	return "success";
}


@RequestMapping("/category-add.html")
public String category() {
	System.out.println("213");
	return "background/category-add";
}

 	











}
