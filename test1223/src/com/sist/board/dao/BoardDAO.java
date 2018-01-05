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
			//System.out.println("dao"+list.get(0));
		}catch(Exception e) {
			System.out.println("boardList : "+e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
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
	
	//글삭제
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
	
	//글 수정
	//글 가져오기
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
	//이미지 카운트 가져오기
	public static int boardImgCnt(int b_no) {
		int cnt = 0;
		SqlSession session = ssf.openSession();
		try {
			cnt = session.selectOne("boardImgCnt",b_no);
		}catch(Exception e) {
			System.out.println("boardImgCnt : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return cnt;
	}
	//수정
	public static void boardUpdate(BoardVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("boardUpdateData",vo);
		}catch(Exception e) {
			System.out.println("boardUpdate : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//검색
	public static List<BoardVO> boardSearch(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		String select = (String)map.get("select");
		SqlSession session = ssf.openSession();
		try {
			if(select.equals("b_subject"))
				list = session.selectList("boardSubjectSearch",map);
			else 
				list = session.selectList("boardNickSearch",map);
		}catch(Exception e) {
			System.out.println("boardSearch : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	//검색
	public static int searchSubjectPage(Map map) {
		int cnt = 0;
		SqlSession session = ssf.openSession();
		try {
			cnt = session.selectOne("searchSubjectPage",map);
		}catch(Exception e) {
			System.out.println("searchSubjectPage : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return cnt;
	}
	public static int searchNickPage(Map map) {
		int cnt = 0;
		SqlSession session = ssf.openSession();
		try {
			cnt = session.selectOne("searchNickPage",map);
		}catch(Exception e) {
			System.out.println("searchNickPage : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return cnt;
	}

	//댓글 리스트 출력
	public static List<BoardCommentVO> commentListData(Map map) {
		List<BoardCommentVO> list = new ArrayList<BoardCommentVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("commentListData",map);
		}catch(Exception e) {
			System.out.println("commentListData : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return list;
		
	}
	//댓글 총페이지 수
	public static int commentTotalPage(int b_no) {
		int totalpage = 0;
		SqlSession session = ssf.openSession();
		try {
			totalpage = session.selectOne("commentTotalPage",b_no);
		}catch(Exception e) {
			System.out.println("commentTotalPage : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return totalpage;
	}
	//새 댓글
	public static void commentNewInsert(BoardCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.insert("commentNewInsert",vo);
		}catch(Exception e) {
			System.out.println("commentNewInsert : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//댓글 수정
	public static void commentUpdate(BoardCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("commentUpdate",vo);
		}catch(Exception e) {
			System.out.println("commentUpdate : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//댓글 삭제
	public static void commentDelete(int bc_no) {
		SqlSession session = ssf.openSession();
		
		try {
			BoardCommentVO vo = session.selectOne("commentDeleteData",bc_no);
			if(vo.getDepth()==0) {
				session.update("commentDelete",bc_no);
			}else {
				session.delete("commentContentUpdate",bc_no);
			}
			session.update("commentDepthDecrement",vo.getBc_root());
			session.commit();
		}catch(Exception e) {
			session.rollback();
			System.out.println("commentDelete : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//대댓 목록
	public static List<BoardCommentVO> coCommentListData(int b_no) {
		List<BoardCommentVO> list = new ArrayList<BoardCommentVO>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("coCommentListData",b_no);
		}catch(Exception e) {
			System.out.println("coCommentListData : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	//대댓 총 페이지수
	public static int coCommentTotalPage(Map map) {
		int ccpage = 0;
		SqlSession session = ssf.openSession();
		
		try {
			ccpage = session.selectOne("coCommentTotalPage",map);
		}catch(Exception e) {
			session.rollback();
			System.out.println("coCommentTotalPage : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return ccpage;
	}
	
	//부모댓글 검색
	public static BoardCommentVO commentGetParentInfo(int bc_no) {
		SqlSession session = ssf.openSession();
		BoardCommentVO vo = new BoardCommentVO();
		try {
			vo = session.selectOne("commentGetParentInfo",bc_no);
			
		}catch(Exception e) {
			System.out.println("commentGetParentInfo : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	//step증가
	public static void commentStepIncrement(BoardCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("commentStepIncrement",vo);
		}catch(Exception e) {
			System.out.println("commentStepIncrement : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//대댓 입력
	public static void coComentInsert(BoardCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.insert("coComentInsert",vo);
		}catch(Exception e) {
			System.out.println("coComentInsert : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	//부모 depth증가
	//대댓 입력
	public static void commentDepthIncrement(int cb_no) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("commentDepthIncrement",cb_no);
		}catch(Exception e) {
			System.out.println("commentDepthIncrement : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
}
