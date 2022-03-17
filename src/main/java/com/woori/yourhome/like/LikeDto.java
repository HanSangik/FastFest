package com.woori.yourhome.like;

public class LikeDto {
	private String like_boardType = "";
	private String like_boardId = "";
	private String like_userId = "";
	private String writer = "";
	private String title = "";
	private String regdate = "";
	private String id = "";

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLike_boardType() {
		return like_boardType;
	}

	public void setLike_boardType(String like_boardType) {
		this.like_boardType = like_boardType;
	}

	public String getLike_boardId() {
		return like_boardId;
	}

	public void setLike_boardId(String like_boardId) {
		this.like_boardId = like_boardId;
	}

	public String getLike_userId() {
		return like_userId;
	}

	public void setLike_userId(String like_userId) {
		this.like_userId = like_userId;
	}

}
