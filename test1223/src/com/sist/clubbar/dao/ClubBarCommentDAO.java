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
}
