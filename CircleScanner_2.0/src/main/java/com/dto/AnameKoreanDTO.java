package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AnameKoreanDTO")
@Data
public class AnameKoreanDTO {

	private String ANAME_E;
	private String ANAME_K;
	private String IATA_A;
	private String ICAO_A;
	private String STATUS_A;


}
