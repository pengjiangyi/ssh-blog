package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Artic;
import com.service.ArchiveService;
import com.util.ArchiveUtil;

import edu.emory.mathcs.backport.java.util.Collections;

@Controller
public class ArchiveAction {
	@Autowired
	private ArchiveService archiveService;
	
	
	public List<ArchiveUtil> getArchive2()
	{
		List<Artic>  list3=archiveService.findArticle();
		int yearMonth[][] = new int[4000][100];
		int k=0;
		List<ArchiveUtil> ll = new ArrayList<ArchiveUtil>();
		for(int i=0;i<list3.size();i++)
		{
			char []ch = list3.get(i).getCreateTime().toString().toCharArray();
			int year = 0;
			int month = 0;
			for(int j=0;j<4;j++){
				year = year*10 + (ch[j]-'0');
			}
			for(int j=5;j<7;j++){
				month = month*10 + (ch[j]-'0');
			}	
			yearMonth[year][month]++;
		}
		for(int i=2014;i<2114;i++){
			for(int j=1;j<=12;j++){
				
				if(yearMonth[i][j]!=0){
					ArchiveUtil s = new ArchiveUtil();
					s.setYm(i+"年"+j+"月");
					s.setCount(yearMonth[i][j]);
					ll.add(s);
				}
			}
		}
		Collections.reverse(ll);
		return ll;
		
		
	}
	
	
	
	
	@RequestMapping("/archive.html")
	public String getArchive(HttpServletRequest request)
	{
		List<ArchiveUtil>  ll=getArchive2();
		request.setAttribute("ll",ll);
		return "archive";
	}
	
	
	@RequestMapping("/about.html")
	public String aboutMe()
	{
		return "about";
	}
	
	@RequestMapping("/photo.html")
	public String photo()
	{
		return "photo";
	}
	
}
