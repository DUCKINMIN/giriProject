package com.sist.clubbar.dao;

import java.util.*;
import java.io.Reader;

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

}
