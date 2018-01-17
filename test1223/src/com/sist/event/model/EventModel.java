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
import com.sist.member.dao.MemberVo;
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
		//점주 체크
		int grade=EventDAO.ownerCheck(email);
		//점포등록 체크
		int cb_no=EventDAO.eventCallClubbarNo(email);
		if(cb_no==0) {
			System.out.println("점포등록이 필요합니다");
		}
		
		String m_sex=EventDAO.eventGetGender(email);
		//System.out.println(m_sex);
		
		req.setAttribute("m_sex", m_sex);
		req.setAttribute("listSize", list.size());
		req.setAttribute("cb_no", cb_no);
		req.setAttribute("grade", grade);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../event/event.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("ongoingEvent.do")
	public String event_process_detail(HttpServletRequest req, HttpServletResponse res) {
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
		List<EventVO> list=EventDAO.eventOngoingData(map);
		int totalpage=EventDAO.eventOngoingPage();
		
		//점주 체크
		int grade=EventDAO.ownerCheck(email);
		//점포등록 체크
		int cb_no=EventDAO.eventCallClubbarNo(email);
		if(cb_no==0) {
			System.out.println("점포등록이 필요합니다");
		}
		
		req.setAttribute("listSize", list.size());
		req.setAttribute("cb_no", cb_no);
		req.setAttribute("grade", grade);
		req.setAttribute("oCurpage", curpage);
		req.setAttribute("oTotalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("main_jsp", "../event/ongoingEvent.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("endEvent.do")
	public String event_end_detail(HttpServletRequest req, HttpServletResponse res) {
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
		List<EventVO> list=EventDAO.eventEndData(map);
		int totalpage=EventDAO.eventEndPage();
		//System.out.println(list.get(0));
		int grade=EventDAO.ownerCheck(email);
		//점포등록 체크
		int cb_no=EventDAO.eventCallClubbarNo(email);
		if(cb_no==0) {
			System.out.println("점포등록이 필요합니다");
		}
		
		req.setAttribute("listSize", list.size());
		req.setAttribute("cb_no", cb_no);
		req.setAttribute("grade", grade);

		req.setAttribute("eCurpage", curpage);
		req.setAttribute("eTotalpage", totalpage);
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
			HttpSession session=req.getSession();
			String email=(String)session.getAttribute("m_email");	
			req.setCharacterEncoding("EUC-KR");
			
			//다운로드 폴더가 존재하지 않을때 폴더를 만들어라
			File ff=new File("c:\\eventImage");
			if(ff.exists())
				ff.mkdirs();
			//저장경로
			String path = req.getServletContext().getRealPath("\\event\\eventImage");
			System.out.println(path);
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
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date e_regdate=sdf.parse(mr.getParameter("startDate"));
			Date e_enddate=sdf.parse(mr.getParameter("endDate"));
			String content=mr.getParameter("content");
			content=content.replaceAll("\n", "<br>");
			String filename=mr.getOriginalFileName("upload");
			
			
			
			File file = new File(path + "\\" + filename);
			File file2 =  new File(path + "\\" + eno + ".jpg");
			
				if (!file.renameTo(file2)) {
					System.err.println("이름 변경 에러 : " + file);
	
				}
			//cb_no값 받아오기(여러개일 경우 포함)
			int cb_no=EventDAO.eventCallClubbarNo(email);
				
			//필수
			EventVO vo=new EventVO();
			vo.setCb_no(cb_no);
			vo.setE_no(eno);
			vo.setE_name(name);
			vo.setE_regdate(e_regdate);
			vo.setE_enddate(e_enddate);
			vo.setE_content(content);
	
			//DAO연결
			EventDAO dao=new EventDAO();
			dao.eventInsertData(vo);
			
			
			
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	
			return "event.do";
		}
	//참여 
	@RequestMapping("eventJoinAdd.do")
	public String event_joinAdd(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		String m_email=(String)session.getAttribute("m_email");	
		String e_no=req.getParameter("e_no");
		String m_sex=EventDAO.eventGetGender(m_email);
		System.out.println(m_sex+"성별");
		if(m_sex.equals("1")) {
			EventDAO.eventJoinMenAdd(Integer.parseInt(e_no));
		}else {
			EventDAO.eventJoinGirlAdd(Integer.parseInt(e_no));
		}
		
		return "event/event.jsp";
	}
	@RequestMapping("eventJoinMinus.do")
	public String event_joinMinus(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		String m_email=(String)session.getAttribute("m_email");	
		String e_no=req.getParameter("e_no");
		String m_sex=EventDAO.eventGetGender(m_email);
		if(m_sex=="1") {
			EventDAO.eventJoinMenMinus(Integer.parseInt(e_no));
		}else {
			EventDAO.eventJoinGirlMinus(Integer.parseInt(e_no));
		}
		
		return "event/event.jsp";
	}
	//관심
	@RequestMapping("eventInterest.do")
	public String event_Interest(HttpServletRequest req,HttpServletResponse res) {
		String e_no=req.getParameter("e_no");
		EventDAO.eventInterestAdd(Integer.parseInt(e_no));
		System.out.println(e_no);
		return "event/event.jsp";
	}
}
