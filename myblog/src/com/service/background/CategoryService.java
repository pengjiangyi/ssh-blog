package com.service.background;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CategoriesDAO;
import com.dao.HqlDAO;
import com.pojo.Categories;
@Service
public class CategoryService {
@Autowired
private HqlDAO hqlDAO;
@Autowired
private CategoriesDAO categoriesDAO;
	public List<Categories> findCategory() {
		String hql="from Categories";
		List<Categories> list=hqlDAO.findByHQL(hql);
		return list;
	}
	public void addCategory(String name) {
		Categories categories=new Categories();
		categories.setName(name);
		categoriesDAO.save(categories);
		
	}
}
