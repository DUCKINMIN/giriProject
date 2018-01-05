package com.sist.clubbar.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ClubBarDAO {
	
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
	
	public static ClubBarVO clubbarDetail(int cb_no) {
		ClubBarVO vo = new ClubBarVO();
		SqlSession session = ssf.openSession();
		
		try {
			vo = session.selectOne("clubbarDetail", cb_no);
			System.out.println("clubbarDetail_vo : " + vo);
		} catch (Exception e) {
			System.out.println("clubbarDetail : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
	
	public static void clubbarHitIncrement(int cb_no) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("clubbarHitIncrement", cb_no);
		} catch (Exception e) {
			System.out.println("clubbarHitIncrement : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
	}
	
	//찜수
	public static int cartCount(CartVO vo) {
		int cnt = 0;
		SqlSession session = ssf.openSession();
		try {
			cnt = session.selectOne("cartCount", vo);
		}catch(Exception e) {
			System.out.println("cartCount : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return cnt;
	}
	
	//찜저장
	public static void cartInsert(CartVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.insert("cartInsert", vo);
		} catch (Exception e) {
			System.out.println("cartInsert : " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}

	}
	
	//찜 취소
	public static void cartDelete(CartVO vo) {
		SqlSession session = ssf.openSession();
		try {
			session.delete("cartDelete", vo);
			session.commit();
		}catch(Exception e){
			System.out.println("cartDelete : " + e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static Map clubbarJjimRating(int cb_no) {
		Map map = new HashMap();
		SqlSession session = ssf.openSession();
		
		try {
			map = session.selectOne("clubbarJjimRating", cb_no);
			 System.out.println("clubbarJjim : " + map.get("JJIM"));
		} catch (Exception e) {
			System.out.println("clubbarJjim : " + e.getMessage());
		}
		
		return map;
	}

	public static List<ClubBarVO> hot3Search(Map map) {
		List<ClubBarVO> list = new ArrayList<ClubBarVO>();
		SqlSession session = ssf.openSession();
		
		try {
			list = session.selectList("hot3Search", map);
		} catch(Exception ex) {
			System.out.println("hot3Search() : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
		
		return list;
	}
	
	public static int cbNoMax() {
		int no = -1;
		SqlSession session = ssf.openSession();
		
		try {
			no = session.selectOne("cbNoMax");
		} catch(Exception ex) {
			System.out.println("cbNoMax : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
		return no;
	}
	
	public static void hot3cbInsert(ClubBarVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			try {
				session.insert("addrInsert", vo);
			} catch(Exception e) {}
			session.insert("hot3cbInsert", vo);
		} catch(Exception ex) {
			System.out.println("hot3cbInsert : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
	}
	
	public static int getCbImgCnt(int cb_no) {
		int count = 0;
		SqlSession session = ssf.openSession();
		
		try {
			count = session.selectOne("getCbImgCnt", cb_no);
		} catch(Exception ex) {
			System.out.println("getCbImgCnt : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
		return count;
	}
	
	public static void hot3cbDelete(int cb_no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.delete("hot3cbDelete", cb_no);
		} catch(Exception ex) {
			System.out.println("hot3cbDelete : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
	}
	
	public static List<ClubBarVO> getMyCb(String m_email) {
		List<ClubBarVO> list = new ArrayList<ClubBarVO>();
		SqlSession session = ssf.openSession();
		try {
			list = session.selectList("getMyCb", m_email);
		} catch(Exception ex) {
			System.out.println("getMyCb : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
		return list;
	}
	
	/*public static ClubBarVO getUpdateCol(int cb_no) {
		ClubBarVO vo = new ClubBarVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("getUpdateCol", cb_no);
		} catch(Exception ex) {
			System.out.println("getUpdateCol : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
		return vo;
	}*/
	
	public static void hot3cbUpdate(ClubBarVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("hot3cbUpdate", vo);
		} catch(Exception ex) {
			System.out.println("hot3cbUpdate : "+ex.getMessage());
		} finally {
			if(session != null) 
				session.close();
		}
	}
	
	//다솜
		//카운트
		public static int cbrTimeCount(ClubBarRankVO vo) {
			int cnt = 0;
			SqlSession session = ssf.openSession();
			
			try {
				cnt = session.selectOne("cbrTimeCount", vo);
			} catch(Exception ex) {
				System.out.println("cbrTimeCount : "+ex.getMessage());
			} finally {
				if(session != null) 
					session.close();
			}
			
			return cnt;
		}
		//시간별  row 추가
		public static void cbrTimeInsert(ClubBarRankVO vo) {
			SqlSession session = ssf.openSession(true);
			try {
				session.insert("cbrTimeInsert", vo);
			} catch(Exception ex) {
				System.out.println("cbrTimeInsert : "+ex.getMessage());
			} finally {
				if(session != null) 
					session.close();
			}
		}
		//시간별 조회수 증가
		public static void cbrHitUpdate(ClubBarRankVO vo) {
			SqlSession session = ssf.openSession(true);
			try {
				session.insert("cbrHitUpdate", vo);
			} catch(Exception ex) {
				System.out.println("cbrHitUpdate : "+ex.getMessage());
			} finally {
				if(session != null) 
					session.close();
			}
		}
		//리스트
		public static List<ClubBarRankVO> cbrList(String cbr_time){
			List<ClubBarRankVO> list = new ArrayList<ClubBarRankVO>();
			SqlSession session = ssf.openSession();
			try {
				list = session.selectList("cbrList",cbr_time);
			} catch(Exception ex) {
				System.out.println("cbrList : "+ex.getMessage());
			} finally {
				if(session != null) 
					session.close();
			}
			return list;
		}
}
