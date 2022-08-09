package com.okhospital.dao;

import java.util.HashMap;
import java.util.List;

import com.okhospital.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> memberList() throws Exception;
	public MemberDTO viewMember(String userid) throws Exception;
	public void insertMember(MemberDTO mdto) throws Exception;
	public void updateMember(MemberDTO mdto) throws Exception;
	public void deleteMember(String userid) throws Exception;
	public MemberDTO loginCheck(MemberDTO mdto) throws Exception;
	public MemberDTO signin(MemberDTO mdto) throws Exception;
	public MemberDTO login(MemberDTO mdto) throws Exception;
	public int idCheck(String userid) throws Exception;
}