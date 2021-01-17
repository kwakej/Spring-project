package com.project.tain.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.tain.common.model.service.EmailService;
import com.project.tain.member.model.service.MemberRegServicelmpl;
import com.project.tain.member.model.vo.MemberRegVO;

@Controller
@RequestMapping("/member")
public class MemberRegController {
	@Autowired
	private MemberRegServicelmpl service;
	@Autowired
	private EmailService emailService;

	// 회원가입 페이지
	@RequestMapping("/joinPage")
	public String JoinPage() throws Exception {
		return "/member/join"; // jsp
	}

	// 회원 인증
	@RequestMapping(value = "/approval_member.do", method = RequestMethod.POST)
	public ModelAndView approval_member(@ModelAttribute MemberRegVO vo, ModelAndView mv)  {
		int result = 0;
		try {
			result = service.approval_member(vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(result == 1) { // 정상적인 경우
				mv.setViewName("redirect:/member/loginPage");
			} else if(result == 0) { // 비정상적인 경우
				mv.addObject("msg", "메일 인증에 실패했습니다");
				mv.setViewName("redirect:/errorPage");
			} else {
				mv.addObject("msg", "인증에 실패했습니다");
				mv.setViewName("redirect:/errorPage");
			}
		}
		return mv;
	}

	// 로그인 폼 이동
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() throws Exception {
		return "/member/login";
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberRegVO vo, HttpSession session, HttpServletResponse response)
			throws Exception {
		try {
			vo = service.login(vo, response);
			session.setAttribute("vo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// TODO: handle finally clause
		}
		return "redirect:/timeLine/";
	}

//	// 회원가입
//	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
//	public String join(MemberRegVO vo, ModelAndView mv) {
//		try {
//			service.join(vo); // db갔다옴
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "redirect:/errorPage";
//		}
//		return "redirect:/member/loginPage";
//	}
	// 회원 가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberRegVO vo, RedirectAttributes rttr, HttpServletResponse response)
			throws Exception {
		int result = 0;
		try {
//		rttr.addFlashAttribute("result", service.join(vo, response));

			vo.setApproval_key(create_key());
			vo.setApproval_status("false");
			result = service.join(vo);
			if (result == -1) {
				// 오류 상황 처리
				// return "";
			} else if (result == -2) {
				// 오류 상황 처리
				// return "";
			} else if (result == 1) {
				// 정상 가입 상황 처리
				send_mail(vo, "join");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/errorPage";
		}
		return "redirect:/member/loginPage";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	@ResponseBody
	public String check_id(@RequestParam("m_id") String m_id, HttpServletResponse response) throws Exception {
		int result = 0;
		try {
			System.out.println("ctrl check_id() m_id" + m_id);
			result = service.check_id(m_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}

	// 이메일 중복 검사
	@RequestMapping(value = "/check_email.do", method = RequestMethod.POST)
	@ResponseBody
	public String check_email(@RequestParam("m_email") String m_email, HttpServletResponse response) throws Exception {
		int result = 0;
		try {
			System.out.println("ctrl check_email() m_email" + m_email);
			result = service.check_email(m_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}



	// 아이디 찾기 폼
	@RequestMapping("/memberFindId.do")
	public String memberFindId() throws Exception {
		return "/member/memberFindId";
	}

	// 아이디 찾기
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("m_email") String m_email, Model md)
			throws Exception {
		md.addAttribute("m_id", service.find_id(response, m_email));
		return "/member/findId";
	}

	// 비밀번호 찾기 폼
	@RequestMapping("/memberFindPw.do")
	public String memberFindPw() throws Exception {
		return "/member/memberFindPw";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberRegVO vo, HttpServletResponse response) throws Exception {
		service.find_pw(response, vo);
	}

	// 인증키 생성
	private String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 10; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	// 이메일 발송
	private void send_mail(MemberRegVO vo, String div) throws Exception {
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "zx6160@naver.com";
		String subject = "";
		String msg = "";
		System.out.println("vo.getApproval_key(): "+ vo.getApproval_key() );
		if (div.equals("join")) {
			subject = "Spring Homepage 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8090/tain/member/approval_member.do'>";
			msg += "<input type='hidden' name='m_email' value='" + vo.getM_email() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + vo.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		} else if (div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getM_pw() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = vo.getM_email();
		try {
			emailService.mailSend(fromEmail, mail, subject, msg);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
