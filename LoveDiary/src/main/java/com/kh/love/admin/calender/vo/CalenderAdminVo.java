package com.kh.love.admin.calender.vo;

public class CalenderAdminVo {
	
	public CalenderAdminVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CalenderAdminVo(String no, String title, String content, String writerNo, String holidayDate,
			String category, String code, String delYn) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writerNo = writerNo;
		this.holidayDate = holidayDate;
		this.category = category;
		this.code = code;
		this.delYn = delYn;
	}

	private String no;
	private String title;
	private String content;
	private String writerNo;
	private String holidayDate;
	private String category;
	private String code;
	private String delYn;
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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

	public String getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
	}

	public String getHolidayDate() {
		return holidayDate;
	}

	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "CalenderAdminVo [no=" + no + ", title=" + title + ", content=" + content + ", writerNo=" + writerNo
				+ ", holidayDate=" + holidayDate + ", category=" + category + ", code=" + code + ", delYn=" + delYn
				+ "]";
	}
	

}
