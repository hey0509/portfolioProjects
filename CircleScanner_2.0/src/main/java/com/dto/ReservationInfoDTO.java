package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ReservationInfoDTO")
@Data
public class ReservationInfoDTO {
//	private String sdf;
	private String r_name;
	private String r_email;
	private String r_phone;
	private List<PassportInfoBodyDTO> listPassportInfoBodyDTO;
	
}
