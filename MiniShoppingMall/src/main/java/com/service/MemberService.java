package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;

	public void memberAdd(MemberDTO mDTO) { // 회원가입
		dao.memberAdd(mDTO); // MemberDTO 전달
	}

	public MemberDTO login(Map<String, String> map) { // 로그인
		MemberDTO mDTO = dao.login(map); // dao로 mDTO를 map에 담아서 전달
		return mDTO;
	}

	public MemberDTO myPage(String userid) {
		MemberDTO mDTO = dao.myPage(userid);
		return mDTO;
	}
	
	public void memberUpdate(MemberDTO mDTO) {
		dao.memberUpdate(mDTO);
	}
}
