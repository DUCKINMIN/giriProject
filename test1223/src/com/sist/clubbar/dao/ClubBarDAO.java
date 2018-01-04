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
	
	//�ټ�
		//ī��Ʈ
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
		//�ð���  row �߰�
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
		//�ð��� ��ȸ�� ����
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
		//����Ʈ
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
