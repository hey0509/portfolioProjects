<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.ScheduleSearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%-- ${path}/resources/ --%>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<section>
        <div class="wrap">
            <div class="search__main-wrap">
                <!-- SEARCH FILTER -->
                <section>
                    <div class="wrap">
                        <div class="filter__wrap">
                            <ul class="filter__list">
                                <li>
                                    <p class="filter__title">경유<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">직항</p>
                                                <p class="filter__price">₩1,164,633</p>
                                            </div>    
                                        </div>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">1회 경유</p>
                                                <p class="filter__price">₩1,164,633</p>
                                            </div>    
                                        </div>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">2번 이상 경유</p>
                                                <p class="filter__price">₩1,164,633</p>
                                            </div>    
                                        </div>
                                    </div>

                                    <p class="filter__title">변경 가능 항공권<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">변경 가능 항공권만 보기</p>
                                            </div>    
                                        </div>
                                    </div>

                                    <p class="filter__title">COVID-19 안전도 평점<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">5/5</p>
                                            </div>    
                                        </div>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">4/5</p>
                                            </div>    
                                        </div>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">3/5 또는 이하</p>
                                            </div>    
                                        </div>
                                    </div>
                                    
                                    <p class="filter__title">출발 시간대 설정<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div id="time-range">
                                                <p>가는날 출발시간</p>
                                                <span class="slider-time">오전12:00</span> - <span class="slider-time2">오후11:59</span>
                                                <div class="sliders_step1">
                                                    <div id="slider-range1"></div>
                                                </div>
                                                <br>
                                                <p>오는날 출발시간</p>
                                                <span class="slider-time3">오전12:00</span> - <span class="slider-time4">오후11:59</span>
                                                <div class="sliders_step1">
                                                    <div id="slider-range2"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <p class="filter__title">총 소요 시간<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div id="time-range">
                                                <p>총 소요시간</p>
                                                <span class="slider-time5">오전12:00</span> - <span class="slider-time6">오후11:59</span>
                                                <div class="sliders_step1">
                                                    <div id="slider-range3"></div>
                                                </div>
                                            </div>   
                                        </div>
                                    </div>

                                    <p class="filter__title">항공사<span>▼</span></p>
                                    <div class="filter__con">
                                        <div class="aliance">
                                            <div class="filter__con-item2">
                                                <button>모두 선택</button><button>모두 지우기</button>
                                            </div>
                                            <div>
                                                <button>스타 얼라이언스</button><br>
                                                <button>스카이팀</button><br>
                                                <button>원월드</button>
                                            </div>
                                            <br>
                                        <div class="abc">
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">Ethiopian Airlines</p>
                                                <p class="filter__price">₩1,164,633</p>
                                            </div>    
                                        </div>

                                        <div class="abc">
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">Interjet</p>
                                                <p class="filter__price">₩1,164,633</p>
                                            </div>    
                                        </div>

                                        <div class="abc">
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">대한항공 (KAL)</p>
                                                <p class="filter__price">₩1,164,633</p>
                                            </div>    
                                        </div>
                                        </div>
                                    </div>

                                    <p class="filter__title">공항<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">출국 및 입국 시 <b>같은 공항</b> 이용</p>
                                            </div>    
                                        </div>
                                        <h4>도착지</h4><br>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">EWR</p>
                                                <p class="filter__price">뉴욕뉴왁</p>
                                            </div>    
                                        </div>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">JFK</p>
                                                <p class="filter__price">뉴욕존에프케네디</p>
                                            </div>    
                                        </div>
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">LGA</p>
                                                <p class="filter__price">뉴욕라과디아</p>
                                            </div>    
                                        </div>
                                    </div>

                                    <p class="filter__title">친환경 항공편<span>▼</span></p>
                                    <div class="filter__con">
                                        <div>
                                            <div class="filter__con-item">
                                                <input type="checkbox" name="" id="">
                                            </div>
                                            <div>
                                                <p class="filter__title-item">이산화탄소 배출량이 낮은 항공편만 보기</p>
                                            </div>    
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
                <!-- SEARCH FILTER -->

                <!-- SEARCH RESULT -->
                <section>
                    <div class="result__wrap">
                        <div class="result__top">
                            <div>
                                <h4><%= ((List<ScheduleSearchDTO>) session.getAttribute("list_D")).size() %>개의 결과</h4>
                            </div>
                            <div>
                                	정렬기준
                                <select name="" id="">
                                    <option value="">추천순</option>
                                    <option value="">최저가순</option>
                                    <option value="">최단여행시간순</option>
                                    <option value="">출국:출발시간</option>
                                    <option value="">귀국:출발시간</option>
                                </select>
                            </div>
                        </div>

                        <div class="covid__information">
                            <button>
                                <h2>코로나바이러스(COVID-19) 조치</h2><br>
                                <p>변경 가능한 항공권 - 취소 또는 날짜 변경이 가능할 수 있습니다.</p><br>
                                <p>안전 조치 - 탑승 전 본인의 상태가 어떤지 정확히 확인하시기 바랍니다.</p><br>
                                <p class="p__small">항공사 약관을 포함한 더 자세한 정보를 보시려면 항공편을 선택하세요.</p>
                            </button>
                        </div>

						<!-- 화면 중앙 검색 결과 필터 버튼 -->
                        <div class="filter__button-wrap">
                            <button>
                                <p>추천순</p><br>
                                <div><span>￦457,100</span></div><br>
                                <p>2시간 45분(평균)</p>
                            </button>
                            <button>
                                <p>최저가</p><br>
                                <div><span>￦457,100</span></div><br>
                                <p>2시간 45분(평균)</p>
                            </button>
                            <button>
                                <p>최단여행시간</p><br>
                                <div><span>￦457,100</span></div><br>
                                <p>2시간 45분(평균)</p>
                            </button>
                        </div>
    				
