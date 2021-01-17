package com.project.tain.member.model.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.dao.MemberRegDao;
import com.project.tain.member.model.vo.MemberRegVO;

@Service
public class MemberRegServicelmpl implements MemberRegService {
   @Autowired
   private MemberRegDao dao;

   // 아이디 중복 검사(AJAX)
   @Override
   public int check_id(String m_id) throws Exception {
      return dao.check_id(m_id);
   }

   // 이메일 중복 검사(AJAX)
   @Override
   public int check_email(String m_email) throws Exception {
      return dao.check_email(m_email);
   }

   // 회원가입
   @Override
   public int join(MemberRegVO vo) throws Exception {
      if (dao.check_id(vo.getM_id()) == 1) {
         return -1;
      } else if (dao.check_email(vo.getM_email()) == 1) {
         return -2;
      } else {
         dao.join(vo);
         return 1;
      }
   }

   
   // 회원 인증
   @Override
   @Transactional
   public int approval_member(MemberRegVO vo) {
      return dao.approval_member(vo);
   }

   // 로그인
   @Override
   public MemberRegVO login(MemberRegVO vo, HttpServletResponse response) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      // 등록된 아이디가 없으면
      if (dao.check_id(vo.getM_id()) == 0) {
         out.println("<script>");
         out.println("alert('등록된 아이디가 없습니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      } else {
         String m_pw = vo.getM_pw();
         vo = dao.login(vo.getM_id());
         // 비밀번호가 다를 경우
         if (!vo.getM_pw().equals(m_pw)) {
            out.println("<script>");
            out.println("alert('비밀번호가 다릅니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
            // 이메일 인증을 하지 않은 경우
         } else if (!vo.getApproval_status().equals("true ")) {
            out.println("<script>");
            out.println("alert('이메일 인증 후 로그인 하세요.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
            // 로그인 일자 업데이트 및 회원정보 리턴
         } else {
            dao.update_log(vo.getM_id());
            return vo;
         }
      }
   }

   // 아이디 찾기
   @Override
   public String find_id(HttpServletResponse response, String m_email) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String m_id = dao.find_id(m_email);

      if (m_id == null) {
         out.println("<script>");
         out.println("alert('가입된 아이디가 없습니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      } else {
         return m_id;
      }
   }

   // 비밀번호 찾기
   @Override
   public void find_pw(HttpServletResponse response, MemberRegVO vo) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      // 아이디가 없으면
      if (dao.check_id(vo.getM_id()) == 0) {
         out.print("아이디가 없습니다.");
         out.close();
      }
      // 가입에 사용한 이메일이 아니면
      else if (!vo.getM_email().equals(dao.login(vo.getM_id()).getM_email())) {
         out.print("잘못된 이메일 입니다.");
         out.close();
      } else {
         // 임시 비밀번호 생성
         String m_pw = "";
         for (int i = 0; i < 12; i++) {
            m_pw += (char) ((Math.random() * 26) + 97);
         }
         vo.setM_pw(m_pw);
         // 비밀번호 변경
         dao.update_pw(vo);
         // 비밀번호 변경 메일 발송
//         send_mail(vo, "find_pw");

         out.print("이메일로 임시 비밀번호를 발송하였습니다.");
         out.close();
      }
   }


}