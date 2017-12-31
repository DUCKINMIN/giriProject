package com.sist.clubbar.dao;

public class ClubBarVO {
	private int cb_no;
	private String cb_name;
	private String cb_crn;
	private String m_email;
	private String cb_tel;
	private String a_addr1;
	private String a_addr2;
	private String cb_content;
	private String cb_open;
	private int cb_hit;
	private int cb_weekHit;
	private int cb_grade;
	private int cb_img_cnt;

	public int getCb_img_cnt() {
		return cb_img_cnt;
	}
	public void setCb_img_cnt(int cb_img_cnt) {
		this.cb_img_cnt = cb_img_cnt;
	}
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getCb_name() {
		return cb_name;
	}
	public void setCb_name(String cb_name) {
		this.cb_name = cb_name;
	}
	public String getCb_crn() {
		return cb_crn;
	}
	public void setCb_crn(String cb_crn) {
		this.cb_crn = cb_crn;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getCb_tel() {
		return cb_tel;
	}
	public void setCb_tel(String cb_tel) {
		this.cb_tel = cb_tel;
	}
	public String getA_addr1() {
		return a_addr1;
	}
	public void setA_addr1(String a_addr1) {
		this.a_addr1 = a_addr1;
	}
	public String getA_addr2() {
		return a_addr2;
	}
	public void setA_addr2(String a_addr2) {
		this.a_addr2 = a_addr2;
	}
	public String getCb_content() {
		return cb_content;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public String getCb_open() {
		return cb_open;
	}
	public void setCb_open(String cb_open) {
		this.cb_open = cb_open;
	}
	public int getCb_hit() {
		return cb_hit;
	}
	public void setCb_hit(int cb_hit) {
		this.cb_hit = cb_hit;
	}
	public int getCb_weekHit() {
		return cb_weekHit;
	}
	public void setCb_weekHit(int cb_weekHit) {
		this.cb_weekHit = cb_weekHit;
	}
	public int getCb_grade() {
		return cb_grade;
	}
	public void setCb_grade(int cb_grade) {
		this.cb_grade = cb_grade;
	}
}
