package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IataDAO;
import com.dto.IATAAirportDTO;

@Service
public class IataService {
	@Autowired
	private IataDAO dao;

	public String selectIata(String aname) {
		// SearchServlet
		String iata_a = dao.selectIata(aname);
		return iata_a;
	}

	public String selectAirlineNameKorean(String aCode) {
		// FlightConfirmServlet .1 airline name korean
		String Airline_K = dao.selectAirlineNameKorean(aCode);
		return Airline_K;
	}

	public IATAAirportDTO selectAirportNameKorean(String IATA_A) {
		// FlightConfirmServlet .2 Airport name Korean
		IATAAirportDTO Airport_Names = dao.selectAirportNameKorean(IATA_A);
		return Airport_Names;
	}
}
