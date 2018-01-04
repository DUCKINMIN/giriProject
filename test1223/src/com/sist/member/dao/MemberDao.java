package com.sist.member.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.board.dao.BoardCommentVO;
import com.sist.board.dao.BoardVO;
import com.sist.event.dao.EventVO;

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
	// �̸��� �ߺ�üũ 
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
	
	// �г��� �ߺ�üũ
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
		
	// ȸ������
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
	
	// �α���
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
	
	// ��ȭ��ȣ üũ
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
	
	// �̸��� ã��
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
	// ��й�ȣ ã��
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
	
	// ȸ������ ���
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
	// mynick �ߺ�üũ
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
	// ȸ������ ����
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
	// ��й�ȣ ����
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
	// �ڵ�����ȣ ����
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
	// ȸ��Ż��
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
	
	// ��
	public static List<MemberVo> myClubBarList(Map map) {
		List<MemberVo> list = new ArrayList<MemberVo>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("myClubBarList",map);
		} catch (Exception e) {
			System.out.println("myClubBarList : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// �� ��������
	public static int myClubBarTotalPage(String m_email) {
		SqlSession session = ssf.openSession();
		int totalpage=0;
		try {
			totalpage = session.selectOne("myClubBarTotalPage", m_email);
		} catch (Exception e) {
			System.out.println("myClubBarTotalPage : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return totalpage;
	}
	
	// �ۼ���
	public static List<BoardVO> myBoardList(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("myBoardList",map);
		} catch (Exception e) {
			System.out.println("myBoardList : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// �ۼ��� ��������
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
	
	// �ۼ����
	public static List<BoardCommentVO> myCommentList(Map map) {
		List<BoardCommentVO> list = new ArrayList<BoardCommentVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("myCommentList",map);
		} catch (Exception e) {
			System.out.println("myCommentList : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// �ۼ���� ��������
	public static int myCommentTotalPage(String m_email) {
		SqlSession session = ssf.openSession();
		int totalpage=0;
		try {
			totalpage = session.selectOne("myCommentTotalPage", m_email);
		} catch (Exception e) {
			System.out.println("myCommentTotalPage : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return totalpage;
	}
	
	// �����̺�Ʈ
	public static List<MemberVo> myEventList(Map map) {
		List<MemberVo> list = new ArrayList<MemberVo>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("myEventList",map);
		} catch (Exception e) {
			System.out.println("myEventList : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	// �����̺�Ʈ ��������
	public static int myEventTotalPage(String m_email) {
		SqlSession session = ssf.openSession();
		int totalpage=0;
		try {
			totalpage = session.selectOne("myEventTotalPage", m_email);
		} catch (Exception e) {
			System.out.println("myEventTotalPage : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return totalpage;
	}
	//�̺�Ʈ ���� ������ �̺�Ʈ �Ҿ����
	public static List<EventVO> EventCallData(Map map){
		List<EventVO> list = new ArrayList<EventVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("EventCallData",map);
		} catch (Exception e) {
			System.out.println("EventCallData : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	//�̺�Ʈ���� ������ �̺�Ʈ �� ������
	public static int myEventCallTotalPage(String m_email) {
		SqlSession session = ssf.openSession();
		int totalpage=0;
		try {
			totalpage = session.selectOne("myEventCallTotalPage", m_email);
		} catch (Exception e) {
			System.out.println("myEventCallTotalPage : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return totalpage;
	}
	//�̺�Ʈ���� ����
	public static EventVO eventUpdateData(int e_no) {
		EventVO vo=new EventVO();
		SqlSession session = ssf.openSession();
		try {
			vo=session.selectOne("eventUpdateData",e_no);
		} catch (Exception e) {
			System.out.println("eventUpdateData : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	public static void eventUpdateOk(int e_no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("eventUpdateOk", e_no);
		} catch (Exception e) {
			System.out.println("eventUpdateOk : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	//�̺�Ʈ ���� ����
	public static void eventDelete(int e_no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("eventDelete", e_no);
		} catch (Exception e) {
			System.out.println("eventDelete : "+e.getMessage());
		} finally {
			if(session!=null) session.close();
		}
	}
	
	
	
	
	
	
	
	
}
