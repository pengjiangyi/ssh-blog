package com.service.background;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.RemarkDAO;
import com.dao.ReplayDAO;
import com.pojo.Artic;
import com.pojo.Remark;
import com.pojo.Replay;

@Service
public class RemarkService {
@Autowired
private HqlDAO hqlDAO;
@Autowired
private RemarkDAO remarkDAO;
@Autowired
private ReplayDAO replayDAO;
	public List<Remark> findComments() {
		String hql="from Remark";
		List<Remark>  list=hqlDAO.findByHQL(hql);
		return list;
		
	}

	public List<Replay> findReply() {
		String hql="from Replay";
		List<Replay>  list=hqlDAO.findByHQL(hql);
		return list;
	}

	public void addCommentReply(String id, String text,
			String username) {
		Replay replay=new Replay();
		Remark remark=remarkDAO.findById(Integer.parseInt(id));
		remark.setStatus("已回复");
		remarkDAO.merge(remark);
		replay.setRemark(remark);
		replay.setText(text);
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time=sdf.format(date);
		replay.setTime(Timestamp.valueOf(time));
		replay.setUsername(123);
		replayDAO.save(replay);
		
	}

	public List<Replay> checkComments(String id) {
		String hql="from Replay where remark.id=?";
		List<Replay> list=hqlDAO.findByHQL(hql,Integer.parseInt(id));
		return list;
	}
	
	public void deleteCommentById(String id) {
		Remark remark=remarkDAO.findById(Integer.parseInt(id));
		remarkDAO.delete(remark);
	}

	public void deleteCommentReplayALL(int[] list) {
		for (int i = 0; i < list.length; i++) {
			Remark remark=remarkDAO.findById(list[i]);
			remarkDAO.delete(remark);
		}
		
	}

	public List<Remark> LikeSearch(String status, String logmin, String logmax,
			String keywords) {
		String hql="from Remark where 1=1";
		StringBuffer sb=new StringBuffer();
		List list=new ArrayList();

		
		if(!status.equals("-1")&&status.trim().length()>0)
		{
			sb.append(" and status=?");
			list.add(status);
		}
		if(logmin.trim().length()>0)
		{
			sb.append(" and time>?");
			Date date = Timestamp.valueOf(logmin + " 00:00:00");
			list.add(date);
		}
		if(logmax.trim().length()>0)
		{
			sb.append(" and time<?" );
			Date date = Timestamp.valueOf(logmax + " 23:59:59");
			list.add(date);
		}
		if(keywords.trim().length()>0)
		{
			sb.append(" and text like ?");
			list.add("%"+keywords+"%");
		}
		List<Remark>  list2=hqlDAO.query(hql+sb.toString(),list.toArray());
		return list2;
	}

	

}
