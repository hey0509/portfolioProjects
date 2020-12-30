<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
h1 {
	color: black;
	font-size: 2rem;
	text-decoration: none;
	font-weight: bold;
	font-family: JetBrains Mono;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	// 총 가격 계산을 위한 함수
	function totalxxx() {
		var totalSum = 0;
		$(".sum").each(function(idx, data) {
			totalSum += Number.parseInt($(data).text());
		});
		$("#totalSum").text(totalSum);
	}

	$(document).ready(function() {
		totalxxx();

		//orderBtn 주문버튼
		$(".orderBtn").on("click", function() {
			var num = $(this).attr("data-num");
			location.href = "loginCheck/orderConfirm?num=" + num;
		});

		//delAllCart 전체삭제
		$("#delAllCart").on("click", function() {
			$("form").attr("action", "loginCheck/delAllCart");
			$("form").submit();
		});

		// cartDelete 개별삭제
		$(".deleteBtn").on("click", function() {
			var num = $(this).attr("data-num");
			var xxx = $(this);
			$.ajax({
				url : "loginCheck/cartDelete",
				type : "get",
				dataType : "text",
				data : {
					num : num
				},
				success : function(data, status, xhr) {
					console.log("success");
					xxx.parents().filter("tr").remove(); // tr tag를 삭제할 때 비동기로 처리
					totalxxx();
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
		});

		// 체크박스 전체 선택
		$("#allCheck").on("click", function() {
			var result = this.checked;
			$(".check").each(function(idx, data) {
				this.checked = result;
			});
		});

		// 장바구니 업데이트
		$(".updateBtn").on("click", function() {
			var num = $(this).attr("data-num"); // 번호 -> ${x.num}
			var gAmount = $("#cartAmount" + num).val(); // 수량 -> id="cartAmount${x.num}"
			var gPrice = $(this).attr("data-price"); // 가격 -> 
			$.ajax({
				type : "get",
				url : "loginCheck/cartUpdate",
				dataType : "text",
				data : {
					num : num,
					gAmount : gAmount
				},
				success : function(data, status, xhr) {
					var sum = parseInt(gAmount) * parseInt(gPrice); // 성공시 합계만 변경
					$("#sum" + num).text(sum);
					totalxxx();
				},
				error : function(xhr, status, error) {
					console.log("error");
				} // end error
			}); // end ajax
			console.log(num, gAmount);
		});
	});
</script>

<table width="90%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td colspan="2" class="td_default">&nbsp;&nbsp;&nbsp;
			<font size="5" style="text-align: center;"><b>- Cart List -</b></font>
		</td>
	</tr>
	<tr>
		<td height="15">
	</tr>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="7">
	</tr>
	<tr>
		<td class="td_default" align="center">
			<label for="allCheck">
			<input type="checkbox" name="allCheck" id="allCheck"><strong>전체선택</strong></label>
		</td>
		<td class="td_default" align="center">
			<strong>주문번호</strong>
		</td>
		<td class="td_default" align="center" colspan="2">
			<strong>상품정보</strong>
		</td>
		<td class="td_default" align="center">
			<strong>판매가</strong>
		</td>
		<td class="td_default" align="center" colspan="2">
			<strong>수량</strong>
		</td>
		<td class="td_default" align="center">
			<strong>합계</strong>
		</td>
	</tr>
	<tr>
		<td height="7">
	</tr>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td>
			<form name="myForm">
			<c:forEach var="x" items="${cartList}" varStatus="status">
				<tr>
					<td class="td_default" width="150" align="center">
						<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> 
						<input type="checkbox" name="check" id="check81" class="check" value="${x.num}">
					</td>
					<td class="td_default" width="150" align="center">${x.num}</td>
					<td class="td_default" width="80"><img src="images/items/${x.gImage}.gif" border="0" align="center" width="80" /></td>
					<td class="td_default" width="300" style='padding-left: 30px'><b>${x.gName}</b><br>
						<font size="2" color="#665b5f">[옵션 : 사이즈(${x.gSize}), 색상(${x.gColor})]
					</font></td>
					<td class="td_default" align="center" width="110">
						<font size="2px">${x.gPrice}원</font>
					</td>
					<td class="td_default" align="right" width="20">
						<input class="input_default" type="text" name="cartAmount" id="cartAmount${x.num}" style="text-align: right" maxlength="3" size="2" value="${x.gAmount}"/>
					</td>
					<td class="td_default" align="center">
						<input type="button" value="수정" class="updateBtn" data-num="${x.num}" data-price="${x.gPrice}" />
					</td>
					<td class="td_default" align="center" width="80" style='padding-left: 5px'>
						<font color="red" size="2px"><b><span class="sum" id="sum${x.num}">${x.gPrice*x.gAmount}</span>원</b></font>
					</td>
					<td>
						<input type="button" value="주문" class="orderBtn" data-num="${x.num}">
					</td>
					
					<td class="td_default" align="center" width="30" style='padding-left: 10px'>
						<input type="button" id="xx${x.num}" class="deleteBtn" data-num="${x.num}" value="삭제">
					</td>
					<td height="10"></td>
				</tr>
			</c:forEach>
			</form>
		</td>
	</tr>
		<tr>
		<td colspan="8" style="text-align: right;">
			총합:&nbsp;<b><font color="blue" style="text-decoration: underline;"><span id="totalSum"></span></font></b>원
		</td>
	</tr>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td align="center" colspan="5"><a class="a_black" href="javascript:orderAllConfirm(myForm)">전체 주문하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="#" id="delAllCart">선택 삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="goodsList?gCategory=top">계속 쇼핑하기</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td height="20">
	</tr>

</table>
