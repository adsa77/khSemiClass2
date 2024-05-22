package com.kh.love.member.vo;

public class MemberVo {
	

	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVo(String no, String id, String pwd, String pwd2, String nick, String name, String birthDate,
			String address, String phone, String email, String emrollDate, String modifyDate, String quitDate,
			String quitYn, String profile, String code) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.pwd2 = pwd2;
		this.nick = nick;
		this.name = name;
		this.birthDate = birthDate;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.emrollDate = emrollDate;
		this.modifyDate = modifyDate;
		this.quitDate = quitDate;
		this.quitYn = quitYn;
		this.profile = profile;
		this.code = code;
	}
	private String no;
	private String id;
	private String pwd;
	private String pwd2;
	private String nick;
	private String name;
	private String birthDate;
	private String address;
	private String phone;
	private String email;
	private String emrollDate;
	private String modifyDate;
	private String quitDate;
	private String quitYn;
	private String profile;
	private String code;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmrollDate() {
		return emrollDate;
	}
	public void setEmrollDate(String emrollDate) {
		this.emrollDate = emrollDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}
	public String getQuitYn() {
		return quitYn;
	}
	public void setQuitYn(String quitYn) {
		this.quitYn = quitYn;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", id=" + id + ", pwd=" + pwd + ", pwd2=" + pwd2 + ", nick=" + nick + ", name="
				+ name + ", birthDate=" + birthDate + ", address=" + address + ", phone=" + phone + ", email=" + email
				+ ", emrollDate=" + emrollDate + ", modifyDate=" + modifyDate + ", quitDate=" + quitDate + ", quitYn="
				+ quitYn + ", profile=" + profile + ", code=" + code + "]";
	}
	
	
	
	
}
