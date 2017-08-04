package com.service.background;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.RemarkDAO;
import com.dao.ReplayDAO;
import com.pojo.Remark;
import com.pojo.Replay;
import com.pojo.Words;
import com.pojo.WordsReplay;

@Service
public class ReplyService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ReplayDAO replayDAO;
	@Autowired
	private RemarkDAO remarkDAO;

	public List<Replay> findCommentsReplay() {
		String hql = "from Replay";
		List<Replay> list = hqlDAO.findByHQL(hql);
		return list;
	}

	public void updateCommentsReplyById(String id, String text) {
		Replay replay = replayDAO.findById(Integer.parseInt(id));
		replay.setText(text);
		replayDAO.merge(replay);

	}

	public void deleteCommentsReplayById(String id) {
		Replay replay = replayDAO.findById(Integer.parseInt(id));
		replayDAO.delete(replay);

	}

	public void deleteCommentsReplayALL(int[] list, int[] list2) {
		for (int i = 0; i < list.length; i++) {

			Replay replay = replayDAO.findById(list[i]);
			replayDAO.delete(replay);
		}

		for (int i = 0; i < list2.length; i++) {

			Remark remark = remarkDAO.findById(list2[i]);
			remark.setStatus("未回复");
			remarkDAO.merge(remark);
		}

	}

}
