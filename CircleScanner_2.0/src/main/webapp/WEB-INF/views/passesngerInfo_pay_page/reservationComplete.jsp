<%@page import="com.dto.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dto.ScheduleSearchDTO"%>
<%@ page import="com.dto.IATAAirportDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
   
   // 2 FlightConfirm Servlet
   ScheduleSearchDTO selected_D = (ScheduleSearchDTO) session.getAttribute("selected_D");
   ScheduleSearchDTO selected_A =(ScheduleSearchDTO) session.getAttribute("selected_A");
   
   String ANAME_K_D = (String)session.getAttribute("ANAME_K_D");
   String ANAME_K_A = (String)session.getAttribute("ANAME_K_A");
   
   IATAAirportDTO Airport_Names_Depart = (IATAAirportDTO) session.getAttribute("Airport_Names_Depart");
   IATAAirportDTO Airport_Names_Desti = (IATAAirportDTO) session.getAttribute("Airport_Names_Desti");
   
   String airportKR_D_Depart = Airport_Names_Depart.getANAME_K();
   String airportKR_D_Desti = Airport_Names_Desti.getANAME_K();

   /* 요일 출력 */
   DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   DateFormat outputFormat = new SimpleDateFormat("a KK:mm");
   
   SimpleDateFormat sf = new SimpleDateFormat("yyyymmdd");
   Date myDate = sf.parse(selected_D.getDEPART_DATE());
   Date myDate_A = sf.parse(selected_A.getDEPART_DATE());
   Calendar cal = Calendar.getInstance();
   cal.setTime(myDate);
   String m_week = "";
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
   switch(dayOfWeek){
   case 1: m_week = "일"; break;
   case 2: m_week = "월"; break;
   case 3: m_week = "화"; break;
   case 4: m_week = "수"; break;
   case 5: m_week = "목"; break;
   case 6: m_week = "금"; break;
   case 7: m_week = "토"; break;
   }
   String getDay = m_week;
   
   int pricePerPesson = Integer.parseInt(selected_D.getPRICE()) +Integer.parseInt(selected_A.getPRICE());
   
   // 요일 가공
   // 가는편
   String selected_D_date1 = selected_D.getDEPART_DATE().substring(5, 7) + "월";
   String selected_D_date2 = selected_D.getDEPART_DATE().substring(8, 10) + "일";
   String selected_D_date = selected_D_date1 + selected_D_date2 +"(" + m_week + ")";
   // 오는편
   String selected_A_date1 = selected_A.getDEPART_DATE().substring(5, 7) + "월";
   String selected_A_date2 = selected_A.getDEPART_DATE().substring(8, 10) + "일";
   String selected_A_date = selected_A_date1 + selected_A_date2 +"(" + m_week + ")";
   
   /* by jung woo 20201202  */
   ReservationDTO rdto = (ReservationDTO) session.getAttribute("rdto");
   

%>

