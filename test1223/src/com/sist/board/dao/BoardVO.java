package com.sist.board.dao;
import java.util.*;

import com.sist.member.dao.MemberVo;
/*
 * CREATE TABLE board(
b_no NUMBER CONSTRAINT b_no_pk PRIMARY KEY,
b_name VARCHAR2(32) CONSTRAINT b_name_nn NOT NULL,
m_email VARCHAR2(40),
b_regdate DATE DEFAULT SYSDATE,
b_content CLOB CONSTRAINT b_content_nn NOT NULL,
b_grade NUMBER CONSTRAINT b_grade_ck CHECK(b_grade IN(0, 1)),
b_hit NUMBER DEFAULT 0,
CONSTRAINT b_m_email_fk FOREIGN KEY(m_email) REFERENCES member(m_email)
);
 */
public class BoardVO {
	private int b_no;
	private String b_subject;
	private String m_email;
	private Date b_regdate;
	private String b_content;
	private int b_grade;
	private int b_hit;
	private String m_nick; //m_emailÀÌ¶û JOIN
	private String m_profile;

	
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	private int b_img_cnt;
	
	public int getB_img_cnt() {
		return b_img_cnt;
	}
	public void setB_img_cnt(int b_img_cnt) {
		this.b_img_cnt = b_img_cnt;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_grade() {
		return b_grade;
	}
	public void setB_grade(int b_grade) {
		this.b_grade = b_grade;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	
}
