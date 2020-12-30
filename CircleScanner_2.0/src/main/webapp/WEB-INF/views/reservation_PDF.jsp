<%@page import="com.dto.IATAAirportDTO"%>
<%@page import="com.dto.ScheduleSearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdf</title>
<%
	//SearchServlet에서 담깃것들
		String seatGrade = (String) session.getAttribute("seatGrade");
		String originPlaceAcode = (String) session.getAttribute("originPlaceAcode");
		String destinationPlaceAcode = (String) session.getAttribute("destinatio	nPlaceAcode");
		
		//flightConfirmServlet에서 담긴것들
		ScheduleSearchDTO selected_D = (ScheduleSearchDTO) session.getAttribute("selected_D");
		ScheduleSearchDTO selected_A = (ScheduleSearchDTO) session.getAttribute("selected_A");
		
		IATAAirportDTO Airport_Names_Depart = (IATAAirportDTO) session.getAttribute("Airport_Names_Depart");
		IATAAirportDTO Airport_Names_Desti = (IATAAirportDTO) session.getAttribute("Airport_Names_Desti");
		System.out.println(Airport_Names_Depart);
		System.out.println(Airport_Names_Desti);
//		session.setAttribute("p_sex", p_sex);
//		session.setAttribute("p_passportNum", p_passportNum);
//		session.setAttribute("p_passportExpirationdate", p_passportExpirationdate);
//		session.setAttribute("p_nationality", p_nationality);
//		session.setAttribute("p_issuecountry", p_issuecountry);
		String p_lastname[] = (String[]) session.getAttribute("p_lastname");
		String p_firstname[] = (String[]) session.getAttribute("p_firstname");
		
		int passenger = (int) session.getAttribute("passenger");
%>
<!-- 1. 정의
    - webbrowser에서 보여지고 있는 상태 그대로 pdf로 저장한다.
2. 방법
    a. jspdf js 기능
      - jdspdf        : html, 이미지, canvas객체를 pdf로 변환해주는 라이브러리
        html2canvas : html객체를 canvas로 변환해주는 라이브러리
      - 참고 url : https://blog.naver.com/rnjsrldnd123/221526274628
    b. self.print();
      - 인쇄버튼 누르면 출력 또는 pdf로 저장 가능
3. 이슈 및 특징
    가. jspdf를 통해서 html 객체를 바로 pdf로 변환할 수도 있지만, css가 깨지는 문제가 있어서 다음과 같은 순서로 작업을 진행
       1. html2canvas를 이용해 원하는 html 객체를 canvas 객체로 변환
       2. 변환된 canvas 객체를 png 이미지로 변환
       3. png 이미지를 기반으로 pdf 생성 및 로컬에 저장
    나. # html2canvas 사용 시 몇 가지 문제점입니다.
       1. float:left 속성이 있는 div는 canvas에 그려지지 않음 // 나는
       2. svg 이미지는 canvas에 그려지지 않음
       3. 하위 div의 display 속성이 block일 경우 그려지지 않음
출처: https://farmerkyh.tistory.com/1122 [농부지기] -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/reservation_pdf.css">
	<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
