package com.kh.love.todo.vo;


public class TodoVo {
	
	public TodoVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TodoVo(String no, String writerNo, String title, String content, String category, String enrollDate,
			String modifyDate, String completeYn, String delYn, String code, String checkDate) {
		super();
		this.no = no;
		this.writerNo = writerNo;
		this.title = title;
		this.content = content;
		this.category = category;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.completeYn = completeYn;
		this.delYn = delYn;
		this.code = code;
		this.checkDate = checkDate;
	}

	private String no;
	private String writerNo;
	private String title;
	private String content;
	private String category;
	private String enrollDate;
	private String modifyDate;
	private String completeYn;
	private String delYn;
	private String code;
	private String checkDate;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getCompleteYn() {
		return completeYn;
	}

	public void setCompleteYn(String completeYn) {
		this.completeYn = completeYn;
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

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "TodoVo [no=" + no + ", writerNo=" + writerNo + ", title=" + title + ", content=" + content
				+ ", category=" + category + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", completeYn=" + completeYn + ", delYn=" + delYn + ", code=" + code + ", checkDate=" + checkDate
				+ "]";
	}
	
}
