package com.woori.yourhome.comment2;

/*
 * VO  하고 DTO : VO- getter만 갖고 있고 보통 2~3개 이상의 테이블 데이터를 조인해서  
 * 
 * DTO : getter/setter 같이 있고 디비 테이블당 하나정도                    
 */

public class Comment2Dto {
	private String id="";
	private String board_id="";
	private String userid="";
	private String comment="";
	private String wdate="";
	private String username="";
	private String comment_id="";
	
	
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
}
