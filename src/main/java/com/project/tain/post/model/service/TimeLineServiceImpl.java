package com.project.tain.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.post.model.dao.TimeLineDao;
import com.project.tain.post.model.domain.TimeLine;

@Service("tService")
public class TimeLineServiceImpl implements TimeLineService {

	@Autowired
	private TimeLineDao tDao;

	@Override
	public TimeLine showMyProf(String m_id) {
		return tDao.showMyProf(m_id);
	}

	@Override
	public List<TimeLine> showStoryList(String m_id) {
		return tDao.showStoryList(m_id);
	}

	@Override
	public List<TimeLine> showTimeLineList(String m_id) {
		return tDao.showTimeLineList(m_id);
	}

	@Override
	public int insertTimeLineComment(TimeLine tl) {
		return tDao.insertTimeLineComment(tl);
	}

	@Override
	public int insertTimeLineCommentB(TimeLine tl) {
		return tDao.insertTimeLineCommentB(tl);
	}

	@Override
	public List<TimeLine> hiddenShowAllCo(String t_id) {
		return tDao.hiddenShowAllCo(t_id);
	}

	@Override
	public int hiddenShowLike(TimeLine tl) {
		return tDao.hiddenShowLike(tl);
	}

	@Override
	public int pressLike(TimeLine tl) {
		return tDao.pressLike(tl);
	}

	@Override
	public int pressLikeB(TimeLine tl) {
		return tDao.pressLikeB(tl);
	}

	@Override
	public int pressUnLike(TimeLine tl) {
		return tDao.pressUnLike(tl);
	}

	@Override
	public int pressUnLikeB(TimeLine tl) {
		return tDao.pressUnLikeB(tl);
	}

	@Override
	public List<TimeLine> recomFollow(String m_id) {
		return tDao.recomFollow(m_id);
	}

	@Override
	public int insertFollow(TimeLine tl) {
		return tDao.insertFollow(tl);
	}

	@Override
	public int deleteComment(String b_id) {
		return tDao.deleteComment(b_id);
	}

	@Override
	public int deleteCommentl(String b_id) {
		return tDao.deleteCommentl(b_id);
	}

	@Override
	public int deleteCommentt(String b_id) {
		return tDao.deleteCommentt(b_id);
	}

	@Override
	public int deleteCommentB(String b_id) {
		return tDao.deleteCommentB(b_id);
	}

	@Override
	public int deleteCommentlB(String b_id) {
		return tDao.deleteCommentlB(b_id);
	}

	@Override
	public int deleteCommenttB(String b_id) {
		return tDao.deleteCommenttB(b_id);
	}

	@Override
	public int insertReplyComment(TimeLine tl) {
		return tDao.insertReplyComment(tl);
	}

	@Override
	public int insertReplyCommentB(TimeLine tl) {
		return tDao.insertReplyCommentB(tl);
	}

	@Override
	public int insertReport(TimeLine tl) {
		return tDao.insertReport(tl);
	}

	@Override
	public int insertReportB(TimeLine tl) {
		return tDao.insertReportB(tl);
	}

	@Override
	public int reportchk(TimeLine tl) {
		return tDao.reportchk(tl);
	}

	@Override
	public int updateComment(TimeLine tl) {
		return tDao.updateComment(tl);
	}

	@Override
	public int updateCommentB(TimeLine tl) {
		return tDao.updateCommentB(tl);
	}

	@Override
	public int countLike(TimeLine tl) {
		return tDao.countLike(tl);
	}

	@Override
	public int unfollow(TimeLine tl) {
		return tDao.unfollow(tl);
	}

	@Override
	public List<TimeLine> autocomplete(String word) {
		return tDao.autocomplete(word);
	}

	@Override
	public List<TimeLine> showHashTag(String t_id) {
		return tDao.showHashTag(t_id);
	}

	@Override
	public List<TimeLine> chkfollow(String m_id) {
		return tDao.chkfollow(m_id);
	}

	@Override
	public String showMemberType(String m_id) {
		return tDao.showMemberType(m_id);
	}
}