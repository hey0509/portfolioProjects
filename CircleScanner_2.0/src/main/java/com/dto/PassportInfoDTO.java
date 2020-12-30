package com.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

//by jungwoo 20201201
@Alias("PassportInfoDTO")
@Data
public class PassportInfoDTO {
	private String P_PASSPORTNUM;
	private String RESERVATION_ID;
	private String P_LASTNAME;
	private String P_FIRSTNAME;
	private String P_SEX;
	private String P_BIRTHDAY;
	private String P_PASSPORTEXPRIATIONDATE;
	private String P_NATIONALITY;
	private String P_ISSUECOUNTRY;
}
