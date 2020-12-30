<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#same").on("click", function() {
			if (this.checked) {
				$("#orderName").val($("#mname").val());
				$("#sample4_postcode").val($("#mpost").val());
				$("#sample4_roadAddress").val($("#maddress1").val());
				$("#sample4_jibunAddress").val($("#maddress2").val());
				$("#phone").val($("#mphone").val());
			} else {
				$("#orderName").val("");
				$("#sample4_postcode").val("");
				$("#sample4_roadAddress").val("");
				$("#sample4_jibunAddress").val("");
				$("#phone").val("");
			}
		});
	});
</script>

<!-- 주문 완료 페이지에 들어갈 항목들을 hidden으로 전달 -->
<form name="myForm" method="get" action="loginCheck/orderDone">
	<input type="hidden" name="gCode" 		value="${cDTO.gCode}"/>
	<input type="hidden" name="gName" 		value="${cDTO.gName}"/>
	<input type="hidden" name="gPrice" 		value="${cDTO.gPrice}"/>
	<input type="hidden" name="gSize" 		value="${cDTO.gSize}"/>
	<input type="hidden" name="gColor" 		value="${cDTO.gColor}"/>
	<input type="hidden" name="gAmount" 	value="${cDTO.gAmount}"/>
	<input type="hidden" name="gImage" 		value="${cDTO.gImage}"/>
	<input type="hidden" name="orderNum" 	value="${cDTO.num}"/> <!-- 주문번호 -->

<!-- 주문 상품 확인 시작 -->	
	<table width="80%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td><b>주문 상품 확인</b></td>
		</tr>
		<tr>
			<td height="15">
		</tr>
		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
		<tr>
			<td height="5">
		</tr>
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_default" align="center"><strong>주문번호</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
						<td class="td_default" align="center"><strong>판매가</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
					</tr>
					<tr>
						<td colspan="5">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>
					<tr>
						<td class="td_default" width="80" align="center">${cDTO.num}</td>
						<td class="td_default" width="80"><img src="images/items/${cDTO.gImage}.gif" border="0" align="center" width="80" /></td>
						<td class="td_default" width="300" style='padding-left: 30px' align="left">${cDTO.gName}
							<br> <font size="2" color="#665b5f">[옵션 : 사이즈(${cDTO.gSize}), 색상(${cDTO.gColor})]</font></td>
						<td class="td_default" align="center" width="110">${cDTO.gPrice}원</td>
						<td class="td_default" align="center" width="90">${cDTO.gAmount}</td>
					</tr>
					<tr>
						<td colspan="5">
							<hr size="1" style="opacity: 20%;">
						</td>
					</tr>
					<tr>
						<td height="30"></td>
						<!-- <td class="td_default" align="right">총 결제 금액 :</td> -->
						<td class="td_default" align='right' colspan="4"><font color="red"><b>총 결제 금액 :&nbsp;${cDTO.gAmount*cDTO.gPrice}원</b></font></td>
					</tr>
				</table>
		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
<!-- 주문 상품 확인 시작 -->

<!--  고객 정보 시작-->
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>고객 정보</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">이름</td>
						<td height="35" class="td_default">
							<input class="input_default" style="border: 0" type="text" id="mname" size="20" maxlength="20" value="${mDTO.username}"/>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<input class="input_default" style="border: 0" type="text" id="mpost" size="6" maxlength="6" value="${mDTO.post}" readonly>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">주소</td>
						<td height="35" class="td_default">
							<input class="input_default" style="border: 0" type="text" id="maddress1" size="50" maxlength="200" value="${mDTO.addr1}" readonly></input><br>
							<input class="input_default" style="border: 0" type="text" id="maddress2" size="50" maxlength="200" value="${mDTO.addr2}" readonly></input>
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" style="border: 0" id="mphone" size="15" maxlength="15" value="${mDTO.phone1}${mDTO.phone2}${mDTO.phone3}"></input>
						</td>
					</tr>
				</table>							
			</td>
		</tr>
<!--  고객 정보 끝-->
		<tr>
			<td height="30">
		</tr>
		<tr> 
			<td class="td_default">
				<label for="same">
					<input type="checkbox" name="same" id="same"/> 배송지가 동일할 경우 선택하세요.
				</label>
			</td>
		</tr>
<!--  배송지 정보 시작-->
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td><b>배송지 정보</b></td>
		</tr>
		<tr>
			<td height="15">
		</tr>
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							
							이 름
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="orderName"
								name="orderName" size="20" maxlength="20" value=""></input>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">우편번호</td>
						<td height="35" class="td_default">
							<!-- 다음주소 시작-->
							<input type="text" name="post" id="sample4_postcode" placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소">
							<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide" style="color:#999"></span>
							<br>
							<!-- 다음주소 끝 -->
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">휴대전화</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="phone" name="phone" size="15" maxlength="15" value=""></input>
						</td>
					</tr>
				</table>							
			</td>
		</tr>
<!--  배송지 정보 끝-->

<!-- 결제 수단 시작 -->
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td><b>결제수단</b></td>
		</tr>
		<tr>
			<td height="15">
		</tr>
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							<label for="credit">
								<input type="radio" id="credit" name="payMethod" value="신용카드" checked/>신용카드
							</label>
							<label for="account">
								<input type="radio" id="account" name="payMethod" value="계좌이체"/>계좌이체
							</label>
							<label for="transfer">
								<input type="radio" id="transfer" name="payMethod" value="무통장입금"/>무통장입금
							</label>
						</td>
					</tr>
				</table>
<!-- 결제 수단 끝 -->				
			
			</td>
		</tr>
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td class="td_default" align="center">
				<input type='button' value='취소' onclick="javascript:history.back()">	
				<input type='submit' value='결제하기'>
			</td>
		</tr>
	</table>
</form>

<!-- 다음 주소 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>