<%
int passenger = (int)session.getAttribute("passenger");

List<ScheduleSearchDTO> list_D = (List<ScheduleSearchDTO>) session.getAttribute("list_D");
List<ScheduleSearchDTO> list_A = (List<ScheduleSearchDTO>) session.getAttribute("list_A");

for(int i = 0; i < list_D.size(); i++){
	ScheduleSearchDTO ssDTO = list_D.get(i);
	String SCHEDULE_ID = ssDTO.getSCHEDULE_ID();
	String DEPARTURE_ACODE = ssDTO.getDEPARTURE_ACODE();
	String DESTINATION_ACODE = ssDTO.getDESTINATION_ACODE();
	String DEPART_DATE = ssDTO.getDEPART_DATE();
	String ARRIVE_DATE = ssDTO.getARRIVE_DATE();
	String AIRLINE_NAME = ssDTO.getAIRLINE_NAME();
	String AIRCRAFT_NAME = ssDTO.getAIRCRAFT_NAME();
	String PRICE = ssDTO.getPRICE();
	String DURATION_OF_TIME = ssDTO.getDURATION_OF_TIME();
	
	int hour_DOT = Integer.parseInt(DURATION_OF_TIME)/60; 
	int min_DOT = Integer.parseInt(DURATION_OF_TIME)%60; 
	
	DecimalFormat df = new DecimalFormat();
	String list_D_priceFormat = df.format(Integer.parseInt(PRICE));
	
	int priceInt = Integer.parseInt(PRICE);
	
	DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	DateFormat outputFormat = new SimpleDateFormat("a KK:mm");
	/* 시간 변환 */
// 	System.out.println(outputFormat.format(inputFormat.parse(DEPART_DATE)));
// 	System.out.println(outputFormat.format(inputFormat.parse(ARRIVE_DATE)));
//------------------------------------------------------------------------------------------------	
ScheduleSearchDTO ssDTO2 = list_A.get(i);
	String SCHEDULE_ID2 = ssDTO2.getSCHEDULE_ID();
	String DEPARTURE_ACODE2 = ssDTO2.getDEPARTURE_ACODE();
	String DESTINATION_ACODE2 = ssDTO2.getDESTINATION_ACODE();
	String DEPART_DATE2 = ssDTO2.getDEPART_DATE();
	String ARRIVE_DATE2 = ssDTO2.getARRIVE_DATE();
	String AIRLINE_NAME2 = ssDTO2.getAIRLINE_NAME();
	String AIRCRAFT_NAME2 = ssDTO2.getAIRCRAFT_NAME();
	String PRICE2 = ssDTO2.getPRICE();
	String DURATION_OF_TIME2 = ssDTO2.getDURATION_OF_TIME();
	
	int hour_DOT2 = Integer.parseInt(DURATION_OF_TIME2)/60; 
	int min_DOT2 = Integer.parseInt(DURATION_OF_TIME2)%60; 
	
	DecimalFormat df2 = new DecimalFormat();
	String list_A_priceFormat = df.format(Integer.parseInt(PRICE2));
	
	String total_priceFormat = df.format(Integer.parseInt(PRICE)+Integer.parseInt(PRICE2));
	
	int priceInt2 = Integer.parseInt(PRICE2);
	
	DateFormat inputFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	DateFormat outputFormat2 = new SimpleDateFormat("a KK:mm");
	/* 시간 변환 */
// 	System.out.println(outputFormat.format(inputFormat.parse(DEPART_DATE2)));
// 	System.out.println(outputFormat.format(inputFormat.parse(ARRIVE_DATE2)));

	int totalPriceInt = (priceInt*passenger)+(priceInt2*passenger);
	String totalPrice = df.format((priceInt*passenger)+(priceInt2*passenger));
%>
						<!-- 항공권 검색 결과. 여기부터 루프 돌려서 반복 -->
						<form action="flightConfirm" method="get" id="reservation_form">
							<input type="hidden" name="i" id="i" value="<%=i%>">
							<input type="hidden" name="list_D_priceFormat" id="list_D_priceFormat" value="<%=list_D_priceFormat%>"> 
							<input type="hidden" name="list_A_priceFormat" id="list_A_priceFormat" value="<%=list_A_priceFormat%>"> 
							<input type="hidden" name="total_priceFormat" id="total_priceFormat" value="<%=total_priceFormat%>"> 
							<input type="hidden" name="totalPriceInt" id="totalPriceInt" value="<%=totalPriceInt%>">
							<input type="hidden" name="totalPrice" id="totalPrice" value="<%=totalPrice%>">
							
	                        <div class="flight__result">
	                            <div class="result__information">
	                                <div class="flight__information">
	                                    <div class="ticket__depart">
	                                        <img alt="Airline_images" id="Airline_images_d" src="${path}/resources/images/<%=AIRLINE_NAME.trim()%>.jpg">
                                            <div>
	                                            <p><%=outputFormat.format(inputFormat.parse(DEPART_DATE)) %></p>
	                                            <p class="DEPARTURE_ACODE"><%=DEPARTURE_ACODE %></p>
	                                        </div>
	                                        <div>
	                                            <p><%=hour_DOT %>시간 <%=min_DOT %>분</p>
	                                            <div class="directory__hypen"></div>
	                                            <p>직항</p>
	                                        </div>
	                                        <div>
	                                            <p><%= outputFormat.format(inputFormat.parse(ARRIVE_DATE)) %></p>
	                                            <p class="DESTINATION_ACODE"><%=DESTINATION_ACODE %></p>
	                                        </div>
	                                    </div>
	
	                                    <div class="ticket__depart">
	                                        <img alt="Airline_images" id="Airline_images_a" src="${path}/resources/images/<%=AIRLINE_NAME2.trim()%>.jpg">
	                                        <div>
	                                            <p><%=outputFormat2.format(inputFormat2.parse(DEPART_DATE2)) %></p>
	                                            <p><%=DEPARTURE_ACODE2 %></p>
	                                        </div>
	                                        <div>
	                                            <p><%=hour_DOT2 %>시간 <%=min_DOT2 %>분</p>
	                                            <div class="directory__hypen"></div>
	                                            <p>직항</p>
	                                        </div>
	                                        <div>
	                                            <p><%= outputFormat2.format(inputFormat2.parse(ARRIVE_DATE2)) %></p>
	                                            <p><%=DESTINATION_ACODE2 %></p>
	                                        </div>
	                                    </div>
	                                    <div>
	                                        <hr>
	                                    </div>
	                                </div>
	                                <div class="result__option">
	                                    <div>
	                                        <p>변경할 수 있는 항공권</p>
	                                    </div>
	                                    <div>
	                                        <p>5/5 COVID-19 안전 조치 평점</p>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="result__price">
	                                <p>￦<%=total_priceFormat %></p>
	                                <p>총 가격 ￦<%=totalPrice%></p>
	                                <button type="submit" class="orderBtn">선택→</button>
	                            </div>
	                        </div>
	                        <!-- 항공권 검색 결과. 여기까지 루프 돌려서 반복 -->
                        </form>
                        <%
                        }
                        %>
                    </div>
                </section>
                <!-- SEARCH RESULT -->      
            </div>
        </div>    

</section>