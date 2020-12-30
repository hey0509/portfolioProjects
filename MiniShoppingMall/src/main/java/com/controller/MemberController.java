package com.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired // service 자동주입
	MemberService service;

	// 회원가입 이동
	@RequestMapping(value = "/memberAdd") // memberForm.jsp 데이터 전송 옴.
	public String memberAdd(MemberDTO mDTO, Model model) { // form 에서 전달받은 값을 MemberDTO로 자동 저장
		service.memberAdd(mDTO);
		model.addAttribute("success", "회원가입성공"); // main.jsp에서 출력
		return "main"; // => main.jsp
	}
	
	// 회원정보수정
	@RequestMapping(value = "/loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO mDTO) {
		System.out.println("memberUpdate => " + mDTO);
		service.memberUpdate(mDTO);
		return "redirect:../loginCheck/myPage";
	}
	
	// 마이페이지 이동 관련
	@RequestMapping(value = "/loginCheck/myPage")
	public String myPage(HttpSession session) {
		// ==> ** 인터셉터에서 로그인 인증 후 페이지 이동
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = service.myPage(userid);
		session.setAttribute("login", mDTO);
		return "redirect:../myPage"; // 주소에 해당하는 페이지를 servlet-context.xml에 등록해서 사용 => ../를 사용하면 value="/loginCheck/을 삭제하고 검색
	}
	
	// 회원가입 -> 아이디 중복 체크
	@RequestMapping(value = "/idDuplicateCheck", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String idDuplicateCheck(@RequestParam("userid") String userid) {
		MemberDTO mDTO = service.myPage(userid);
		System.out.println("idDuplicateCheck => " + userid);
		String mesg = "아이디 사용 가능";
		if (mDTO != null) {
			mesg = "중복된 아이디";
		}
		return mesg;
	}
}
