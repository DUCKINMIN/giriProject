package com.sist.board.dao;
import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	
	//XML파싱 내용을 전송
	static {
		try {
			// XML읽기
			Reader reader = Resources.getResourceAsReader("Config.xml");

			// XML파싱
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("Config.xml"+e.getMessage());
		}
	}
	
	//리스트 
	public static List<BoardVO> boardList(Map map){
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("boardList",map);
		}catch(Exception e) {
			System.out.println("boardList : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		System.out.println("dao"+list.get(0));
		return list;
	}
	//grade별 게시물 수
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
	
	//총페이지
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
	
	//상세보기
	public static BoardVO boardContentData(Map map) {
		BoardVO vo = new BoardVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("boardContentData",map);
		}catch(Exception e) {
			System.out.println("boardContentData : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	//조회수 증가
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

	
	//총 게시물 수
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
	//글쓰기
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
}