</head>
	<button id="create_pdf">pdf로 다운받기</button><br>
	<body>
	<input type="hidden" id="passenger" value="<%=passenger %>">
		<%
		for(int i=0; i<passenger; i++) {
		String p_fullName = p_lastname[i]+" " +p_firstname[i];
		%>
  		<div class='form'>
        <div class='sec1'>
            <div class='sec1_left'>
                <div class='sec1_left_top'>주식회사CIRCLE SCANNER</div><br>
                <div class='sec1_left_bottom'>박상헌(tel 051-465-7897)<br>
                parkteam81@gmail.com
                </div>			
            </div>
            <div class='sec1_right'>
                <div class='sec1_right_top'>e-Ticket Intinerary & Receipt</div>
                <div class='sec1_right_bottom'></div>
            </div>
        </div>
        <hr>
       
        <div class='back_img'>
            <div class='sec2'>
                <div class='sec2_left'>
                    <div class='sec2_left_1st'>승객성명</div><div class='sec2_left_2nd'>Passenger Name</div><div><%=p_fullName %></div>	<br>
                    <div class='sec2_left_1st'>예약번호</div><div class='sec2_left_2nd'>Booking Reference</div><div> 391-9060</div>	<br>
                    <div class='sec2_left_1st'>항공권번호</div><div class='sec2_left_2nd'>Ticket Number</div><div>0795185041194</div>
                </div>
                <div class='sec2_right'>광고</div>
            </div>
            <hr>
            <div class='sec3'>
                <div class='sec3_Itinerary'>여정 Itinerary</div>
            </div>
            <hr>
            <div class='sec4'>
                <div class='sec4_top'>
                    <div class='sec4_top_1st'>편명 Flight</div>
                    <div class='sec4_top_2nd'><%= selected_D.getAIRCRAFT_NAME() %> (예약반호:<%=selected_A.getSCHEDULE_ID() %>) Operated by PR(PHILIPPINE AIRLINES)</div>
                    <div class='sec4_top_3rd'>경유 Via: -</div>
                </div>
                <hr class='hr_dotted'>
                <div class='sec4_middle'>
                    <div class='sec4_middle_departure'>
                        <div class='sec4_middle_departure_1st'>출발 Departure</div>
                        <div class='sec4_middle_departure_2nd'><%=Airport_Names_Depart.getACITY_K() %>(<%=Airport_Names_Depart.getACITY_E() %>) <%=Airport_Names_Depart.getACOUNTRY_E() %></div>
                        <div class='sec4_middle_departure_3rd'><%=selected_D.getDEPART_DATE() %> Local Time</div>
                        <div class='sec4_middle_departure_4th'>Terminal No. : -</div>
                    </div>
                    <div class='sec4_middle_arrival'>
                        <div class='sec4_middle_departure_1st'>도착 Arrival</div>
                        <div class='sec4_middle_departure_2nd'><%=Airport_Names_Desti.getACITY_K() %>(<%=Airport_Names_Desti.getACITY_E() %>) <%=Airport_Names_Desti.getACOUNTRY_E() %></div>
                        <div class='sec4_middle_departure_3rd'><%=selected_D.getARRIVE_DATE() %> Local Time</div>
                        <div class='sec4_middle_departure_4th'>Terminal No. : C2</div>
                    </div>
                </div>
                <hr class='hr_dotted'>
                <div class='sec4_bottom'>
                    <div class='sec4_bottom_1st'>예약등급 Class</div> <div class='sec4_bottom_2nd'>M (일반석)</div>
                    <div class='sec4_bottom_3rd'>항공권 유효기간</div> <div class='sec4_bottom_5th'>Not Valid Before</div> <div> - </div> <br>
                    <div class='sec4_bottom_1st'>예약상태 Status</div> <div class='sec4_bottom_4th'>OK(확 약)</div>
                    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <div class='sec4_bottom_5th'>Not Valid After</div> <div>04MAY11</div> <br>
                    <div class='sec4_bottom_1st'>운임 Fare Basis</div> <div class='sec4_bottom_2nd'>SLXPX15</div>
                    <div class='sec4_bottom_3rd'>수하물</div> <div class='sec4_bottom_5th'>Baggage</div> <div>20K</div>
                </div>
            </div>
            <hr>
            <div class='sec4'>
                <div class='sec4_top'>
                    <div class='sec4_top_1st'>편명 Flight</div>
                    <div class='sec4_top_2nd'><%=selected_A.getAIRCRAFT_NAME() %> (예약반호:<%=selected_A.getSCHEDULE_ID() %>) Operated by PR(PHILIPPINE AIRLINES)</div>
                    <div class='sec4_top_3rd'>경유 Via: -</div>
                </div>
                <hr class='hr_dotted'>
                <div class='sec4_middle'>
                    <div class='sec4_middle_departure'>
                        <div class='sec4_middle_departure_1st'>출발 Departure</div>
                        <div class='sec4_middle_departure_2nd'><%=Airport_Names_Desti.getACITY_K() %>(<%=Airport_Names_Desti.getACITY_E() %>) <%=Airport_Names_Desti.getACOUNTRY_E() %></div>
                        <div class='sec4_middle_departure_3rd'><%=selected_A.getDEPART_DATE() %> Local Time</div>
                        <div class='sec4_middle_departure_4th'>Terminal No. : -</div>
                    </div>
                    <div class='sec4_middle_arrival'>
                        <div class='sec4_middle_departure_1st'>도착 Arrival</div>
                        <div class='sec4_middle_departure_2nd'><%=Airport_Names_Depart.getACITY_K() %>(<%=Airport_Names_Depart.getACITY_E() %>) <%=Airport_Names_Depart.getACOUNTRY_E() %></div>
                        <div class='sec4_middle_departure_3rd'><%=selected_A.getARRIVE_DATE() %> Local Time</div>
                        <div class='sec4_middle_departure_4th'>Terminal No. : C2</div>
                    </div>
                </div>
                <hr class='hr_dotted'>
                <div class='sec4_bottom'>
                    <div class='sec4_bottom_1st'>예약등급 Class</div> <div class='sec4_bottom_2nd'>M (<%=seatGrade %>)</div>
                    <div class='sec4_bottom_3rd'>항공권 유효기간</div> <div class='sec4_bottom_5th'>Not Valid Before</div> <div> - </div> <br>
                    <div class='sec4_bottom_1st'>예약상태 Status</div> <div class='sec4_bottom_4th'>OK(확 약)</div>
                    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> <div class='sec4_bottom_5th'>Not Valid After</div> <div>04MAY11</div> <br>
                    <div class='sec4_bottom_1st'>운임 Fare Basis</div> <div class='sec4_bottom_2nd'>SLXPX15</div>
                    <div class='sec4_bottom_3rd'>수하물</div><div class='sec4_bottom_5th'>Baggage</div> <div>20K</div>		
                </div>
            </div>
        <hr>
        </div>
    </div>
    <%
	}
    %>
  </body>
</html>

<script type="text/javascript">
$('#create_pdf').click(function() {
	var passenger = $('#passenger').val(); //승객수 가져오기			
	var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성			
	for(let k=0; k <passenger; k++){		//for문 돌리면서 '.form'마다 추가하기				
	   	html2canvas($('.form')[k]).then(function(canvas) {	
	       var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
	       doc.addImage(imgData, 'PNG', +15, +20); //이미지를 pdf에 추가
	       if(k <=(passenger-2)){  //승객 추가마다 페이지 추가 하기
	       	doc.addPage();
	       }//end if
	       if(k==(passenger-1)){ //마지막 항공권까지 추가되면 pdf로 저장
	       	doc.save('sample.pdf');
	       }//end if	        
	   });//end html2canvas
	}//end for			
});
</script> 


