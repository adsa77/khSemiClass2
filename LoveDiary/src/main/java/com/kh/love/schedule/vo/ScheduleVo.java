package com.kh.love.schedule.vo;

public class ScheduleVo {
	
	private String no;
	private String writerNo;
	private String title;
	private String content;
	private String scDate;
	private String delYn;
	private String code;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
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
	public String getScDate() {
		return scDate;
	}
	public void setScDate(String scDate) {
		this.scDate = scDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "ScheduleVo [no=" + no + ", writerNo=" + writerNo + ", title=" + title + ", content=" + content
				+ ", scDate=" + scDate + ", delYn=" + delYn + ", code=" + code + "]";
	}
	public ScheduleVo(String no, String writerNo, String title, String content, String scDate, String delYn,
			String code) {
		super();
		this.no = no;
		this.writerNo = writerNo;
		this.title = title;
		this.content = content;
		this.scDate = scDate;
		this.delYn = delYn;
		this.code = code;
	}
	public ScheduleVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
