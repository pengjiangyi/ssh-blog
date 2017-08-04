package com.service.background;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jruby.compiler.ir.operands.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ArticDAO;
import com.dao.CategoriesDAO;
import com.dao.HqlDAO;
import com.dao.TagsDAO;
import com.pojo.Artic;
import com.pojo.Categories;
import com.pojo.Remark;
import com.pojo.Tags;
@Service
public class ArticleService {
@Autowired
private ArticDAO articDAO;
@Autowired
private HqlDAO hqlDAO;
@Autowired
private TagsDAO tagsDAO;
@Autowired
private CategoriesDAO categoriesDAO;
public List<Artic> findArticle() {
	String hql="from Artic";
	List<Artic> list=hqlDAO.findByHQL(hql);
	return list;
}
public List<Artic> findArticleById(String id) {
	String hql="from Artic where id=?";
	List<Artic>  list=hqlDAO.findByHQL(hql, Integer.parseInt(id));
	return list;
}
public List<Categories> findCategory() {
	List<Categories>  list=hqlDAO.findByHQL("from Categories");
	return list;
}
public void upload(String title, String category, String tag,
		String content, String Time, String imgpath) {
	Artic artic=new Artic();
	artic.setContent(content);
	artic.setTitle(title);
	artic.setCreateTime(Timestamp.valueOf(Time));
	artic.setImgPath(imgpath);
	artic.setReadcount(0);
	Calendar c = Calendar.getInstance();
	c.setTime(new Date());
	int year=c.get(Calendar.YEAR);
	int month=c.get(Calendar.MONTH);
	artic.setCreateYear(String.valueOf(year));
	artic.setCreateMonth(String.valueOf(month));
	List<Categories> list=categoriesDAO.findByName(category);
	Categories categories=list.get(0);
	Tags tags=new Tags();
	tags.setName(tag);
	tagsDAO.save(tags);
	artic.setCategories(categories);
	artic.setTags(tags);
	articDAO.save(artic);		
	// TODO Auto-generated method stub
	
}
public void update(String title, String category, String tag,
		String content, String time, String id) {
	Artic artic=articDAO.findById(Integer.parseInt(id));
	artic.setContent(content);
	artic.setTitle(title);
	artic.setUpdateTime(Timestamp.valueOf(time));
	List<Categories> list=categoriesDAO.findByName(category);
	Categories categories=list.get(0);		
	//Tags tags=(Tags) tagsDAO.findByName(tag).get(0);
	//tags.setName(tag);
	//tagsDAO.merge(tags);
	artic.setCategories(categories);
	//artic.setTags(tag);
	articDAO.merge(artic);
	
}
	public List<Categories> selectCategory() {
		String hql="from Categories";
		List<Categories> list=hqlDAO.findByHQL(hql);
		return list;
	}
	public List<Remark> checkDelete(String id) {
		List<Remark> list=hqlDAO.findByHQL("from Remark where artic.id=?", Integer.parseInt(id));
		return list;
	}
	public void deleteArticleById(String id) {
		Artic artic=articDAO.findById(Integer.parseInt(id));
		
	
		
		articDAO.delete(artic);
	}
	public List<Artic> likeSearch(String logmin, String logmax, String status,
			String article) {

		StringBuffer sb=new StringBuffer();
		List list=new ArrayList();
		String hql="from Artic where 1=1";
		if(!status.equals("-1")&&status.trim().length()>0)
		{
			sb.append(" and categories.id=?");
			list.add(Integer.parseInt(status));
		}
		if(logmin.trim().length()>0)
		{
			sb.append(" and createTime>?");
			Date date = Timestamp.valueOf(logmin + " 00:00:00");
			list.add(date);
		}
		if(logmax.trim().length()>0)
		{
			sb.append(" and createTime<?" );
			Date date = Timestamp.valueOf(logmax + " 23:59:59");
			list.add(date);
		}
		if(article.trim().length()>0)
		{
			sb.append(" and content like ?  or title like ?");
			list.add("%"+article+"%");
			list.add("%"+article+"%");
		}
		List<Artic>  list2=hqlDAO.query(hql+sb.toString(),list.toArray());
		return list2;
		
	}

}
