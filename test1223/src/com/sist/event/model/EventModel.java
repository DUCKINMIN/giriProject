package com.sist.event.model;
import java.util.*;
import java.io.*;
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
		List<EventVO> list=EventDAO.eventListData(map);
		int totalpage=EventDAO.eventTotalPage();
		
		
		//점주 체크
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
		
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
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
		
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../event/endEvent.jsp");
		return "main/main.jsp";
	}
	//이벤트 등록 경로
	@RequestMapping("eventRegist.do")
	public String event_regist(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../event/eventRegist.jsp");
		return "main/main.jsp";
	}
	//이벤트 등록 
	@RequestMapping("eventInsert.do")
	public String eventInsert(HttpServletRequest req,HttpServletResponse res) throws Exception{
		try {
		req.setCharacterEncoding("EUC-KR");
		//저장경로
		String path="C:\\webDev\\mvcStudy\\Gittit\\WebContent\\event\\eventImage";
		//저장가능 용량
		int size=1024*1024*100;
		int eno = EventDAO.getLastEno()+1;
		System.out.println(eno);
		//업로드 파일 한글변환 
		String enctype="EUC-KR";
		MultipartRequest mr= new MultipartRequest(req, path, size, enctype);
		
		//DefaultFileRenamePolicy() : 파일명이 동일할때 파일명을 자동으로 변경
		//a.jpg => a1.jpg => a2.jpg
		String name=mr.getParameter("name");
		String startdate=mr.getParameter("startDate");
		String enddate=mr.getParameter("endDate");
		String content=mr.getParameter("content");
		content=content.replaceAll("\n", "<br>");
		String filename=mr.getOriginalFileName("upload");
		
		
		File file = new File(path + "\\" + filename);
		File file2 =  new File(path + "\\" + eno + ".jpg");
		
			if (!file.renameTo(file2)) {
				System.err.println("이름 변경 에러 : " + file);

			}
		
		EventVO vo=new EventVO();
		//필수
		vo.setE_no(eno);
		vo.setE_name(name);
		vo.setE_regdate(startdate);
		vo.setE_enddate(enddate);
		vo.setE_content(content);

		//DAO연결
		EventDAO dao=new EventDAO();
		dao.eventInsertData(vo);
		
	}catch(Exception ex) {
		System.out.println(ex.getMessage());
	}

		return "event.do";
	}
	

}
