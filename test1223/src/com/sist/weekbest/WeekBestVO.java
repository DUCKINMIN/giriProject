package com.sist.weekbest;

public class WeekBestVO {
	private String cb_name; // clubBar - Ŭ���̸�
	private int avghit; // clubBar - cb_hit ��ȸ��
	private float roundrating;// clubBar - cb_weekHit �ְ� ��ȸ��
	private int jjim;// �� ����
	private int cb_no;

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

