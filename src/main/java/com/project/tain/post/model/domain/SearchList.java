package com.project.tain.post.model.domain;

import org.springframework.stereotype.Component;

@Component
public class SearchList implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String m_id;
	private String word;
	private String b_id;
	private String hashtag;
	private String b_img;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	
	

}
