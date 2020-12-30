package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;

	public void memberAdd(MemberDTO mDTO) {
		int n = template.insert("MemberMapper.memberAdd", mDTO); // service에서 전달받은 mDTO를 insert한 횟수.
		System.out.println("insert count => " + n);
	}

	public MemberDTO login(Map<String, String> map) {
//		System.out.println(map); // => {userid=1, passwd=1234} 갑이 service에서 넘어온다.
		MemberDTO mDTO = template.selectOne("MemberMapper.login", map); // 담긴 map 값을 mapper에서 id, pw 값에 넣어서 검색.
		return mDTO;
	}

	public MemberDTO myPage(String userid) {
		MemberDTO mDTO = template.selectOne("MemberMapper.mypage", userid);
		return mDTO;
	}
	
	public void memberUpdate(MemberDTO mDTO) {
		int num = template.update("MemberMapper.memberUpdate", mDTO);
		System.out.println("update count => " + num);
	}
}
