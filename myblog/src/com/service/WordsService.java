package com.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ArticDAO;
import com.dao.HqlDAO;
import com.dao.RemarkDAO;
import com.dao.WordsDAO;
import com.pojo.Artic;
import com.pojo.Remark;
import com.pojo.Words;
import com.pojo.WordsReplay;

@Service
public class WordsService {
@Autowired
private HqlDAO hqlDAO;
@Autowired
private WordsDAO wordsDAO;
@Autowired
private ArticDAO articDAO;
	public Map findWords(int page, int size) {
		
		String hql2 = "select count(*) from Words";
		int count = (int) hqlDAO
				.unique(hql2);
		int pageCount = count % size == 0 ? count / size : count / size + 1;
		if (page < 1) {
		}
		if (page > pageCount) {
			page = pageCount; 
		}
		Map map = new HashMap();
		String hql="from Words";
		List<Words> list=hqlDAO.fengyeQuery(page, size, hql);
		map.put("list", list);
		map.put("count", count);
		map.put("page", page);
		map.put("size", size);
		map.put("pageCount", pageCount);
		return map;
	
	}
	public List<WordsReplay> findWordsReply() {
		String hql="from WordsReplay";
		List<WordsReplay> list=hqlDAO.findByHQL(hql);
	return list;
	}
	public void addWords(String text, String username, String mail) {
		Words words =new Words();
		words.setMail(mail);
		words.setStatus("未回复");
		words.setText(text);
		words.setUsername(username);
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sdf.format(date);
		words.setTime(Timestamp.valueOf(time));
		wordsDAO.save(words);
		
	}

}
