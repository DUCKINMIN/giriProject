package com.sist.board.dao;
import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	
	//XML�Ľ� ������ ����
	static {
		try {
			// XML�б�
			Reader reader = Resources.getResourceAsReader("Config.xml");

			// XML�Ľ�
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("Config.xml"+e.getMessage());
		}
	}
	
	//����Ʈ 
	public static List<BoardVO> boardList(Map map){
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("boardList",map);
			//System.out.println("dao"+list.get(0));
		}catch(Exception e) {
			System.out.println("boardList : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	//grade�� �Խù� ��
	public static int boardListCount(int grade) {
		int cnt = 0;
		SqlSession session = ssf.openSession();
		try {
			cnt = session.selectOne("boardListCount",grade);
		}catch(Exception e) {
			System.out.println("boardListCount : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return cnt;
	}
	
	//��������
	public static int boardTotalPage(int grade) {
		int totalpage = 0;
		SqlSession session = ssf.openSession();
		try {
			totalpage = session.selectOne("boardTotalPage",grade);
		}catch(Exception e) {
			System.out.println("boardTotalPage : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return totalpage;
	}
	
	//�󼼺���
	public static BoardVO boardContentData(int b_no) {
		BoardVO vo = new BoardVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("boardContentData",b_no);
		}catch(Exception e) {
			System.out.println("boardContentData : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	//��ȸ�� ����
	public static void boardHitIncrement(Map map) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("boardHitIncrement",map);
		}catch(Exception e) {
			System.out.println("boardHitIncrement : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}

	
	//�� �Խù� ��
	public static int boardInsertCount() {
		int cnt = 0;
		SqlSession session = ssf.openSession();
		try {
			cnt = session.selectOne("boardInsertCount");
		}catch(Exception e) {
			System.out.println("boardInsertCount : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return cnt;
	}
	//�۾���
	public static void boardInsertData(BoardVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("boardInsertData",vo);
		}catch(Exception e) {
			System.out.println("boardInsertData : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//�ۻ���
	public static void boardDeleteData(int b_no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.delete("boardDeleteData",b_no);
		}catch(Exception e) {
			System.out.println("boardDeleteData : " + e.getMessage());
		}finally {
			if(session!=null) 
				session.close();
		}
	}
	
	//�� ����
	//�� ��������
	public static BoardVO boardUpdateData(int b_no) {
		BoardVO vo = new BoardVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("boardContentData",b_no);
		}catch(Exception e) {
			System.out.println("boardUpdateData : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
}
