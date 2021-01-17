package com.project.tain.post.model.service;

import java.util.List;

import com.project.tain.post.model.domain.TimeLine;

public interface TimeLineService {

	TimeLine showMyProf(String m_id);

	List<TimeLine> showStoryList(String m_id);

	List<TimeLine> showTimeLineList(String m_id);

	int insertTimeLineComment(TimeLine tl);

	int insertTimeLineCommentB(TimeLine tl);

	List<TimeLine> hiddenShowAllCo(String t_id);

	int hiddenShowLike(TimeLine tl);

	int pressLike(TimeLine tl);

	int pressLikeB(TimeLine tl);

	int pressUnLike(TimeLine tl);

	int pressUnLikeB(TimeLine tl);

	List<TimeLine> recomFollow(String m_id);

	int insertFollow(TimeLine tl);

	int deleteComment(String b_id);

	int deleteCommentl(String b_id);

	int deleteCommentt(String b_id);

	int deleteCommentB(String b_id);

	int deleteCommentlB(String b_id);

	int deleteCommenttB(String b_id);

	int insertReplyComment(TimeLine tl);

	int insertReplyCommentB(TimeLine tl);

	int updateComment(TimeLine tl);

	int updateCommentB(TimeLine tl);

	int countLike(TimeLine tl);

	int insertReport(TimeLine tl);

	int insertReportB(TimeLine tl);

	int reportchk(TimeLine tl);

	int unfollow(TimeLine tl);

	List<TimeLine> autocomplete(String word);

	List<TimeLine> showHashTag(String t_id);
	List<TimeLine> chkfollow(String m_id);

	String showMemberType(String m_id);
}
