package com.kh.love.code.vo;

public class CalendarCodeVo {

	
	public CalendarCodeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalendarCodeVo(String no, String code) {
		super();
		this.no = no;
		this.code = code;
	}
	private String no;
	private String code;
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
	@Override
	public String toString() {
		return "CalendarCodeVo [no=" + no + ", code=" + code + "]";
	}
	
	
	
}
