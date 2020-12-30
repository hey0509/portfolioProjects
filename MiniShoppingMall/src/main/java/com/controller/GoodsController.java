package com.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.GoodsService;
import com.service.MemberService;

@Controller
public class GoodsController {

	@Autowired // service 자동주입
	GoodsService service;

	@Autowired
	MemberService mService;
	
	// Order Controller ---->

	@RequestMapping(value = "loginCheck/orderConfirm")
	public String orderConfirm(@RequestParam("num") String num, HttpSession session, RedirectAttributes xxx) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(userid); // 사용자 정보 가져오기
		CartDTO cDTO = service.orderConfirmByNum(num); // 장바구니 정보 가져오기
		xxx.addFlashAttribute("mDTO", mDTO); // request에 회원 정보 저장
		xxx.addFlashAttribute("cDTO", cDTO); // request에 카트 정보 저장
		return "redirect:../orderConfirm"; // servlet-context에 등록
	}
	
	@RequestMapping(value = "loginCheck/orderDone")
	public String orderDone(HttpSession session, RedirectAttributes xxx, OrderDTO oDTO, int orderNum) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		oDTO.setUserid(mDTO.getUserid()); // 사용자 ID설정
		//oDTO.setNum(orderNum); // 주문번호설정 => sequence 사용 X 경우
		service.orderDone(oDTO, orderNum); // tx처리 => service
		xxx.addFlashAttribute("oDTO", oDTO);
		return "redirect:../orderDone"; // servlet-context.xml 등록
	}
	
	// Goods Controller ---->
	
	@RequestMapping(value = "/goodsRetrieve") // -> view page
	@ModelAttribute("goodsRetrieve") // -> key value
	public GoodsDTO GoodsRetrieve(@RequestParam("gCode") String gCode) {
		GoodsDTO gDTO = service.goodsRetrieve(gCode);
		return gDTO;
	}

	@RequestMapping(value = "/goodsList")
	public ModelAndView goodsList(@RequestParam("gCategory") String gCategory) {
		if (gCategory == null) {
			gCategory = "top";
		}
		List<GoodsDTO> list = service.goodsList(gCategory);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
		mav.setViewName("main");
		return mav;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "loginCheck/delAllCart")
	public String delAllCart(@RequestParam("check") String[] check, RedirectAttributes attr, HttpSession session) {
		List<String> list = Arrays.asList(check);
		int n = service.cartAllDel(list);
		// 로그인 값 저장
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		List<CartDTO> list2 = service.cartList(userid);
		attr.addFlashAttribute("cartList", list2); // 리다이렉트시 데이터 유지
		return "redirect:../cartList";
	}
	
	// Cart Controller ---->
	
	// 장바구니 추가
	@RequestMapping(value = "/loginCheck/cartAdd")
	public String CartAdd(CartDTO cDTO, HttpSession session) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		cDTO.setUserid(mDTO.getUserid());
		session.setAttribute("mesg", cDTO.getgCode());
		service.cartAdd(cDTO);
		return "redirect:../goodsRetrieve?gCode=" + cDTO.getgCode();
	}
	
	// 장바구니 목록
	@RequestMapping(value = "/loginCheck/cartList")
	public String CartList(RedirectAttributes attr, HttpSession session) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		List<CartDTO> list = service.cartList(userid);
		attr.addFlashAttribute("cartList", list); // 리다이렉트시 데이터 유지
		return "redirect:../cartList"; // servelt-context.xml에 등록
	}
	
	// 장바구니 수량 수정
	@RequestMapping(value = "/loginCheck/cartUpdate")
	@ResponseBody
	public void cartUpdate(@RequestParam Map<String, String> map) {
		System.out.println(map);
		service.cartUpdate(map);
	}
	
	// 장바구니 개별 삭제
	@RequestMapping(value = "/loginCheck/cartDelete")
	@ResponseBody
	public void cartDelete(@RequestParam("num") int num) {
		System.out.println(num);
		service.cartDelete(num);
	}
}
