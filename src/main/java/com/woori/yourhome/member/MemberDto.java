package com.woori.yourhome.member;

public class MemberDto {

	private String user_key="";
	private String user_id="";
	private String user_password="";
	private String user_name="";
	private String user_mail="";
	private String user_phone="";
	private String user_wdate="";
	private String user_active="";
	private String user_level="";
	
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_wdate() {
		return user_wdate;
	}
	public void setUser_wdate(String user_wdate) {
		this.user_wdate = user_wdate;
	}
	public String getUser_active() {
		return user_active;
	}
	public void setUser_active(String user_active) {
		this.user_active = user_active;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	@Override
	public String toString() {
		return "MemberDto [user_key=" + user_key + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", user_name=" + user_name + ", user_mail=" + user_mail + ", user_phone=" + user_phone
				+ ", user_wdate=" + user_wdate + ", user_active=" + user_active + ", user_level=" + user_level + "]";
	}
	
	
}
