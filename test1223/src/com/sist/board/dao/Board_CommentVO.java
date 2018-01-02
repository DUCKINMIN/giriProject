package com.sist.board.dao;

import java.util.Date;

/*
 * BC_NO         NOT NULL NUMBER       
M_EMAIL                VARCHAR2(40) 
BC_REGDATE             DATE         
BC_CONTENT    NOT NULL CLOB         
B_NO                   NUMBER       
BC_GROUP_ID            NUMBER       
BC_GROUP_STEP          NUMBER       
BC_GROUP_TAB           NUMBER       
BC_ROOT                NUMBER       
DEPTH                  NUMBER 
 */
public class Board_CommentVO {
	private String m_email;
	private Date bc_regdate;
	private String bc_content;
	private int b_no;
	private int bc_group_id;
	private int bc_group_step;
	private int bc_group_tab;
	private int bc_root;
	private int depth;
	
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getBc_regdate() {
		return bc_regdate;
	}
	public void setBc_regdate(Date bc_regdate) {
		this.bc_regdate = bc_regdate;
	}
	public String getBc_content() {
		return bc_content;
	}
	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getBc_group_id() {
		return bc_group_id;
	}
	public void setBc_group_id(int bc_group_id) {
		this.bc_group_id = bc_group_id;
	}
	public int getBc_group_step() {
		return bc_group_step;
	}
	public void setBc_group_step(int bc_group_step) {
		this.bc_group_step = bc_group_step;
	}
	public int getBc_group_tab() {
		return bc_group_tab;
	}
	public void setBc_group_tab(int bc_group_tab) {
		this.bc_group_tab = bc_group_tab;
	}
	public int getBc_root() {
		return bc_root;
	}
	public void setBc_root(int bc_root) {
		this.bc_root = bc_root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	

}