<section>
        <div class="wrap">
         <div class="reservation_complete_wrap">
            <div class="reservation_complete_message">
               <p>예약하신 <font color="#4075bf"><b>항공 일정 내역</b></font> 입니다</p>
               <p>예약번호는 <%=rdto.getRESERVATION_ID() %> 입니다.</p>
            </div>
            <div class="reservation_complete_warning">
               <p>탑승객의 Circle Scanner 마일리지 적립을 위해서는 Circle Scanner Club 회원번호를 입력해 주시거나 요청하셔야 합니다</p>
               <p>무통장 입금의 경우, 결제마감일 이전에 결제하지 않을 경우 동일요금, 조건으로 항공권 구매가 불가 합니다</p>
               <p>마감일은 항공사 사정으로 변경될 수 있으니 24시간 이내에 꼭 재확인 해주세요</p>
            </div>
         
            <div class="reservation_complete_result">
               <ul class="search_result">
                  <!-- RESULT LEFT -->
                  <li class="ticket_list">
                     <span class="label_blue label_box">가는편</span>
                     <p class="ticket_departure_box">
                        <strong><%=airportKR_D_Depart%></strong>
                        <span class="ico_itinerary"></span> 
                        <strong><%=airportKR_D_Desti%></strong>
                     </p> 
                     <span class="ticket_departure_date"><%=selected_D_date%></span> 
                     <span>
                        <span class="airline_img">
                        <%-- <img alt="Airline_images" src="images/<%=selected_D.getAIRLINE_NAME().trim()%>.jpg"> --%> </span>
                        <span class="airline_name"><em><%=selected_D.getAIRLINE_NAME()%></em>
                        <em class="depAirNm"><%=selected_D.getAIRCRAFT_NAME()%></em></span>
                     </span> 
                     <span class="ariline_date"> 
                        <span class="dep_time"><strong><%=outputFormat.format(inputFormat.parse(selected_D.getDEPART_DATE())) %></strong><em class="depAirCt"><%=selected_D.getDEPARTURE_ACODE()%></em></span> 
                        <span class="from_to"> 
                           <span class="ico_itinerary_lg"></span> <em class="time">소요시간</em>
                        </span> 
                        <span class="arr_time"><strong><%=outputFormat.format(inputFormat.parse(selected_D.getARRIVE_DATE())) %></strong><em class="arrAirCt"><%=selected_D.getDESTINATION_ACODE()%></em></span>
                     </span><%--  <strong class="total"><%= priceFormat1 %>원</strong> --%>
                  </li>
                  
                  <li class="ticket_list">
                     <span class="label_blue label_box">오는편</span>
                     <p class="ticket_departure_box">
                        <strong><%=airportKR_D_Desti%></strong><span class="ico_itinerary"></span><strong><%=airportKR_D_Depart%></strong>
                     </p>
                     <span class="ticket_departure_date"><%=selected_A_date %></span> 
                     <span>
                        <span class="airline_img">
                        <%-- <img alt="Airline_images" src="images/<%=selected_A.getAIRLINE_NAME().trim()%>.jpg"> --%> </span>
                        <span class="airline_name"><em><%=selected_A.getAIRLINE_NAME()%></em><em class="depAirNm"><%=selected_A.getAIRCRAFT_NAME() %></em></span>
                     </span> 
                     <span class="ariline_date"> 
                        <span class="dep_time"><strong><%=outputFormat.format(inputFormat.parse(selected_A.getDEPART_DATE())) %></strong>
                        <em class="depAirCt"><%=selected_D.getDESTINATION_ACODE()%></em></span> 
                        <span class="from_to"> 
                           <span class="ico_itinerary_lg"></span> <em class="time">소요시간</em>
                        </span> 
                        <span class="arr_time"><strong><%=outputFormat.format(inputFormat.parse(selected_A.getARRIVE_DATE())) %></strong><em class="arrAirCt"><%=selected_D.getDEPARTURE_ACODE()%></em></span>
                     </span> 
                     <%-- <strong class="total"><%=priceFormat2 %>원</strong> --%>
                  </li>
               </ul>
            </div>
                    
             <div class="reservation_complete_button">
                <a href="reservation_PDF"><b>e-ticket 출력하기</b></a>
            </div>
         </div>
           
           
      <!-- 예약확인하기 누르면 새창에서 열리고, 자식창에 닫기기능 추가 -->
        
        
        
        
        
<!--                예약 완료!
               항공권 정보 + 예약자/탑승객 정보 + 결제 정보
               = 바우처
   
               예약자 정보<br>
            <input type="text" name="p_name" id="p_name" placeholder="이름">이름<br>
            <input type="text" name="p_email1" id="p_email1" placeholder="이메일1">이메일1@
            <input type="text" name="p_email2" id="p_email2" placeholder="이메일2">이메일2@
                <select name="p_email2" id="p_email3">
                    <option value="daum.net">daum.net</option>
                    <option value="naver.com">naver.com</option>
                    <option value="" selected>직접입력</option>
                </select><br>
            <input type="text" name="p_phone" id="p_phone" placeholder="휴대전화">휴대전화<br>
            <br>
               탑승객 정보<br>
            <input type="text" name="p_lastname" id="p_lastname" placeholder="영문 성">영문 성<br>
            <input type="text" name="p_firstname" id="p_firstname" placeholder="영문 이름">영문 이름<br>
            <input type="text" name="p_sex" id="p_sex" placeholder="성별">성별<br>
            <input type="text" name="p_birthday" id="p_birthday" placeholder="생년월일">생년월일<br>
            <br>
                 결제 정보<br>
            <input type="text" name="p_price" id="p_price" placeholder="결제 금액">결제 금액<br>
            <input type="text" name="p_cardholdername" id="p_cardholdername" placeholder="카드소유주명">카드소유주명<br>
            <input type="text" name="p_cardnum1" id="p_cardnum1" placeholder="카드번호1">카드번호1<br>
            <input type="text" name="p_cardnum2" id="p_cardnum2" placeholder="카드번호2">카드번호2<br>
            <input type="text" name="p_cardnum3" id="p_cardnum3" placeholder="카드번호3">카드번호3<br>
            <input type="text" name="p_cardnum4" id="p_cardnum4" placeholder="카드번호4">카드번호4<br>
            <input type="text" name="p_cardexpiration" id="p_cardexpiration" placeholder="유효기간">유효기간<br>
            <input type="text" name="p_paymentplan" id="p_paymentplan" placeholder="할부기간">할부기간<br>
            <input type="text" name="p_passwd" id="p_passwd" placeholder="비밀번호">비밀번호<br>
            <input type="text" name="p_cardtype" id="p_cardtype" placeholder="카드소유관계">카드소유관계<br> -->
              
        </div>
    </section>