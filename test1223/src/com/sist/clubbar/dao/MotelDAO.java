package com.sist.clubbar.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;

public class MotelDAO {
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
	
	public static List<MotelVO> motelData(int cb_no) {
		SqlSession session = ssf.openSession();
		List<MotelVO> list = new ArrayList<MotelVO>();
		
		try {
			list = session.selectList("motelData", cb_no);
		} catch (Exception e) {
			System.out.println("motelData : " + e.getMessage());
		} finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}
}
