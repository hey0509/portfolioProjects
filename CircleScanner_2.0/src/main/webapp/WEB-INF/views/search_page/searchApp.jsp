<%@page import="com.dto.ScheduleSearchDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
<%
String originPlace = (String)session.getAttribute("originPlace");
String destinationPlace = (String)session.getAttribute("destinationPlace");

String originPlaceAcode = (String)session.getAttribute("originPlaceAcode");
String destinationPlaceAcode = (String)session.getAttribute("destinationPlaceAcode");

String outboundPartialDate = (String)session.getAttribute("outboundPartialDate");
String inboundPartialDate = (String)session.getAttribute("inboundPartialDate");

String seatGrade = (String)session.getAttribute("seatGrade");
int passenger = (int)session.getAttribute("passenger");
%>
        <div class="wrap">
            <div class="search__wrap">
                <div class="search__detail-container">
                    <div class="detail__left">
                        <span class="city__detail">
                            <b><%=originPlace %></b> (<%=originPlaceAcode %>) - <b><%=destinationPlace %></b> (<%=destinationPlaceAcode %>)
                        </span>
                        <div class="passenger__detail">
                            <span><%=passenger%> 승객 |</span>
                            <span><%=seatGrade %></span>
                        </div>    
                    </div>
                    <nav class="detail__right">
                        <div class="depart__date">
                            <button>◀</button>
                            <input type="text" name="departure_date" id="depart" value="<%=outboundPartialDate%>">
                            <button>▶</button>
                        </div>
                        <div class="return__date">
                            <button>◀</button>
                            <input type="text" name="return_date" id="return" value="<%=inboundPartialDate%>">
                            <button>▶</button>
                        </div>
                    </nav>
                </div>
            </div> 
        </div>
    </section>