package com.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;

@Repository
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate template;

	// GoodsDAO
	// ==============================================================================

	public List<GoodsDTO> goodsList(String gCategory) {
		List<GoodsDTO> list = template.selectList("GoodsMapper.goodsList", gCategory);
		System.out.println(list);
		return list;
	}

	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO gDTO = template.selectOne("GoodsMapper.goodsRetrieve", gCode);
		return gDTO;
	}

	// CartDAO
	// ===============================================================================

	public int cartAdd(CartDTO cDTO) {
		int n = template.insert("CartMapper.cartAdd", cDTO);
		return n;
	}

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = template.selectList("CartMapper.cartList", userid);
		return list;
	}

	public int cartUpdate(Map<String, String> map) {
		int n = template.update("CartMapper.cartUpdate", map);
		return n;
	}

	public int cartDelete(int num) {
		int n = template.delete("CartMapper.cartDel", num);
		System.out.println("cartDelete Count => " + n);
		return n;
	}

	public int cartDelAll(List<String> list) {
		int n = template.delete("CartMapper.cartAllDel", list);
		return n;
	}

	public CartDTO orderConfirmByNum(String num) {
		CartDTO cDTO = template.selectOne("CartMapper.cartByNum", num);
		return cDTO;
	}

	public void orderDone(OrderDTO oDTO) {
		int n = template.insert("CartMapper.orderDone", oDTO);
		System.out.println("orderDone Count => " + n);
	}
}
