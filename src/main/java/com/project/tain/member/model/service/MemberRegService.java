package com.project.tain.member.model.service;


import javax.servlet.http.HttpServletResponse;

import com.project.tain.member.model.vo.MemberRegVO;

public interface MemberRegService {
	public int check_id(String m_id) throws Exception;

	public int check_email(String m_email) throws Exception;

	public int join(MemberRegVO vo) throws Exception;

//	String create_key() throws Exception;

	int approval_member(MemberRegVO vo);

	MemberRegVO login(MemberRegVO vo, HttpServletResponse response) throws Exception;

	String find_id(HttpServletResponse response, String email) throws Exception;

//	void send_mail(MemberRegVO vo, String div) throws Exception;

	void find_pw(HttpServletResponse response, MemberRegVO vo) throws Exception;

//	int join(MemberRegVO vo) throws Exception;

}
