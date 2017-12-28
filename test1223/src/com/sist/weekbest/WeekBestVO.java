package com.sist.weekbest;

public class WeekBestVO {
	private String cb_name; // clubBar - 클럽이름
	private int avghit; // clubBar - cb_hit 조회수
	private float roundrating;// clubBar - cb_weekHit 주간 조회수
	private int jjim;// 찜 갯수

	public String getCb_name() {
		return cb_name;
	}

	public void setCb_name(String cb_name) {
		this.cb_name = cb_name;
	}

	public int getAvghit() {
		return avghit;
	}

	public void setAvghit(int avghit) {
		this.avghit = avghit;
	}

	public float getRoundrating() {
		return roundrating;
	}

	public void setRoundrating(float roundrating) {
		this.roundrating = roundrating;
	}

	public int getJjim() {
		return jjim;
	}

	public void setJjim(int jjim) {
		this.jjim = jjim;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	private String photo;

}
