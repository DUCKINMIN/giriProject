package com.sist.clubbar.dao;

import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ClubBarCommentDAO {
	private static SqlSessionFactory ssf;
	
	//XMLÆÄ½Ì ³»¿ëÀ» Àü¼Û
	static {
		try {
			//XMLÀÐ±â
			Reader reader = Resources.getResourceAsReader("Config.xml");
			//XMLÆÄ½Ì
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
	
	//´ñ±Û ¼öÁ¤
	public static void cbCommentUpdate(ClubBarCommentVO vo) {
		SqlSession session = ssf.openSession(true);
		
		try {
			session.update("cbCommentUpdate", vo);
		} catch (Exception e) {
			System.out.println("cbCommentUpdate : " + e.getMessage());
		}
		
	}
}
