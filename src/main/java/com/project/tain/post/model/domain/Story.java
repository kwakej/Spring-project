package com.project.tain.post.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Story implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String m_id;
	private String s_img;
	private String s_type;
	private String m_img;
	private String id;
	private String my_name;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getS_img() {
		return s_img;
	}

	public void setS_img(String s_img) {
		this.s_img = s_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMy_name() {
		return my_name;
	}

	public void setMy_name(String my_name) {
		this.my_name = my_name;
	}
	
	

}
