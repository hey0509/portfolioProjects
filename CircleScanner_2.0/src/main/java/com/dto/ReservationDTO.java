package com.dto;

//by jungwoo 20201201
//@Data
public class ReservationDTO {
	private String RESERVATION_ID;
	private String RESERVATION_NAME;
	private String RESERVATION_EMAIL;
	private String RESERVATION_PHONE;
	private int TOTALPRICEINT;
	private String PAYSTATE;
	private String RESERVATION_DATE;

	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationDTO(String rESERVATION_ID, String rESERVATION_NAME, String rESERVATION_EMAIL,
			String rESERVATION_PHONE, int tOTALPRICEINT, String pAYSTATE, String rESERVATION_DATE) {
		super();
		RESERVATION_ID = rESERVATION_ID;
		RESERVATION_NAME = rESERVATION_NAME;
		RESERVATION_EMAIL = rESERVATION_EMAIL;
		RESERVATION_PHONE = rESERVATION_PHONE;
		TOTALPRICEINT = tOTALPRICEINT;
		PAYSTATE = pAYSTATE;
		RESERVATION_DATE = rESERVATION_DATE;
	}

	public String getRESERVATION_ID() {
		return RESERVATION_ID;
	}

	public void setRESERVATION_ID(String rESERVATION_ID) {
		RESERVATION_ID = rESERVATION_ID;
	}

	public String getRESERVATION_NAME() {
		return RESERVATION_NAME;
	}

	public void setRESERVATION_NAME(String rESERVATION_NAME) {
		RESERVATION_NAME = rESERVATION_NAME;
	}

	public String getRESERVATION_EMAIL() {
		return RESERVATION_EMAIL;
	}

	public void setRESERVATION_EMAIL(String rESERVATION_EMAIL) {
		RESERVATION_EMAIL = rESERVATION_EMAIL;
	}

	public String getRESERVATION_PHONE() {
		return RESERVATION_PHONE;
	}

	public void setRESERVATION_PHONE(String rESERVATION_PHONE) {
		RESERVATION_PHONE = rESERVATION_PHONE;
	}

	public int getTOTALPRICEINT() {
		return TOTALPRICEINT;
	}

	public void setTOTALPRICEINT(int tOTALPRICEINT) {
		TOTALPRICEINT = tOTALPRICEINT;
	}

	public String getPAYSTATE() {
		return PAYSTATE;
	}

	public void setPAYSTATE(String pAYSTATE) {
		PAYSTATE = pAYSTATE;
	}

	public String getRESERVATION_DATE() {
		return RESERVATION_DATE;
	}

	public void setRESERVATION_DATE(String rESERVATION_DATE) {
		RESERVATION_DATE = rESERVATION_DATE;
	}

	@Override
	public String toString() {
		return "ReservationDTO [RESERVATION_ID=" + RESERVATION_ID + ", RESERVATION_NAME=" + RESERVATION_NAME
				+ ", RESERVATION_EMAIL=" + RESERVATION_EMAIL + ", RESERVATION_PHONE=" + RESERVATION_PHONE
				+ ", TOTALPRICEINT=" + TOTALPRICEINT + ", PAYSTATE=" + PAYSTATE + ", RESERVATION_DATE="
				+ RESERVATION_DATE + "]";
	}

}
