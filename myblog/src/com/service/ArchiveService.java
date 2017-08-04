package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Artic;

@Service
public class ArchiveService {
@Autowired
private HqlDAO hqlDAO;
	public  List<Artic> findArticle() {
		String hql="from Artic";
		List<Artic> list=hqlDAO.findByHQL(hql);
		return list;
	}
 
}
