package com.kh.love.admin.calender.vo;

public class CalenderAdminVo {
	
	public CalenderAdminVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CalenderAdminVo(String no, String code, String enrollDate, String delYn) {
		super();
		this.no = no;
		this.code = code;
		this.enrollDate = enrollDate;
		this.delYn = delYn;
	}

	private String no;
	private String code;
	private String enrollDate;
	private String delYn;
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "CalenderAdminVo [no=" + no + ", code=" + code + ", enrollDate=" + enrollDate + ", delYn=" + delYn + "]";
	}
	
	

}
