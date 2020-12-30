package com.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	// OrderSerivce ----------------------------------------------------
	
	// 주문 완료
	@Transactional
	public void orderDone(OrderDTO oDTO, int orderNum) {
		dao.orderDone(oDTO); // 주문 정보 저장 -> insert
		dao.cartDelete(orderNum); // 카트에서 삭제 - 두 처리를 tx 처리 => root-context.xml
		// tx-manager 등록 필요 => servlet-context.xml
	}

	// GoodsSerivce ----------------------------------------------------

	// 상품 목록 조회
	public List<GoodsDTO> goodsList(String gCategory) {
		List<GoodsDTO> list = dao.goodsList(gCategory);
		return list;
	}

	// 상품 목록 표기
	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO gDTO = dao.goodsRetrieve(gCode);
		return gDTO;
	}

	// CartService ----------------------------------------------------

	// 장바구니 담기
	public void cartAdd(CartDTO cDTO) {
		int n = dao.cartAdd(cDTO);
		System.out.println("insert Count => " + n);
	}

	// 장바구니 목록보기
	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = dao.cartList(userid);
		return list;
	}

	// 장바구니 수량수정
	public void cartUpdate(Map<String, String> map) {
		int n = dao.cartUpdate(map);
		System.out.println("update Count => " + n);
	}

	// 장바구니 개별삭제
	public void cartDelete(int num) {
		int n = dao.cartDelete(num);
		System.out.println("delete Count => " + n);
	}

	// 장바구니 선택삭제
	public int cartAllDel(List<String> list) {
		int n = dao.cartDelAll(list);
		System.out.println("deleteAll Count => " + n);
		return n;
	}

	// 주문하기
	public CartDTO orderConfirmByNum(String num) {
		CartDTO cDTO = dao.orderConfirmByNum(num);
		System.out.println("Confirm Count => " + cDTO);
		return cDTO;
	}

}
