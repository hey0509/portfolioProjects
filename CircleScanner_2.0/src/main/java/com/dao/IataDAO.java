package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.IATAAirportDTO;

@Repository
public class IataDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public String selectIata(String aname) {
		String iata_a = template.selectOne("SearchMapper.selectIATA", aname);
		System.out.println("DAO iataCode======"+ iata_a);
		return iata_a;
	}

	public String selectAirlineNameKorean(String aCode) {
		String Airline_K = template.selectOne("SearchMapper.selectAirlineNameKorean", aCode);
		return Airline_K;
	}

	public IATAAirportDTO selectAirportNameKorean(String IATA_A) {
		IATAAirportDTO Airport_Names = template.selectOne("SearchMapper.selectAirportNames", IATA_A);
		return Airport_Names;
	}
}
