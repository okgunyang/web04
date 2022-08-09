package com.okhospital.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.okhospital.dto.MemberDTO;

public interface MemberService {
	public List<MemberDTO> memberList() throws Exception;
	public MemberDTO viewMember(String userid) throws Exception;
	public void insertMember(MemberDTO mdto) throws Exception;
	public void updateMember(MemberDTO mdto) throws Exception;
	public void deleteMember(String userid) throws Exception;
	public MemberDTO loginCheck(MemberDTO mdto) throws Exception;
	public MemberDTO signin(MemberDTO mdto) throws Exception;
	public boolean login(HttpServletRequest request) throws Exception;
	public int idCheck(String userid) throws Exception;
}