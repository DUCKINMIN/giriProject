package com.sist.event.dao;

import java.util.Date;

import com.sist.clubbar.dao.ClubBarVO;

public class EventVO {
	private int e_no;
	private int cb_no;
	private String e_name;
	private Date e_regdate;
	private Date e_enddate;
	private String e_content;
	private String e_picture;
	private int e_manpre;
	private int e_girlpre;
	private int e_interest;
	private ClubBarVO cb=new ClubBarVO();
	
	
	
	
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	public Date getE_enddate() {
		return e_enddate;
	}
	public void setE_enddate(Date e_enddate) {
		this.e_enddate = e_enddate;
	}
	public ClubBarVO getCb() {
		return cb;
	}
	public void setCb(ClubBarVO cb) {
		this.cb = cb;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getE_picture() {
		return e_picture;
	}
	public void setE_picture(String e_picture) {
		this.e_picture = e_picture;
	}
	public int getE_manpre() {
		return e_manpre;
	}
	public void setE_manpre(int e_manpre) {
		this.e_manpre = e_manpre;
	}
	public int getE_girlpre() {
		return e_girlpre;
	}
	public void setE_girlpre(int e_girlpre) {
		this.e_girlpre = e_girlpre;
	}
	public int getE_interest() {
		return e_interest;
	}
	public void setE_interest(int e_interest) {
		this.e_interest = e_interest;
	}
	
	
	}
