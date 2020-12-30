package com.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.PassportInfoBodyDTO;
import com.dto.ReservationDTO;
import com.dto.ReservationInfoDTO;
import com.service.ReservationService;

@Controller
public class PayController {
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/passesngerInfo_pay")
	public String passesngerInfo_pay(@RequestParam("pricePerPes") String pricePerPes, HttpSession session) {
		session.setAttribute("pricePerPes", pricePerPes);
		return "passengerInfo_pay";
	}
	
	@RequestMapping("/kakaoPay_ready")
	public String kakaoPay_ready(ReservationInfoDTO reservationInfoDTO, PassportInfoBodyDTO passportInfoBodyDTO, HttpSession session) throws ServletException, IOException {
		System.out.println(1);
		updateReservationInfo(reservationInfoDTO, passportInfoBodyDTO, session);
		System.out.println(2);
		int passenger = (int) session.getAttribute("passenger");
		int totalPriceInt = (int)session.getAttribute("totalPriceInt");
		
		//받아온 값중 결제정보에 넣을 값 파싱
		String cid = "TC0ONETIME"; //고정값
		String partner_order_id = "partner_order_id"; //고정값
		String partner_user_id = "partner_user_id"; //고정값
		
		String query = "cid=" + cid;
		query += "&partner_order_id=" + partner_order_id;
		query += "&partner_user_id=" + partner_user_id;
		query += "&item_name=" + "항공권예약"; //상품이름
		query += "&item_code=" + "qpqpqpqpqpqp"; //상품코드
		query += "&quantity=" + passenger; //상품수량 passengerNum
		query += "&total_amount=" + totalPriceInt; //전체 결제금액
		query += "&vat_amount=" + "0"; //부가세 금액
		query += "&tax_free_amount=" + "0"; //비과세 금액
		query += "&approval_url=" + "http://localhost:8090/CircleScanner/kakaopay_approval";  //결제 완료시 요청할 url, Kakaopay_approval.java로 이동
		query += "&fail_url=" + "http://localhost:8090/"; //결제 실패시 요청할 url
		query += "&cancel_url=" + "http://localhost:8090/"; //결제 취소시 요청할 url
		
		String getTID = getHttpConnection("https://kapi.kakao.com/v1/payment/ready", query); //아래getHttpConnection메소드에 넘겨주기 POST요청
		//System.out.println("getTID=="+getTID);
		
		JSONObject jObject = new JSONObject(getTID); //응답받은 값은 JSON객체이므로 형변환
		String tid = jObject.getString("tid"); //JSON객체에서 tid값만 뽑아오기
		String redirect = jObject.getString("next_redirect_pc_url"); //JSON객체에서 next_redirect_url뽑아오기
		System.out.println(tid);
		System.out.println(redirect);
		
		session.setAttribute("tid", tid);
		session.setAttribute("cid", cid);
		session.setAttribute("partner_order_id", partner_order_id);
		session.setAttribute("partner_user_id", partner_user_id);
//		response.sendRedirect(redirect); // redirect주소는 카카오페이결제 화면임.
		return "redirect:"+redirect;
	}
	private String getHttpConnection(String uri, String param) throws ServletException, IOException {
		System.out.println("uri=="+uri); //API url주소
		System.out.println("pram=="+param); //API에 넘겨줄 데이터 
		URL url = new URL(uri); //API주소 URL로 변환
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection(); //URL로 Connection하기
		conn.setRequestMethod("POST"); //데이터 넘기는 방식 POST로 설정
		
		String Authorization = "KakaoAK c3a482f6890e0812c8551f5c9902f41f"; //API사용하는 key값
		String type = "application/x-www-form-urlencoded;charset=UTF-8"; //API사용하는 데이터형식
		conn.setRequestProperty("Authorization", Authorization); //HEAD에 따로 담아야 함.
		conn.setRequestProperty("Content-type", type); //HEAD에 따로 담아야 함.
		conn.setDoOutput(true);
		conn.setDoInput(true);
		try (OutputStream stream = conn.getOutputStream()) {
			try (BufferedWriter wd = new BufferedWriter(new OutputStreamWriter(stream))) {
				wd.write(param);
			}
		}
		int responseCode = conn.getResponseCode(); // 서버 응답코드, 200이면 성공
		System.out.println(responseCode);

		String line;
		StringBuffer buffer = new StringBuffer();
		String TID = "";
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
					TID += line + "\r"; // 응답받은 값을 String으로 받아옴
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("TID=="+TID);
		return TID; //응답받아온 String형태의 값 리턴
	}
	
