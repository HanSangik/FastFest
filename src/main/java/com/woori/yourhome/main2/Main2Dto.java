package com.woori.yourhome.main2;

import com.woori.yourhome.common.BaseDto;

public class Main2Dto extends BaseDto{
	private String id="";
	private String title="";
	private String writer="";
	private String comment="";
	private String wdate="";
	private String delyn="";
	private String image="";
	private int likehit=0; //추천
	private int likeYN=0; //즐겨찾기
	private String userSeq="";
	
	
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public int getLikeYN() {
		return likeYN;
	}
	public void setLikeYN(int likeYN) {
		this.likeYN = likeYN;
	}
	public int getLikehit() {
		return likehit;
	}
	public void setLikehit(int likehit) {
		this.likehit = likehit;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	@Override
	public String toString() {
		return "Main2Dto [id=" + id + ", title=" + title + ", writer=" + writer + ", comment=" + comment + ", wdate="
				+ wdate + ", delyn=" + delyn + ", image=" + image + ", likehit=" + likehit + "]";
	}
	
	
}
