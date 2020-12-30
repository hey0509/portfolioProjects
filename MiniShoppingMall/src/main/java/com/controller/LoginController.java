package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	// 로그아웃
	@RequestMapping(value = "/loginCheck/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("logout Complete");
		return "redirect:../"; // => .xml에 설정 main.jsp => ../를 이용해서 /loginCheck의 상위 주소로 이동한다.
	}

	@RequestMapping(value = "/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		
		MemberDTO mDTO = service.login(map);
		String nextPage = "";
		if (mDTO != null) { // 로그인 정보가 있다면  mDTO를 세션으로 전달. -> 세션에 담긴 dto를 갖고 interceptor에서 유효성 검사.
			session.setAttribute("login", mDTO);
			nextPage = "redirect:/goodsList?gCategory=top";
		} else {
			model.addAttribute("mesg", "아이디 또는 비밀번호가 일치하지 않습니다."); // 로그인 정보가 없다면 mesg를 전달 및 loginForm으로 되돌림.
			nextPage = "loginForm";
		}
		return nextPage;
	}
}
