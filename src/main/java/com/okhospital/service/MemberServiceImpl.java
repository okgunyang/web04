package com.okhospital.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.okhospital.dao.MemberDAO;
import com.okhospital.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDao;

	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Override
	public List<MemberDTO> memberList() throws Exception {
		return memberDao.memberList();
	}

	@Override
	public MemberDTO viewMember(String userid) throws Exception {
		return memberDao.viewMember(userid);
	}

	@Override
	public void insertMember(MemberDTO mdto) throws Exception {
		memberDao.insertMember(mdto);
	}

	@Override
	public void updateMember(MemberDTO mdto) throws Exception {
		memberDao.updateMember(mdto);
	}

	@Override
	public void deleteMember(String userid) throws Exception {
		memberDao.deleteMember(userid);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO mdto) throws Exception {
		return memberDao.loginCheck(mdto);
	}

	@Override
	public MemberDTO signin(MemberDTO mdto) throws Exception {
		return memberDao.signin(mdto);
	}
	
	@Override
	public boolean login(HttpServletRequest request) throws Exception {	
		HttpSession session = request.getSession();
		boolean loginSuccess = false;
		MemberDTO mdto = new MemberDTO();
		
		mdto.setUserid(request.getParameter("userid"));
		mdto.setUserpw(request.getParameter("userpw"));
		
		MemberDTO login = memberDao.login(mdto);
		
		loginSuccess =  pwdEncoder.matches(mdto.getUserpw(), login.getUserpw());
		if(login != null && loginSuccess==true) {
			session.setAttribute("member", login);
			session.setAttribute("sid", login.getUserid());
			loginSuccess = true;
		}
		return loginSuccess;
	}
	
	@Override
	public int idCheck(String userid) throws Exception {
		return memberDao.idCheck(userid);
	}
}