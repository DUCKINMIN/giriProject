package com.sist.event.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class EventDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	//��ü �̺�Ʈ
	public static List<EventVO> eventListData(Map map){
		List<EventVO> list=new ArrayList<EventVO>();
		SqlSession session=ssf.openSession();
		
		try {
			list=session.selectList("eventListData",map);

			System.out.println(list.get(1).getCb().getCb_name());
		}catch(Exception ex) {
			System.out.println("eventListData"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int eventTotalPage() {
		int total=0;
		SqlSession session=ssf.openSession();
		try {
			total=session.selectOne("eventTotalPage");
		}catch(Exception ex) {
			System.out.println("eventTotalPage"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	//�������� �̺�Ʈ
	public static List<EventVO> eventOngoingData(Map map){
		List<EventVO> list=new ArrayList<EventVO>();
		SqlSession session=ssf.openSession();
		
		try {
			list=session.selectList("eventOngoingData",map);
			//System.out.println(list.get(1).getE_enddate());
		}catch(Exception ex) {
			System.out.println("eventOngoingData"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int eventOngoingPage() {
		int total=0;
		SqlSession session=ssf.openSession();
		try {
			total=session.selectOne("eventOngoingPage");
		}catch(Exception ex) {
			System.out.println("eventOngoingPage"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	//����� �̺�Ʈ
	public static List<EventVO> eventEndData(Map map){
		List<EventVO> list=new ArrayList<EventVO>();
		SqlSession session=ssf.openSession();
		
		try {
			list=session.selectList("eventEndData",map);
			//System.out.println(list.get(1).getE_enddate());
		}catch(Exception ex) {
			System.out.println("eventEndData"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int eventEndPage() {
		int total=0;
		SqlSession session=ssf.openSession();
		try {
			total=session.selectOne("eventEndPage");
		}catch(Exception ex) {
			System.out.println("eventEndPage"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	public static void eventInsertData(EventVO vo) {
		SqlSession session=ssf.openSession(true);
		try {
			session.insert("eventInsertData",vo);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static int getLastEno() {
		int eno = 0;
		SqlSession session=ssf.openSession();
		try {
			eno = session.selectOne("getLastEno");
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return eno;
	}
	
	public static int ownerCheck(String m_email) {
		int grade = 0;
		SqlSession session=ssf.openSession();
		try {
			grade = session.selectOne("ownerCheck",m_email);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return grade;	
	}
	//cb_no �� �ҷ�����
	//mapper resultType =>���̺� ��
	//selectOne(), selectList() =>���̺� ��
	public static int eventCallClubbarNo(String m_email) {
		int cb_no=0;
		SqlSession session=ssf.openSession();
		try {
			cb_no=session.selectOne("eventCallClubbarNo",m_email);
		}catch(Exception ex) {
			System.out.println("eventCallClubbarNo"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return cb_no;
	}
}














