package com.okhospital.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.okhospital.dto.MemberDTO;
import com.okhospital.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	//다음 서비스 작업 객체를 주입
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
		
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public String memberList(Model model) throws Exception {
		List<MemberDTO> memberList = memberService.memberList();
		model.addAttribute("memberList", memberList);
		return "member/memberList";
	}
	
	/* 관리자 회원 정보 보기 */
	@RequestMapping(value="getMember.do", method = RequestMethod.GET)
	public String getMember(@RequestParam String userid, Model model) throws Exception {
		MemberDTO member = memberService.viewMember(userid);
		model.addAttribute("member", member);
		return "member/memberRead";
	}

	/* 일반회원 정보보기 */
	@RequestMapping(value="read.do", method = RequestMethod.GET)
	public String memberRead(Model model, HttpServletRequest request) throws Exception {
		String userid = (String) session.getAttribute("sid");
		MemberDTO member = memberService.viewMember(userid);
		model.addAttribute("member", member);
		return "member/memberRead";
	}
	
	@RequestMapping("joinForm.do")  //board/write_form  -> board/boardWriteForm.jsp
	public String memberWriteForm(Model model) throws Exception {
		return "member/joinForm";
	}
	
	@RequestMapping("loginForm.do")  //board/write_form  -> board/boardWriteForm.jsp
	public String memberLoginForm(Model model) throws Exception {
		return "member/loginForm";
	}
	
	@RequestMapping(value="join.do", method = RequestMethod.POST)
	public String memberWrite(MemberDTO mdto, Model model) throws Exception {
		String userpw = mdto.getUserpw();
		String pwd = pwdEncoder.encode(userpw);
		mdto.setUserpw(pwd);
		memberService.insertMember(mdto);
		return "redirect:/";
	}
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO mdto, Model model) throws Exception {
		memberService.updateMember(mdto);
		return "redirect:/";
	}

	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String memberDelete(@RequestParam String userid, Model model, HttpSession session) throws Exception {
		memberService.deleteMember(userid);
		return "redirect:/";
	}
	
	//컨트롤러에서 세션 처리
	@RequestMapping(value="signin.do", method = RequestMethod.POST)
	public String memberSignin(@RequestParam String userid, @RequestParam String userpw, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		session.invalidate();
		MemberDTO mdto = new MemberDTO();
		mdto.setUserpw(userpw);
		mdto.setUserid(userid);
		MemberDTO login = memberService.signin(mdto);
		boolean loginSuccess = pwdEncoder.matches(mdto.getUserpw(), login.getUserpw());
		if(loginSuccess && login!=null) {
			session.setAttribute("member", login);
			session.setAttribute("sid", userid);
			return "redirect:/";
		} else {
			return "redirect:loginForm.do";
		}
	}
	
	//Service에서 세션 처리
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String memberLogin(MemberDTO mdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		boolean loginSuccess = memberService.login(req);
		if(loginSuccess) {		
			return "home";
		} else {
			return "redirect:loginForm.do";
		}
	}
	
	//Ajax를 이용하는 방법
	@RequestMapping(value="loginCheck.do", method = RequestMethod.POST)
	public String memberLoginCtrl(MemberDTO mdto, RedirectAttributes rttr) throws Exception {
		session.getAttribute("member");
		MemberDTO member = memberService.loginCheck(mdto);
		boolean mat = pwdEncoder.matches(mdto.getUserpw(), member.getUserpw());
		if(mat==true && member!=null) {
			logger.info("로그인 성공");
			session.setAttribute("member", member);
			session.setAttribute("sid", member.getUserid());
			return "redirect:/";
		} else {
			logger.info("로그인 실패");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:loginForm.do";
		}
	}
	
	@RequestMapping(value="idCheck.do", method = RequestMethod.GET)
	public String idCheck(@RequestParam String userid, Model model, RedirectAttributes rttr) throws Exception {
		int cnt = memberService.idCheck(userid);
		if(cnt==0) {
			model.addAttribute("msg", "가입 가능한 아이디");
			rttr.addFlashAttribute("message", "가입 가능한 아이디");
			model.addAttribute("ck", "ok");
			model.addAttribute("uid", userid);
		} else {
			model.addAttribute("msg", "가입 불가능한 아이디");
			rttr.addFlashAttribute("message", "가입 불가능한 아이디");
			model.addAttribute("ck", null);
		}
		return "member/joinForm";
	}
	
	@RequestMapping("logout.do")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
}