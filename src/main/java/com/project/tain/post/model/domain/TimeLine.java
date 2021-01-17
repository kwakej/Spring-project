package com.project.tain.post.model.domain;

import org.springframework.stereotype.Component;

/**
 * @author gimsumin
 *
 */
@Component
public class TimeLine implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private String m_id;
	private String m_img;
	private String t_content;
	private String t_id;
	private String t_type;
	private String t_comment;
	private String t_time;
	private int t_likes;
	private String b_id;
	private String b_content;
	private String b_date;
	private int likechk;
	private String r_mid;
	private String r_bcontent;
	private String b_topid;
	private String r_btopid;
	private String b_type;
	private String r_bid;
	private int count;
	private String r_reason;
	private String id;
	private String word;
	private String t_img;
	private String h_tag;
	private int m_activity;
	private String m_usage;
	
	public TimeLine() {
		
	}

	// showMyProf
	public TimeLine(String m_id, String m_img) {
		super();
		this.m_id = m_id;
		this.m_img = m_img;
	}
	

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	// timeLineList
	
	

	public String getT_content() {
		return t_content;
	}

	public TimeLine(String m_id, String m_img, String t_content, String t_id, String t_type, String t_time,
			int t_likes) {
		super();
		this.m_id = m_id;
		this.m_img = m_img;
		this.t_content = t_content;
		this.t_id = t_id;
		this.t_type = t_type;
		this.t_time = t_time;
		this.t_likes = t_likes;
	}

	public void setT_content(String t_content) {
		this.t_content = t_content;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getT_type() {
		return t_type;
	}

	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	
	

	public String getT_time() {
		return t_time;
	}

	public void setT_time(String t_time) {
		this.t_time = t_time;
	}
	
	

	public int getT_likes() {
		return t_likes;
	}

	public void setT_likes(int t_likes) {
		this.t_likes = t_likes;
	}

	// comment insert
	public TimeLine(String m_id, String t_id, String t_comment, String r_mid, String r_bcontent) {
		super();
		this.m_id = m_id;
		this.t_id = t_id;
		this.t_comment = t_comment;
		this.r_mid = r_mid;
		this.r_bcontent = r_bcontent;
	}

	public String getT_comment() {
		return t_comment;
	}

	public void setT_comment(String t_comment) {
		this.t_comment = t_comment;
	}

	

	public TimeLine(String m_id, String m_img, String t_content, String t_id, String t_type, String t_time, int t_likes,
			String b_id, String b_content, String b_date, int likechk) {
		super();
		this.m_id = m_id;
		this.m_img = m_img;
		this.t_content = t_content;
		this.t_id = t_id;
		this.t_type = t_type;
		this.t_time = t_time;
		this.t_likes = t_likes;
		this.b_id = b_id;
		this.b_content = b_content;
		this.b_date = b_date;
		this.likechk = likechk;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getLikechk() {
		return likechk;
	}

	public void setLikechk(int likechk) {
		this.likechk = likechk;
	}

	public String getR_mid() {
		return r_mid;
	}

	public void setR_mid(String r_mid) {
		this.r_mid = r_mid;
	}

	public String getR_bcontent() {
		return r_bcontent;
	}

	public void setR_bcontent(String r_bcontent) {
		this.r_bcontent = r_bcontent;
	}

	public TimeLine(String m_id, String m_img, String t_content, String t_id, String t_type, String t_comment,
			String t_time, int t_likes, String b_id, String b_content, String b_date, int likechk, String r_mid,
			String r_bcontent, String b_topid, String r_btopid) {
		super();
		this.m_id = m_id;
		this.m_img = m_img;
		this.t_content = t_content;
		this.t_id = t_id;
		this.t_type = t_type;
		this.t_comment = t_comment;
		this.t_time = t_time;
		this.t_likes = t_likes;
		this.b_id = b_id;
		this.b_content = b_content;
		this.b_date = b_date;
		this.likechk = likechk;
		this.r_mid = r_mid;
		this.r_bcontent = r_bcontent;
		this.b_topid = b_topid;
		this.r_btopid = r_btopid;
	}

	public String getB_topid() {
		return b_topid;
	}

	public void setB_topid(String b_topid) {
		this.b_topid = b_topid;
	}

	public String getR_btopid() {
		return r_btopid;
	}

	public void setR_btopid(String r_btopid) {
		this.r_btopid = r_btopid;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getR_bid() {
		return r_bid;
	}

	public void setR_bid(String r_bid) {
		this.r_bid = r_bid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getR_reason() {
		return r_reason;
	}

	public void setR_reason(String r_reason) {
		this.r_reason = r_reason;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getT_img() {
		return t_img;
	}

	public void setT_img(String t_img) {
		this.t_img = t_img;
	}

	public String getH_tag() {
		return h_tag;
	}

	public void setH_tag(String h_tag) {
		this.h_tag = h_tag;
	}

	public int getM_activity() {
		return m_activity;
	}

	public void setM_activity(int m_activity) {
		this.m_activity = m_activity;
	}

	public String getM_usage() {
		return m_usage;
	}

	public void setM_usage(String m_usage) {
		this.m_usage = m_usage;
	}
	
	
	
	
}
