package com.sist.member.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
			if (vo.getM_profile().equals("-")) {
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
			if (vo.getM_profile().equals("-")) {
				vo.setM_profile("defaultprofile.png");
			} 
		} catch (Exception e) {
			System.out.println("memberInfo : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	// mynick 중복체크
	public static MemberVo myNickCheck(Map map) {
		MemberVo vo = new MemberVo();
		SqlSession session = ssf.openSession();
		try {
			vo.setCount(session.selectOne("myNickCheck",map));
		} catch (Exception e) {
			System.out.println("myNickCheck : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	// 회원정보 수정
	public static void myinfo_update(MemberVo vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("myinfo_update", vo);
		} catch (Exception e) {
			System.out.println("myinfo_update : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	// 비밀번호 수정
	public static void pwd_update(Map map) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("pwd_update", map);
		} catch (Exception e) {
			System.out.println("pwd_update : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	// 핸드폰번호 수정
	public static void tel_update(Map map) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("tel_update", map);
		} catch (Exception e) {
			System.out.println("tel_update : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	// 회원탈퇴
	public static void member_delete(String m_email) {
		SqlSession session = ssf.openSession(true);
		try {
			session.delete("member_delete", m_email);
		} catch (Exception e) {
			System.out.println("member_delete : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	
	// 작성글
	public static List<MemberVo> myBoardList(Map map) {
		List<MemberVo> list = new ArrayList<MemberVo>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("myBoardList",map);
			System.out.println(list.size());
		} catch (Exception e) {
			System.out.println("myBoardList : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// 작성글 총페이지
	public static int myBoardTotalPage(String m_email) {
		SqlSession session = ssf.openSession();
		int totalpage=0;
		try {
			totalpage = session.selectOne("myBoardTotalPage", m_email);
		} catch (Exception e) {
			System.out.println("myBoardTotalPage : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return totalpage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
