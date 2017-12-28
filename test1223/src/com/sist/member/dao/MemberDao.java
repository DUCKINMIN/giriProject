package com.sist.member.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sun.org.apache.bcel.internal.generic.AALOAD;

public class MemberDao {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	// 이메일 중복체크
	public static MemberVo emailCheck(String m_email) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo.setCount(session.selectOne("emailCheck",m_email));
		} catch (Exception e) {
			System.out.println("emailCheck : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	
	// 닉네임 중복체크
	public static MemberVo nickCheck(String m_nick) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo.setCount(session.selectOne("nickCheck",m_nick));
		} catch (Exception e) {
			System.out.println("nickCheck : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
		
	// 회원가입
	public static void memberJoin(MemberVo vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.insert("memberJoin", vo);
		} catch (Exception e) {
			System.out.println("join : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	
	// 로그인
	public static MemberVo isLogin(String m_email, String m_pwd) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("isLogin", m_email);
			if (!vo.getM_pwd().equals(m_pwd)) {
				vo.setCount(2);
			} else {
				vo.setCount(1);
			}
			if (vo.getM_profile().equals(" ")) {
				vo.setM_profile("defaultprofile.png");
			} 
		} catch (Exception e) {
			System.out.println("isLogin : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	
	// 전화번호 체크
	public static int telCount(String m_tel) {
		int count = 0;
		SqlSession session = ssf.openSession();
		try {
			count = session.selectOne("telCount",m_tel);
		} catch (Exception e) {
			System.out.println("telCount : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}
	
	// 이메일 찾기
	public static MemberVo emailFind(String m_tel) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("emailFind",m_tel);
		} catch (Exception e) {
			System.out.println("emailFind : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	// 비밀번호 찾기
	public static MemberVo pwdFind(String m_tel) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("pwdFind",m_tel);
		} catch (Exception e) {
			System.out.println("pwdFind : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	
	// 회원정보 출력
	public static MemberVo memberInfo(String m_email) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("memberInfo",m_email);
			if (vo.getM_profile().equals(" ")) {
				vo.setM_profile("defaultprofile.png");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	// 회원정보 수정
	public static void myinfo_update(MemberVo vo) {
		SqlSession session = ssf.openSession(true);
		try {
			if (vo.getM_grade()==2) { //점주회원
				session.update("myinfo_update", vo);
			} else {	// 일반회원
				session.update("myinfo_update2", vo);
			}
		} catch (Exception e) {
			System.out.println("myinfo_update : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	// mynick 중복체크
	public static MemberVo myNickCheck(Map map) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			System.out.println(map.get("mynick")+"   "+map.get("m_nick"));
			vo.setCount(session.selectOne("myNickCheck",map));
		} catch (Exception e) {
			System.out.println("myNickCheck : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
