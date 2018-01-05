package com.sist.clubbar.dao;

import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ClubBarCommentDAO {
	private static SqlSessionFactory ssf;
	
	//XML파싱 내용을 전송
	static {
		try {
			//XML읽기
			Reader reader = Resources.getResourceAsReader("Config.xml");
			//XML파싱
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
	
	//댓글 수정
	public static void cbCommentUpdate(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("cbCommentUpdate", vo);
		} catch (Exception e) {
			System.out.println("cbCommentUpdate : " + e.getMessage());
		}
		
	}
	
	//댓글 삭제
	public static void cbcDelete(int cbc_no) {
		SqlSession session = ssf.openSession();
		try {
			ClubBarCommentVO vo = session.selectOne("cbcDeleteData",cbc_no);
			System.out.println("cbcDelete_vo.getDepth() : " + vo.getDepth());
			if(vo.getDepth()==0) {
				session.delete("cbcDelete",cbc_no);
			}else {
				session.update("cbcContentUpdate",cbc_no);
			}
			session.update("cbcDepthDecrement", vo.getCbc_root());
			session.commit();
		} catch (Exception e) {
			session.rollback();
			System.out.println("cbcDelete : " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}

	}
	
	//대댓글 등록
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
	
	//자식 댓글 가져오기
	public static List<ClubBarCommentVO> cbcReplyList(Map map) {
		List<ClubBarCommentVO> list = new ArrayList<ClubBarCommentVO>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("cbcReplyList", map);
		} catch (Exception e) {
			System.out.println("cbcReplyList : " + e.getMessage());
		}
		
		return list;
	}
	
	//대댓글 수정
	public static void cbcReplyUpdate(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("cbcReplyUpdate", vo);
		} catch (Exception e) {
			System.out.println("cbcReplyUpdate : " + e.getMessage());
		}
	}
	
	//totalpage
	public static int totalPage(int cb_no) {
		int total = 0;
		SqlSession session = ssf.openSession();
		
		try {
			total = session.selectOne("getTotalPage", cb_no);
			System.out.println("dd"+total);
		} catch (Exception e) {
			System.out.println("getTotalPage : " + e.getMessage());
		}
		return total;
	}
}
