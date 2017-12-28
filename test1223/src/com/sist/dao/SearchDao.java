package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SearchDao {
	private static SqlSessionFactory ssf;
	// xml 파싱내용을 전송
	static {
		try {
			// xml 읽기
			Reader reader = Resources.getResourceAsReader("Config.xml");
			// xml 파싱
			ssf = new SqlSessionFactoryBuilder().build(reader);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public static List<SearchVo> namecheck(Map map) {
		SqlSession session = ssf.openSession();
		List<SearchVo> vo = new ArrayList<>();

		try {
			vo = session.selectOne("jumpoCheck", map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("namecheck = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;

	}
}
