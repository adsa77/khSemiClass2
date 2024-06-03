package com.kh.love.diary.vo;

public class DiaryVo {

	
	public DiaryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiaryVo(String no, String writerNo, String title, String content, String category, String img,
			String enrollDate, String modifyDate, String delYn, String checkDate, String code) {
		super();
		this.no = no;
		this.writerNo = writerNo;
		this.title = title;
		this.content = content;
		this.category = category;
		this.img = img;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.delYn = delYn;
		this.checkDate = checkDate;
		this.code = code;
	}
	private String no;
	private String writerNo;
	private String title;
	private String content;
	private String category;
	private String img;
	private String enrollDate;
	private String modifyDate;
	private String delYn;
	private String checkDate;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "DiaryVo [no=" + no + ", writerNo=" + writerNo + ", title=" + title + ", content=" + content
				+ ", category=" + category + ", img=" + img + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", delYn=" + delYn + ", checkDate=" + checkDate + ", code=" + code + "]";
	}
	
	
	
	
}
