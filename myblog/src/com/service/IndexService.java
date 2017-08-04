package com.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ArticDAO;
import com.dao.HqlDAO;
import com.dao.RemarkDAO;
import com.dao.TagsDAO;
import com.pojo.Artic;
import com.pojo.Remark;
import com.pojo.Replay;
import com.pojo.Tags;
import com.pojo.Words;
import com.sun.org.apache.regexp.internal.recompile;



@Service
public class IndexService {
@Autowired
private HqlDAO hqlDAO;
@Autowired
private RemarkDAO remarkDAO;
@Autowired
private ArticDAO articDAO;
@Autowired
private TagsDAO tagsDAO;
	public Map pageQuery(int page, int size) {
		
		
		String hql2 = "select count(*) from Artic";
		int count = (int) hqlDAO
				.unique(hql2);
		int pageCount = count % size == 0 ? count / size : count / size + 1;
		if (page < 1) {
		}
		if (page > pageCount) {
			page = pageCount; 
		}
		Map map = new HashMap();
		String hql="from Artic";
		List<Artic>  list=hqlDAO.fengyeQuery(page, size, hql);
		
		List tags=new ArrayList();
		String str[]=null;
		if(list.size()!=0)
		{	
		str=list.get(0).getTags().getName().split(",");
		}
		else{
			
		}
	///	System.out.println(list.get(0).getCategories().getName());
		map.put("list", list);
		map.put("count", count);
		map.put("page", page);
		map.put("size", size);
		map.put("pageCount", pageCount);
		map.put("str", str);
		return map;
	
	}
	public List<Object[]> findCategory() {
		String hql="select count(a.categories.name),b.name,a.categories.id from Artic a,Categories b where a.categories.id=b.id group by a.categories.name";
		List<Object[]>  list=hqlDAO.findByHQL(hql);
		return list;
	}
	public List<Artic> findTopRead() {
		String hql="from Artic order by readcount desc";
		List<Artic> list=hqlDAO.fengyeQuery(1, 6, hql);
		return list;
	}
	public  List<Words> findWords() {
		String hql="from Words order by time desc";
		List<Words> list=hqlDAO.fengyeQuery(1, 6, hql);
		return list;

	}
	public List<Remark> findRemark() {
		String hql="from Remark order by time desc";
		List<Remark> list=hqlDAO.fengyeQuery(1, 6, hql);
		return list;
	}
	public  List<Artic> findArticleById(String iD) {
		String hql="from Artic where id=?";
		List<Artic> list=hqlDAO.findByHQL(hql, Integer.parseInt(iD));
		Artic artic=list.get(0);
		artic.setReadcount(artic.getReadcount()+1);
		return list;
	}
	public List<Remark> findCommentsById(String iD) {
		String hql="from Remark where artic.id=?";
		List<Remark> list=hqlDAO.findByHQL(hql, Integer.parseInt(iD));
		return list;
	}
	public List<Replay> findAllReplay() {
		String hql="from Replay ";
		List<Replay> list=hqlDAO.findByHQL(hql);
		return list;
	
	}
	public int findCommentsCount(String iD) {
		String hql2 = "select count(artic.id) from Remark where artic.id=?";
		int count = (int) hqlDAO
				.unique(hql2,Integer.parseInt(iD));
		return count;
	}
	public  void addComments(String text, String username, String mail,
			String id) {
	Remark remark=new Remark();
	Artic artic=articDAO.findById(Integer.parseInt(id));
	remark.setArtic(artic);
	remark.setMail(mail);
	remark.setStatus("未回复");
	remark.setText(text);
	remark.setUsername(username);
	Date date=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String time=sdf.format(date);
	remark.setTime(Timestamp.valueOf(time));
	remarkDAO.save(remark);
		
		
	}
	public Map findCategoryArticle(int page, int size, String id) {
		String hql2 = "select count(*) from Artic where categories.id=?";
		int count = (int) hqlDAO
				.unique(hql2,Integer.parseInt(id));
		int pageCount = count % size == 0 ? count / size : count / size + 1;
		if (page < 1) {
		}
		if (page > pageCount) {
			page = pageCount; 
		}
		Map map = new HashMap();
		String hql="from Artic where categories.id=?";
		List<Artic>  list=hqlDAO.fengyeQuery(page, size, hql,Integer.parseInt(id));
		
		List tags=new ArrayList();
		String str[]=null;
		if(list.size()!=0)
		{	
		str=list.get(0).getTags().getName().split(",");
		}
		else{
			
		}
	///	System.out.println(list.get(0).getCategories().getName());
		map.put("list", list);
		map.put("count", count);
		map.put("page", page);
		map.put("size", size);
		map.put("pageCount", pageCount);
		map.put("str", str);
		return map;
	}
	public List<Artic> findArticle() {
		String hql="from Artic";
		List<Artic> list=hqlDAO.findByHQL(hql);
		return list;
	}
	public Map selectArticleByTime(int page, int size, String time) {
		StringBuffer sb = new StringBuffer();
		List listArray = new ArrayList();
		sb.append(" and createTime>?");
		System.out.println(time+"-01 00:00:00");
		Date date=Timestamp.valueOf(time+"-01 00:00:00");
		System.out.println(date+"///");
		listArray.add(date);
		
		sb.append(" and createTime<?");
		Date date2=Timestamp.valueOf(time+"-31 00:00:00");
		listArray.add(date2);
		String hql2="select count(*) from Artic where 1=1";
		int count = (int) hqlDAO
				.unique(hql2+sb.toString(),listArray.toArray());
		int pageCount = count % size == 0 ? count / size : count / size + 1;
		if (page < 1) {
		}
		if (page > pageCount) {
			page = pageCount; 
		}
		String hql="from Artic where 1=1";
		List<Artic>  list=hqlDAO.fengyeQuery(pageCount, size, hql+sb.toString(), listArray.toArray());
		Map map=new HashMap();
		
		String str[]=null;
		if(list.size()!=0)
		{	
		str=list.get(0).getTags().getName().split(",");
		}
		else{
			
		}
		map.put("list", list);
		map.put("count", count);
		map.put("page", page);
		map.put("size", size);
		map.put("pageCount", pageCount);
		map.put("str",str);
		return map;
		
		
		
	}
	public List<Tags> findTags() {
		String hql="from Tags";
		List<Tags> list=hqlDAO.findByHQL(hql);
		return list;
	}
	public Map findTagsArticle(int page, int size, String tagsname) {
		
		
		
		String hql2 = "select count(*) from Artic where tags.name like ?";
		int count = (int) hqlDAO
				.unique(hql2, "%"+tagsname+"%");
		int pageCount = count % size == 0 ? count / size : count / size + 1;
		if (page < 1) {
		}
		if (page > pageCount) {
			page = pageCount; 
		}
		Map map = new HashMap();
		String hql="from Artic  where tags.name like ?";
		List<Artic>  list=hqlDAO.fengyeQuery(page, size, hql,"%"+tagsname+"%");
	///	System.out.println(list.get(0).getCategories().getName());
		map.put("list", list);
		map.put("count", count);
		map.put("page", page);
		map.put("size", size);
		map.put("pageCount", pageCount);

		return map;
	}
	public List<Artic> findTopArticle(String iD) {
		String hql="from Artic where id<? order by id desc";
		List<Artic> list=hqlDAO.fengyeQuery(1, 1, hql, Integer.parseInt(iD));
		return list;
	}
	
	
	public List<Artic> findDownArticle(String iD) {
		String hql="from Artic where id>? order by id desc";
		List<Artic> list=hqlDAO.fengyeQuery(1, 1, hql, Integer.parseInt(iD));
		return list;
	}

}
