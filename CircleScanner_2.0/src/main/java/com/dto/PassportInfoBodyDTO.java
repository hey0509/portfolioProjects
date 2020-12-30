package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("PassportInfoBodyDTO")
@Data
public class PassportInfoBodyDTO {
	private String p_lastname;
	private String p_firstname;
	private String p_sex;
	private String p_birthday;
	private String p_passenger;
	private String p_passportNum;
	private String p_passportExpirationdate;
	private String p_nationality;
	private String p_issuecountry;
	private List<PassportInfoBodyDTO> list_PassportInfoBodyDTO;
}
