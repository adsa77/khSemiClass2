package com.kh.love.calender.vo;


public class CalenderVo {
	
	public CalenderVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalenderVo(String code, String title, String content, String checkDate) {
		super();
		this.code = code;
		this.title = title;
		this.content = content;
		this.checkDate = checkDate;
	}
	private String code;
	private String title;
	private String content;
	private String checkDate;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	@Override
	public String toString() {
		return "CalenderVo [code=" + code + ", title=" + title + ", content=" + content + ", checkDate=" + checkDate
				+ "]";
	}
	
	
	
}
