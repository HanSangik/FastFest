package com.woori.yourhome.main;

 
import com.woori.yourhome.common.BaseDto;

//alt-shift-a 사각형 영역지정
public class MainDto extends BaseDto{
	
	private String note_seq="";
	private String note_userid="";
	private String note_title="";
	private String note_contents="";
	private String note_regdate="";
	private String note_moddate="";
	private String note_delyn="";
	private String note_hit="1";
	
	
	public String getNote_seq() {
		return note_seq;
	}
	public void setNote_seq(String note_seq) {
		this.note_seq = note_seq;
	}
	public String getNote_userid() {
		return note_userid;
	}
	public void setNote_userid(String note_userid) {
		this.note_userid = note_userid;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_contents() {
		return note_contents;
	}
	public void setNote_contents(String note_contents) {
		this.note_contents = note_contents;
	}
	public String getNote_regdate() {
		return note_regdate;
	}
	public void setNote_regdate(String note_regdate) {
		this.note_regdate = note_regdate;
	}
	public String getNote_moddate() {
		return note_moddate;
	}
	public void setNote_moddate(String note_moddate) {
		this.note_moddate = note_moddate;
	}
	public String getNote_delyn() {
		return note_delyn;
	}
	public void setNote_delyn(String note_delyn) {
		this.note_delyn = note_delyn;
	}
	public String getNote_hit() {
		return note_hit;
	}
	public void setNote_hit(String note_hit) {
		this.note_hit = note_hit;
	}
	public MainDto(String note_seq, String note_userid, String note_title, String note_contents, String note_regdate,
			String note_moddate, String note_delyn, String note_hit) {
		super();
		this.note_seq = note_seq;
		this.note_userid = note_userid;
		this.note_title = note_title;
		this.note_contents = note_contents;
		this.note_regdate = note_regdate;
		this.note_moddate = note_moddate;
		this.note_delyn = note_delyn;
		this.note_hit = note_hit;
	}
	public MainDto() {
		super();
		// TODO Auto-generated constructor stub
	}
		

}