	@RequestMapping(value = "/kakaopay_approval")
	public String Kakaopay_approval(@RequestParam String pg_token, HttpSession session) throws ServletException, IOException {
		String cid = (String)session.getAttribute("cid");
		String tid = (String)session.getAttribute("tid");
		String partner_order_id = (String)session.getAttribute("partner_order_id");
		String partner_user_id = (String)session.getAttribute("partner_user_id");
		String payload = "aaaaaaaaaaaaa";//결제 승인 요청에 대해 저장하고 싶은 값,
		String query = "cid=" + cid;
		query += "&tid=" + tid;
		query += "&partner_order_id=" + partner_order_id;
		query += "&partner_user_id=" + partner_user_id;
		query += "&pg_token=" + pg_token;	
		//카카오페이 api승인 요청, 요청값 approval에 파싱
		String approval = getHttpConnection("https://kapi.kakao.com/v1/payment/approve", query); //POST요청
		System.out.println("approval"+approval);
		
		//승인값(approval) 데이터 가공
		JSONObject jObject = new JSONObject(approval);
		String aid = jObject.getString("aid");
		String payment_method_type = jObject.getString("payment_method_type");
		JSONObject amount = jObject.getJSONObject("amount");
			int total = amount.getInt("total");
			int tax_free = amount.getInt("tax_free");
			int vat = amount.getInt("vat");
			int point = amount.getInt("point");
			int discount = amount.getInt("discount");
		String item_name = jObject.getString("item_name");
		String item_code = jObject.getString("item_code");
		int quantity = jObject.getInt("quantity");
		String created_at = jObject.getString("created_at");
		String approved_at = jObject.getString("approved_at");
		
		System.out.println("amount=="+amount);
		System.out.println("total=="+total);
		
		session.setAttribute("total", total);
		
		makeReservation(session);
		return "redirect:reservationComplete";
	}
	
	
	public void updateReservationInfo(ReservationInfoDTO reservationInfoDTO, PassportInfoBodyDTO passportInfoBodyDTO, HttpSession session) {
//		https://krespo.net/167
//		https://blog.seotory.com/post/2016/07/spring-request-array-data
		session.setAttribute("reservationInfoDTO", reservationInfoDTO);
		session.setAttribute("passportInfoBodyDTO", passportInfoBodyDTO);
		System.out.println(reservationInfoDTO);
		System.out.println(passportInfoBodyDTO);
		
		int passenger = (int) session.getAttribute("passenger");
		session.setAttribute("r_name", reservationInfoDTO.getR_name());
		session.setAttribute("r_email", reservationInfoDTO.getR_email());
		session.setAttribute("r_phone", reservationInfoDTO.getR_phone());
		
		String p_lastname[] = new String[passenger];
		String p_firstname[] = new String[passenger];
		String p_sex[] = new String[passenger];
		
		String p_passenger[] = new String[passenger];
		String p_birthday[] = new String[passenger];
		String p_passportNum[] = new String[passenger];
		String p_passportExpirationdate[] = new String[passenger];
		String p_nationality[] = new String[passenger];
		String p_issuecountry[] = new String[passenger];
		
		for(int i=0; i<passenger;i++) {
			p_lastname[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_lastname();
			p_firstname[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_firstname();
			p_sex[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_sex();
			// passengerInfo end
			// passportInfo
			 p_passenger[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_passenger();
			 p_birthday[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_birthday();
			 p_passportNum[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_passportNum();
			 p_passportExpirationdate[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_passportExpirationdate();
			 p_nationality[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_nationality();
			 p_issuecountry[i] = passportInfoBodyDTO.getList_PassportInfoBodyDTO().get(i).getP_issuecountry();
		}
		session.setAttribute("p_lastname", p_lastname);
		session.setAttribute("p_firstname", p_firstname);
		session.setAttribute("p_sex", p_sex);
		session.setAttribute("p_passenger", p_passenger);
		session.setAttribute("p_birthday", p_birthday);
		session.setAttribute("p_passportNum", p_passportNum);
		session.setAttribute("p_passportExpirationdate", p_passportExpirationdate);
		session.setAttribute("p_nationality", p_nationality);
		session.setAttribute("p_issuecountry", p_issuecountry);
	}
	
	public String makeReservation(HttpSession session) {
		
		String RESERVATION_DATE = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"));
		String RESERVATION_ID = reservationService.getReservation_Id(RESERVATION_DATE);
		
		// passengerInfo
		String r_name = (String) session.getAttribute("r_name");
		String r_email = (String) session.getAttribute("r_email");
		String r_phone = (String) session.getAttribute("r_phone");
		int totalPriceInt = (int) session.getAttribute("totalPriceInt");
		
		String paystate = "TRUE";
		
		ReservationDTO rdto = new ReservationDTO(RESERVATION_ID, r_name, r_email, r_phone, totalPriceInt, paystate, RESERVATION_DATE);
		System.out.println("111" + rdto);
		
		int n = reservationService.updateReservation(rdto);
		
		String nextPage = "main";
		if(n==1) {
			session.setAttribute("rdto", rdto);
			System.out.println(rdto);
			nextPage = "reservationComplete";
		} 
		
		return nextPage;
	}
	
	
}
