package com.sist.member.dao;

import java.util.Date;

import com.sist.clubbar.dao.CartVO;
import com.sist.clubbar.dao.ClubBarVO;
import com.sist.event.dao.EventCartVO;
import com.sist.event.dao.EventVO;

public class MemberVo {
	private String m_email;
	private String m_pwd;
	private String m_name;
	private String m_sex;
	private String m_birth;
	private String m_nick;
	private String m_tel;
	private Date m_regdate;
	private int m_grade;
	private String m_companyno;
	private String m_profile;
	private int count;
	
	// 찜
	private ClubBarVO clubbarvo = new ClubBarVO();
	private CartVO cartvo = new CartVO();
	// 참여이벤트
	private EventCartVO eventcartvo = new EventCartVO();
	private EventVO eventvo = new EventVO();
	
	
	public ClubBarVO getClubbarvo() {
		return clubbarvo;
	}
	public void setClubbarvo(ClubBarVO clubbarvo) {
		this.clubbarvo = clubbarvo;
	}
	public CartVO getCartvo() {
		return cartvo;
	}
	public void setCartvo(CartVO cartvo) {
		this.cartvo = cartvo;
	}
	public EventCartVO getEventcartvo() {
		return eventcartvo;
	}
	public void setEventcartvo(EventCartVO eventcartvo) {
		this.eventcartvo = eventcartvo;
	}
	public EventVO getEventvo() {
		return eventvo;
	}
	public void setEventvo(EventVO eventvo) {
		this.eventvo = eventvo;
	}
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_sex() {
		return m_sex;
	}
	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_companyno() {
		return m_companyno;
	}
	public void setM_companyno(String m_companyno) {
		this.m_companyno = m_companyno;
	}
	
	
}
