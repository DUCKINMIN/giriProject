package com.sist.clubbar.dao;

import java.util.*;

public class ClubBarCommentVO {
	private int cbc_no;
	private String m_email;
	private String m_nick;
	private String m_profile;
	private Date cbc_regdate;
	private String cbc_content;
	private int cb_no;
	private double cbc_rating;
	private int cbc_group_id;
	private int cbc_group_step;
	private int cbc_group_tab;
	private int cbc_root;
	private int depth;
	private String dbday;

	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public String getCbc_content() {
		return cbc_content;
	}
	public void setCbc_content(String cbc_content) {
		this.cbc_content = cbc_content;
	}
	public int getCbc_no() {
		return cbc_no;
	}
	public void setCbc_no(int cbc_no) {
		this.cbc_no = cbc_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getCbc_regdate() {
		return cbc_regdate;
	}
	public void setCbc_regdate(Date cbc_regdate) {
		this.cbc_regdate = cbc_regdate;
	}
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public double getCbc_rating() {
		return cbc_rating;
	}
	public void setCbc_rating(double cbc_rating) {
		this.cbc_rating = cbc_rating;
	}
	public int getCbc_group_id() {
		return cbc_group_id;
	}
	public void setCbc_group_id(int cbc_group_id) {
		this.cbc_group_id = cbc_group_id;
	}
	public int getCbc_group_step() {
		return cbc_group_step;
	}
	public void setCbc_group_step(int cbc_group_step) {
		this.cbc_group_step = cbc_group_step;
	}
	public int getCbc_group_tab() {
		return cbc_group_tab;
	}
	public void setCbc_group_tab(int cbc_group_tab) {
		this.cbc_group_tab = cbc_group_tab;
	}
	public int getCbc_root() {
		return cbc_root;
	}
	public void setCbc_root(int cbc_root) {
		this.cbc_root = cbc_root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
}
