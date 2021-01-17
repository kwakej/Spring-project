package com.project.tain.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.vo.MemberRegVO;

@Repository
public class MemberRegDao {
	private static Logger logger = LoggerFactory.getLogger(MemberRegDao.class);
	@Autowired
	SqlSession sqlSession;
	private static final String NameSpace = "MemberRegMapper";

	// 회원가입
	@Transactional
	public int join(MemberRegVO vo) throws Exception {
		return sqlSession.insert(NameSpace + ".join", vo);
	}

	// 아이디 중복 검사
	public int check_id(String m_id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".check_id", m_id);
	}

	// 이메일 중복 검사
	public int check_email(String m_email) throws Exception {
		System.out.println("dao check_email: "+m_email );
		return sqlSession.selectOne(NameSpace + ".check_email", m_email);
	}

	// 이메일 인증
	public int approval_member(MemberRegVO vo) {
		int result = 0;
		logger.info("aaa");
		try {
			System.out.println("dao getApproval_key: "+vo.getApproval_key());
			System.out.println("dao getM_email: "+vo.getM_email());
			vo.setApproval_status("true");
			logger.info("bbb");
			result =  sqlSession.update(NameSpace + ".approval_member", vo);
			logger.info("ccc : " + result);
		}catch (Exception e) {
			logger.info("ddd");
			System.out.println(e.getMessage());
			e.printStackTrace();
			logger.info("eee");
			result = 0;
		}finally {
			logger.info("fff");
		}
		logger.info("ggg");
		return result;
	}

	// 로그인 검사
	public MemberRegVO login(String m_id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".login", m_id);
	}

	// 로그인 접속일자 변경0
	@Transactional
	public int update_log(String m_id) throws Exception {
		return sqlSession.update(NameSpace + ".update_log", m_id);
	}

	// 아이디 찾기
	public String find_id(String m_email) throws Exception {
		return sqlSession.selectOne(NameSpace + ".find_id", m_email);
	}

	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberRegVO vo) throws Exception {
		return sqlSession.update(NameSpace +".update_pw", vo);
	}
}
