package com.sist.clubbar.dao;

public class ClubBarRankVO {
	private int cb_no;
	private String cbr_time;
	private int cbr_hit;
	private ClubBarVO cvo = new ClubBarVO();
	
	public ClubBarVO getCvo() {
		return cvo;
	}
	public void setCvo(ClubBarVO cvo) {
		this.cvo = cvo;
	}
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getCbr_time() {
		return cbr_time;
	}
	public void setCbr_time(String cbr_time) {
		this.cbr_time = cbr_time;
	}
	public int getCbr_hit() {
		return cbr_hit;
	}
	public void setCbr_hit(int cbr_hit) {
		this.cbr_hit = cbr_hit;
	}
	
}
