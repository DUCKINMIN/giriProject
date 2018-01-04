package com.sist.clubbar.dao;

import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ClubBarCommentDAO {
	private static SqlSessionFactory ssf;
	
	//XML�Ľ� ������ ����
	static {
		try {
			//XML�б�
			Reader reader = Resources.getResourceAsReader("Config.xml");
			//XML�Ľ�
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void cbCommentInsert(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.insert("cbCommentInsert", vo);
		} catch (Exception e) {
			System.out.println("cbCommentInsert : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
	}
	
	
	public static List<ClubBarCommentVO> cbCommentList(Map map) {
		List<ClubBarCommentVO> list = new ArrayList<ClubBarCommentVO>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("cbCommentList", map);
		} catch (Exception e) {
			System.out.println("cbCommentList : " + e.getMessage());
		}
		
		return list;
	}
	
	//��� ����
	public static void cbCommentUpdate(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("cbCommentUpdate", vo);
		} catch (Exception e) {
			System.out.println("cbCommentUpdate : " + e.getMessage());
		}
		
	}
	
	//���� ���
	public static ClubBarCommentVO cbcGetParentInfo(int cbc_no) {
		ClubBarCommentVO vo = new ClubBarCommentVO();
		SqlSession session = ssf.openSession();
		
		try {
			vo = session.selectOne("cbcGetParentInfo", cbc_no);
		} catch (Exception e) {
			System.out.println("cbcGetParentInfo : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
	public static void cbcStepIncrement(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("cbcStepIncrement", vo);
		} catch (Exception e) {
			System.out.println("cbcStepIncrement : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
	}
	public static void cbcReplyInsert(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.insert("cbcReplyInsert", vo);
		} catch (Exception e) {
			System.out.println("cbcReplyInsert : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
	}
	public static void cbcDepthIncrement(int cbc_no) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("cbcDepthIncrement", cbc_no);
		} catch (Exception e) {
			System.out.println("cbcDepthIncrement : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
	}
}
