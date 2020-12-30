<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.dto.GoodsDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.a {
	text-decoration: line-through;
	color: black;
}
</style>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="800" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<c:forEach var="dto" items="${goodsList}" varStatus="status">
					<!-- "goodsList"키의 ArrayList를 get해서 for문 루프로 하나의 GoodsDTO를 "dto"로 저장, status: 인스턴스 번호 -->
						<td>
							<table style='padding:30px'>
								<tr>
									<td>
										<a href="goodsRetrieve?gCode=${dto.gCode}"><!-- 이미지링크 --> 
											<img src="images/items/${dto.gImage}.gif" border="0" align="center" width="200">
										</a>
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href="goodsRetrieve?gCode=${dto.gCode}">${dto.gName}<br></a>
										<font color="gray">--------------------</font>
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align ="center">${dto.gContent}</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_original" align="center"><p class="a">${dto.getgPrice()}원</p></td>
								</tr>
								<tr>
									<td class="td_red" align ="center">
										<font color="red"><strong>${dto.getgPrice()*0.8}원</strong></font>
									</td>
								</tr>
							</table>
						</td>
						
						<!-- 한줄에 4개씩 보여주기 -->	
						<c:if test="${status.count%4==0}">
					       	<tr>
					       		<td height="10">
					      	</tr>
						</c:if>		
					</c:forEach>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
    