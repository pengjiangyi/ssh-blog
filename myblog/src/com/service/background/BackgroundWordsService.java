package com.service.background;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.WordsDAO;
import com.dao.WordsReplayDAO;
import com.pojo.Remark;
import com.pojo.Words;
import com.pojo.WordsReplay;

@Service
public class BackgroundWordsService {
	@Autowired
	private WordsDAO wordsDAO;
	@Autowired
	private WordsReplayDAO wordsReplayDAO;
	@Autowired
	private HqlDAO hqlDAO;

	public List<Words> findWords() {
		String hql = "from Words";
		List<Words> list = hqlDAO.findByHQL(hql);
		return list;
	}

	public List<WordsReplay> findWordsReplay() {
		String hql = "from WordsReplay";
		List<WordsReplay> list = hqlDAO.findByHQL(hql);
		return list;
	}

	public List<WordsReplay> checkReplay(String id) {
		String hql = "from WordsReplay where words.id=?";
		List<WordsReplay> list = hqlDAO.findByHQL(hql, Integer.parseInt(id));
		return list;
	}

	public void deleteWordsById(String id) {
		Words words = wordsDAO.findById(Integer.parseInt(id));
		wordsDAO.delete(words);
	}

	public void addWordsReply(String id, String text, String username) {
		Words words = wordsDAO.findById(Integer.parseInt(id));
		words.setStatus("已回复");
		wordsDAO.merge(words);
		WordsReplay wordsReplay = new WordsReplay();
		wordsReplay.setText(text);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(date);
		wordsReplay.setTime(Timestamp.valueOf(time));
		wordsReplay.setUsername(username);
		wordsReplay.setWords(words);
		wordsReplayDAO.save(wordsReplay);

	}

	public void updateWordsReplay(String id, String text) {
		WordsReplay replay = wordsReplayDAO.findById(Integer.parseInt(id));
		replay.setText(text);
		wordsReplayDAO.merge(replay);

	}

	public void deleteWordsReplayById(String id, String wordid) {
		WordsReplay wordsReplay = wordsReplayDAO.findById(Integer.parseInt(id));
		wordsReplayDAO.delete(wordsReplay);
		Words words = wordsDAO.findById(Integer.parseInt(wordid));
		words.setStatus("未回复");
		wordsDAO.merge(words);
	}

	public void deleteALL(String[] data) {

		for (int i = 0; i < data.length; i++) {

			Words words = wordsDAO.findById(Integer.parseInt(data[i]));
			wordsDAO.delete(words);
		}

	}

	public void deleteWordsReplayALL(int[] list, int[] list2) {

		for (int i = 0; i < list.length; i++) {

			WordsReplay wordsReplay = wordsReplayDAO.findById(list[i]);
			wordsReplayDAO.delete(wordsReplay);
		}

		for (int i = 0; i < list2.length; i++) {

			Words words = wordsDAO.findById(list2[i]);
			words.setStatus("未回复");
			wordsDAO.merge(words);
		}

	}

	public List<Words> findWordsLikeSearch(String status, String logmin,
			String logmax, String keywords) {
		String hql="from Words where 1=1";
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
		List<Words>  list2=hqlDAO.query(hql+sb.toString(),list.toArray());
		return list2;
	}

}
