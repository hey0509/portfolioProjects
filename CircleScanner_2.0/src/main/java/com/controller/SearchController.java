package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.IATAAirportDTO;
import com.dto.ScheduleSearchDTO;
import com.dto.SearchBtnDTO;
import com.dto.SelectBtnDTO;
import com.service.IataService;
import com.service.ScheduleSearchService;

// by jungwo 20201204
@Controller
public class SearchController {
	@Autowired
	private IataService iataService;
	@Autowired
	private ScheduleSearchService ScheduleSearchService;
	
	@RequestMapping("/scheduleSearch")
	public String scheduleSearch(SearchBtnDTO sbDTO, HttpSession session) {
		//SearchBtnDTO 생성 RequestParam으로 쓰기엔 input값이 많기 때문에 새로운 값을 받는 용도의 dto 생성
		//그이후에는 session에 담아 쓰기때문에 다시 안쓰일 예정
		System.out.println(sbDTO);
		String outboundPartialDate = sbDTO.getOutboundPartialDate();
		String inboundPartialDate = sbDTO.getInboundPartialDate();
		
		// 날짜 포맷 변경
		outboundPartialDate = outboundPartialDate.replaceAll("\\.", "/");
		inboundPartialDate = inboundPartialDate.replaceAll("\\.", "/");
		// 사람수만 받아오기위한 작업
		String passenger = sbDTO.getPassenger().substring(0, 1);
		
		session.setAttribute("tripType", sbDTO.getTripType());
		session.setAttribute("originPlace", sbDTO.getOriginPlace());
		session.setAttribute("destinationPlace", sbDTO.getDestinationPlace());
		session.setAttribute("outboundPartialDate", outboundPartialDate);
		session.setAttribute("inboundPartialDate", inboundPartialDate);
		session.setAttribute("non_stop", sbDTO.getNon_stop());
		session.setAttribute("seatGrade", sbDTO.getSeatGrade());
		session.setAttribute("passenger", Integer.parseInt(passenger));

		
		//공항이 위치한 지역명에서 공항 IATA CODE를 받음
		String originPlaceAcode = iataService.selectIata(sbDTO.getOriginPlace());
		String destinationPlaceAcode = iataService.selectIata(sbDTO.getDestinationPlace());
		session.setAttribute("originPlaceAcode", originPlaceAcode);
		session.setAttribute("destinationPlaceAcode", destinationPlaceAcode);
		
		// 공항코드와 날짜를 이용하여 항공 스케쥴 받음
		ScheduleSearchDTO ssDTO = new ScheduleSearchDTO();
		ssDTO.setDEPARTURE_ACODE(originPlaceAcode);
		ssDTO.setDESTINATION_ACODE(destinationPlaceAcode);
		ssDTO.setDEPART_DATE(outboundPartialDate);
		ssDTO.setARRIVE_DATE(inboundPartialDate);
		
		// 왕복기준 I/O가 두번 일어나 list들을 출발/도착 구분하여 map에 담겨서 옴
		// map을 넘기면 jsp에서 작업하기 해야하기때문에 스프링기준 자동완성 속도가 느려 list에 뽑아 session에 담음
		Map<String, List<ScheduleSearchDTO>> map = ScheduleSearchService.selectScheduleSearch(ssDTO);
		List<ScheduleSearchDTO> list_D = map.get("list_D");
		List<ScheduleSearchDTO> list_A = map.get("list_A");
		
		session.setAttribute("list_D", list_D);
		session.setAttribute("list_A", list_A);
		
		return "search";
	}
	
	// by jungwoo 20201206
	@RequestMapping("/flightConfirm")
	public String flightConfirm(SelectBtnDTO selectBtnDTO, HttpSession session) {
		
		session.setAttribute("list_D_priceFormat", selectBtnDTO.getList_D_priceFormat());
		session.setAttribute("list_A_priceFormat", selectBtnDTO.getList_A_priceFormat());
		session.setAttribute("total_priceFormat", selectBtnDTO.getTotal_priceFormat());
		
		int totalPriceInt = Integer.parseInt(selectBtnDTO.getTotalPriceInt());
		String totalPrice = selectBtnDTO.getTotalPrice();
		session.setAttribute("totalPriceInt", totalPriceInt);
		session.setAttribute("totalPrice", totalPrice);
		
		int num = Integer.parseInt(selectBtnDTO.getI());
		
		List<ScheduleSearchDTO> list_D = (List<ScheduleSearchDTO>) session.getAttribute("list_D");
		List<ScheduleSearchDTO> list_A = (List<ScheduleSearchDTO>) session.getAttribute("list_A");
		
		ScheduleSearchDTO selected_D = list_D.get(num);
		ScheduleSearchDTO selected_A = list_A.get(num);
		
		session.setAttribute("selected_D", selected_D);
		session.setAttribute("selected_A", selected_A);
		
		// 선택된 스케쥴표에 대한 항공사정보
		String aCode_D = selected_D.getAIRCRAFT_NAME().substring(0, 2);
		String aCode_A = selected_A.getAIRCRAFT_NAME().substring(0, 2);
		String ANAME_K_D = iataService.selectAirlineNameKorean(aCode_D); 
		String ANAME_K_A = iataService.selectAirlineNameKorean(aCode_A); 
		session.setAttribute("ANAME_K_D", ANAME_K_D);//한글 항공사명
		session.setAttribute("ANAME_K_A", ANAME_K_A);//한글 항공사명

		// 선택된 스케쥴표에 대한 공항정보
		IATAAirportDTO Airport_Names_Depart = iataService.selectAirportNameKorean(selected_D.getDEPARTURE_ACODE());
		IATAAirportDTO Airport_Names_Desti = iataService.selectAirportNameKorean(selected_D.getDESTINATION_ACODE());
		session.setAttribute("Airport_Names_Depart", Airport_Names_Depart);
		session.setAttribute("Airport_Names_Desti", Airport_Names_Desti);
		
		// flightConfirmList.jsp로 data전송
		return "flightConfirmList";
	}
	
	
	
}
