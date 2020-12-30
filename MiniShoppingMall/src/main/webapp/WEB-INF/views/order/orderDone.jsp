<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table width="70%" cellspacing="0" cellpadding="0">
	<tr>
		<td height="30">
	</tr>
	<!-- 주문완료시작 -->
	<tr>
		<td><font size="5px"><b>주문완료</b></font></td>
	</tr>
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>
	<tr>
		<td height="7">
	</tr>
	<tr>
		<td class="td_default" align="center"><b>${oDTO.userid}</b> 님의 주문이 안전하게 처리되었습니다.</td>
	</tr>
	<tr>
		<td height="40">
	</tr>
	<tr>
		<td>
			<hr>
		</td>
	</tr>
	<tr>
		<td height="40">
	</tr>
	<tr>
	<!-- 주문완료끝 -->
	
	<!-- 상품 및 배송정보 시작 -->
		<td class="td_default"><font size="5px"><b>상품 및 배송정보</b></font></td>
	</tr>
	<tr>
		<td height="15">
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"><strong>받으시는 분</strong></td>
					<td class="td_default" height="35">${oDTO.userid}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"><strong>주소</strong></td>
					<td class="td_default" height="35">${oDTO.addr1 }<br>
						&nbsp;(${oDTO.addr2})
					</td>
				</tr>
				<tr>
					<td class="td_default" height="35"><strong>휴대전화</strong></td>
					<td class="td_default" height="35">${oDTO.phone}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td width="250" class="td_default" height="35" align="center"><strong>상품명</strong></td>
					<td width="100" class="td_default" height="35" align="center"><strong>판매가</strong></td>
					<td class="td_default" width="50" height="35" align="center"><strong>수량</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>합계</strong></td>
				</tr>
				<tr>
					<td height="35" class="td_default">
						<span class="a_default">${oDTO.gName}</span>
					</td>
					<td height="35" class="td_default" align="center">
						<span  id = "price1">${oDTO.gPrice}</span>원
					</td>
					<td height="35" class="td_default" align="center">
						<span id = "num1">${oDTO.gAmount}</span><font style="color: gray;">ea</font>
					</td>
					<td height="35" class="td_default" align="center">
						<span><font color="red"><b>${oDTO.gPrice * oDTO.gAmount}</b></font></span>원
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="40">
	</tr>
		<tr>
		<td>
			<hr>
		</td>
	</tr>
	<tr>
		<td height="40">
	</tr>
	<tr>
	<!-- 상품 및 배송정보 끝 -->
	
	<!-- 결제정보 시작 -->
		<td class="td_default"><font size="5px"><b>결제정보</b></font></td>
	</tr>
	<tr>
		<td height="15">
	</tr>
	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse" bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 결제금액</td>
					<td class="td_default" height="35" align = 'right'> 
					<input type = 'text' id = 'total' style="border: 0; text-align: right; color: red; font-weight: bolder;" value = '${oDTO.gPrice*oDTO.gAmount}' readonly>원</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 결제수단</td>
					<td class="td_default" height="35" align = 'right'><span>${oDTO.payMethod}</span></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="40">
	</tr>
	<tr>
		<td height="40">
	</tr>
	<tr>
		<td class="td_default" align="center"><a class="a_default" href="loginCheck/cartList">주문조회 페이지로 이동</a></td>
	</tr>
	<tr>
		<td height="30">
	</tr>
	<!-- 결제정보 끝 -->
</table>