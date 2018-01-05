package com.sist.event.model;
import java.util.*;
import java.io.*;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.event.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;


@Controller
public class EventModel {
	@RequestMapping("event.do")
	public String event_detail(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session=req.getSession();
		String email=(String)session.getAttribute("m_email");
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		//System.out.println(start +","+end);
		List<EventVO> list=EventDAO.eventListData(map);
//		System.out.println(list.get(0));
//		System.out.println(list.get(1));
		int totalpage=EventDAO.eventTotalPage();
		
		//System.out.println(list.get(1).getCb().getCb_name());
		//���� üũ
		int grade=EventDAO.ownerCheck(email);
		
		req.setAttribute("grade", grade);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../event/event.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("ongoingEvent.do")
	public String event_process_detail(HttpServletRequest req, HttpServletResponse res) {
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<EventVO> list=EventDAO.eventOngoingData(map);
		int totalpage=EventDAO.eventOngoingPage();
		
		
		req.setAttribute("oCurpage", curpage);
		req.setAttribute("oTotalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../event/ongoingEvent.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("endEvent.do")
	public String event_end_detail(HttpServletRequest req, HttpServletResponse res) {
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<EventVO> list=EventDAO.eventEndData(map);
		int totalpage=EventDAO.eventEndPage();
		
		
		req.setAttribute("eCurpage", curpage);
		req.setAttribute("eTotalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../event/endEvent.jsp");
		return "main/main.jsp";
	}
	//�̺�Ʈ ��� ���
	@RequestMapping("eventRegist.do")
	public String event_regist(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../event/eventRegist.jsp");
		return "main/main.jsp";
	}
	//�̺�Ʈ ��� 
	@RequestMapping("eventInsert.do")
	public String eventInsert(HttpServletRequest req,HttpServletResponse res) throws Exception{
		try {
			HttpSession session=req.getSession();
			String email=(String)session.getAttribute("m_email");	
			req.setCharacterEncoding("EUC-KR");
			//������
			String path = req.getServletContext().getRealPath("\\event\\eventImage");
			//���尡�� �뷮
			int size=1024*1024*100;
			int eno = EventDAO.getLastEno()+1;
			System.out.println(eno);
			//���ε� ���� �ѱۺ�ȯ 
			String enctype="EUC-KR";
			MultipartRequest mr= new MultipartRequest(req, path, size, enctype);
			
			//DefaultFileRenamePolicy() : ���ϸ��� �����Ҷ� ���ϸ��� �ڵ����� ����
			//a.jpg => a1.jpg => a2.jpg
			String name=mr.getParameter("name");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date e_regdate=sdf.parse(mr.getParameter("startDate"));
			Date e_enddate=sdf.parse(mr.getParameter("closeDate"));
			String content=mr.getParameter("content");
			content=content.replaceAll("\n", "<br>");
			String filename=mr.getOriginalFileName("upload");
			
			
			
			File file = new File(path + "\\" + filename);
			File file2 =  new File(path + "\\" + eno + ".jpg");
			
				if (!file.renameTo(file2)) {
					System.err.println("�̸� ���� ���� : " + file);
	
				}
			//cb_no�� �޾ƿ���(�������� ��� ����)
			int cb_no=EventDAO.eventCallClubbarNo(email);
				
			//�ʼ�
			EventVO vo=new EventVO();
			vo.setCb_no(cb_no);
			vo.setE_no(eno);
			vo.setE_name(name);
			vo.setE_regdate(e_regdate);
			vo.setE_enddate(e_enddate);
			vo.setE_content(content);
	
			//DAO����
			EventDAO dao=new EventDAO();
			dao.eventInsertData(vo);
			
			
			
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	
			return "event.do";
		}
		

}
