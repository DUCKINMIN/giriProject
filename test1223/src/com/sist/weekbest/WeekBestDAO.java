package com.sist.weekbest;

import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class WeekBestDAO {
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

	public static WeekBestVO namecheck(String loc) {
		WeekBestVO vo = new WeekBestVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("jumpocheck", loc);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("jumpocheck = " + e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return vo;

	}

}
