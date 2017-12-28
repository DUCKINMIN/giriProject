package com.sist.model;

import java.util.*;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.oreilly.servlet.MultipartRequest;
import com.sist.board.dao.*;


@Controller
public class BoardModel {
	@RequestMapping("board_list.do")
	public String ssul_list(HttpServletRequest req, HttpServletResponse res) {
		String page = req.getParameter("page");
		String grade = req.getParameter("grade");
		if(page==null) {
			page="1";
		}
		if(grade==null) {
			grade="0";
		}
		int igrade = Integer.parseInt(grade);
		System.out.println("board_list.do grade : " + igrade);

		int rowSize = 10;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = (rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("grade", igrade);
		int totalpage = BoardDAO.boardTotalPage(igrade);
		int boardCount = BoardDAO.boardListCount(igrade);
		System.out.println("vo boardCount : "+boardCount);
		List<BoardVO> list = BoardDAO.boardList(map);
		
		//list.jsp 로 값 전송(req.setAttribute())
		req.setAttribute("cnt", boardCount);
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list); 
		req.setAttribute("grade", grade);
		req.setAttribute("main_jsp", "../board/board_main.jsp");
		req.setAttribute("sub_jsp", "../board/list.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("board_content.do")
	public String ssul_content(HttpServletRequest req, HttpServletResponse res) {
		String no = req.getParameter("no");
		String page = req.getParameter("page");
		String grade = req.getParameter("grade");
		System.out.println(grade);
		int igrade = Integer.parseInt(grade);
		int curpage = Integer.parseInt(page);
		int b_no = Integer.parseInt(no);
		Map map = new HashMap();
		map.put("b_no", b_no);
		map.put("grade", igrade);
		BoardDAO.boardHitIncrement(map);//조회수 증가
		BoardVO vo = BoardDAO.boardContentData(map); //상세보기
	
		req.setAttribute("vo", vo);
		req.setAttribute("page", curpage);
		req.setAttribute("grade", grade);
		req.setAttribute("main_jsp", "../board/board_main.jsp");
		req.setAttribute("sub_jsp", "../board/content.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("board_insert.do")
	public String board_insert(HttpServletRequest req, HttpServletResponse res) {
//		String page = req.getParameter("page");
		String grade = req.getParameter("grade");
		int igrade = Integer.parseInt(grade);
//		int curpage = Integer.parseInt(page);

//		req.setAttribute("page", curpage);
		req.setAttribute("grade", grade);
		req.setAttribute("main_jsp", "../board/board_main.jsp");
		req.setAttribute("sub_jsp", "../board/insert.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("board_insert_ok.do")
	public String board_insert_ok(HttpServletRequest req, HttpServletResponse res) throws Throwable  {
		req.setCharacterEncoding("EUC-KR");
		String path = req.getServletContext().getRealPath("/boardImg"); //파일 다운받을 폴더
		System.out.println("path  " + path);
		int size = 1024*1024*100;
		String enctype = "EUC-KR";
		//파일업로드 라이브러리
		MultipartRequest mr = new MultipartRequest(req, path, size, enctype);
		String filename = mr.getOriginalFileName("uploadFile");
		
		String m_email = mr.getParameter("m_email");
		String b_subject = mr.getParameter("b_subject");
		String b_content = mr.getParameter("b_content");
		b_content = b_content.replaceAll("\n", "<br>");
		String b_grade = mr.getParameter("grade");
		System.out.println("b_grade"+b_grade);
		BoardVO vo = new BoardVO();
		vo.setM_email(m_email);
		vo.setB_subject(b_subject);
		vo.setB_content(b_content);
		vo.setB_grade(Integer.parseInt(b_grade));
		BoardDAO.boardInsertData(vo); //입력
		int b_no = BoardDAO.boardInsertCount()+2;
		
		if (filename != null) {
			System.out.println("b_no"+b_no);
            File f = new File(path+"\\"+filename);
            File f2 = new File(path+"\\board_"+b_no+".jpg");
            if (!f.renameTo(f2)) {
               System.err.println("이름 변경 에러 : " + f);
            }   
         }
		req.setAttribute("grade", b_grade);
		return "board_list.do?grade="+b_grade; //_ok일때 .do~
	}
}
