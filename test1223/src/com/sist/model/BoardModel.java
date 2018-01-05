package com.sist.model;

import java.util.*;
import java.io.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String ssul_content(HttpServletRequest req, HttpServletResponse res) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		String no = req.getParameter("no");
		String page = req.getParameter("page");
		String grade = req.getParameter("grade");
		if(page==null)
			page="1";
		
		int igrade = Integer.parseInt(grade);
		int curpage = Integer.parseInt(page);
		int b_no = Integer.parseInt(no);
		Map map = new HashMap();
		map.put("b_no", b_no);
		map.put("grade", grade);
		BoardDAO.boardHitIncrement(map);//조회수 증가
		BoardVO vo = BoardDAO.boardContentData(b_no); //상세보기
		///////////////////////////////////////////////////////
		
		int rowSize = 5;
		String cpage = req.getParameter("cpage");
		if(cpage==null)
			cpage = "1";
		int icpage = Integer.parseInt(cpage);
		int totalpage = BoardDAO.commentTotalPage(b_no);
		int start = (rowSize*icpage)-(rowSize-1);
		int end = (rowSize*icpage);
		Map cmap = new HashMap();//댓글 맵
		cmap.put("b_no", no);
		cmap.put("start", start);
		cmap.put("end", end);
		List<BoardCommentVO> clist = BoardDAO.commentListData(cmap);
		List<BoardCommentVO> cclist = BoardDAO.coCommentListData(cmap);

		//int ccpage = BoardDAO.coCommentTotalPage(cmap);
		req.setAttribute("clist", clist);
		req.setAttribute("cclist", cclist);
		req.setAttribute("vo", vo);
		req.setAttribute("page", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("ccpage", 1);
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
		String path = req.getServletContext().getRealPath("/board/boardImg"); //파일 다운받을 폴더
		//String path="C:\\git\\giriProject\\test1223\\WebContent\\board\\boardImg";
		System.out.println(path);
		int size = 1024*1024*100;
		String enctype = "EUC-KR";
		//파일업로드 라이브러리
		MultipartRequest mr = new MultipartRequest(req, path, size, enctype);
		String filename = mr.getOriginalFileName("uploadFile");
		int b_img_cnt = 0;
		String m_email = mr.getParameter("m_email");
		String b_subject = mr.getParameter("b_subject");
		String b_content = mr.getParameter("b_content");
		b_content = b_content.replaceAll("\n", "<br>");
		String b_grade = mr.getParameter("grade");

		BoardVO vo = new BoardVO();
		vo.setM_email(m_email);
		vo.setB_subject(b_subject);
		vo.setB_content(b_content);
		vo.setB_grade(Integer.parseInt(b_grade));
		
		int b_no = BoardDAO.boardInsertCount();
		
		if (filename != null) {
			System.out.println("b_no"+b_no);
			b_img_cnt = b_img_cnt + 1;
            File f = new File(path+"\\"+filename);
            File f2 = new File(path+"\\board_"+b_no+".jpg");
            if (!f.renameTo(f2)) {
               System.err.println("이름 변경 에러 : " + f);
            }   
         }
		vo.setB_img_cnt(b_img_cnt);
		BoardDAO.boardInsertData(vo); //입력
		req.setAttribute("grade", b_grade);
		return "board_list.do?grade="+b_grade; //_ok일때 .do~
	}

	@RequestMapping("board_delete_ok.do")
	public String board_delete_ok(HttpServletRequest req, HttpServletResponse res) {
		String b_grade = req.getParameter("grade");
		String b_no = req.getParameter("no");
		String page = req.getParameter("page");
		BoardDAO.boardDeleteData(Integer.parseInt(b_no));
		String fileName = "board_" + b_no+".jpg"; //지울 파일명
		String path = req.getServletContext().getRealPath("/board/boardImg/"); //파일이 존재하는 실제경로
		path += fileName;
		File f = new File(path); // 파일 객체생성
		System.out.println("delete path : " + path);
		if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.
		
		/*req.setAttribute("page", page);
		req.setAttribute("grade", b_grade);*/
		return "board_list.do?page="+page+"&grade="+b_grade;
	}
	//글 수정
	@RequestMapping("board_update.do")
	public String board_update(HttpServletRequest req, HttpServletResponse res) {
		String b_no = req.getParameter("no");
		// DB
		BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(b_no));

		req.setAttribute("vo", vo);
		req.setAttribute("grade", vo.getB_grade());
		req.setAttribute("main_jsp", "../board/board_main.jsp");
		req.setAttribute("sub_jsp", "../board/update.jsp");
		return "main/main.jsp";
	}
	@RequestMapping("board_update_ok.do")
	public String board_update_ok(HttpServletRequest req, HttpServletResponse res) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		String path = req.getServletContext().getRealPath("/board/boardImg"); //파일 다운받을 폴더
		int size = 1024*1024*100;
		String enctype = "EUC-KR";
		//파일업로드 라이브러리
		MultipartRequest mr = new MultipartRequest(req, path, size, enctype);
		String filename = mr.getOriginalFileName("uploadFile");
		int b_no = Integer.parseInt(mr.getParameter("b_no"));
		System.out.println("b_no"+b_no);
		String m_email = mr.getParameter("m_email");
		String b_subject = mr.getParameter("b_subject");
		String b_content = mr.getParameter("b_content");
		b_content = b_content.replaceAll("\n", "<br>");
		String b_grade = mr.getParameter("grade");
		int b_img_cnt = BoardDAO.boardImgCnt(b_no);
		
		BoardVO vo = new BoardVO();
		vo.setM_email(m_email);
		vo.setB_subject(b_subject);
		vo.setB_content(b_content);
		vo.setB_grade(Integer.parseInt(b_grade));
		vo.setB_no(b_no);
		
		if (filename != null) {
			File oldFile = new File(path+"\\board_"+b_no+".jpg");
			oldFile.delete();
			b_img_cnt = 1;
            File f = new File(path+"\\"+filename);
            File f2 = new File(path+"\\board_"+b_no+".jpg");
            if (!f.renameTo(f2)) {
               System.err.println("이름 변경 에러 : " + f);
            }   
         }
		
		vo.setB_img_cnt(b_img_cnt);
		BoardDAO.boardUpdate(vo); //입력
		
		return "board_content.do?no="+b_no+"&grade="+b_grade;
	}
	
	//검색
	@RequestMapping("board_search.do")
	public String board_search(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		int totalpage = 0;
		String page = req.getParameter("page");
		String grade = req.getParameter("grade");
		String select = req.getParameter("select");
		String strSearch = req.getParameter("strSearch");
		strSearch = strSearch.trim();
		
		if(page==null) {
			page="1";
		}
		if(grade==null) {
			grade="0";
		}
		int igrade = Integer.parseInt(grade);
		int rowSize = 10;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = (rowSize*curpage);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("grade", igrade);
		map.put("select", select);
		map.put("strSearch", strSearch);
		if(select.equals("b_subject"))
			totalpage = BoardDAO.searchSubjectPage(map);
		else 
			totalpage = BoardDAO.searchNickPage(map);
		
		List<BoardVO> list = BoardDAO.boardSearch(map);
		
		//list.jsp 로 값 전송(req.setAttribute())
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list); 
		req.setAttribute("grade", grade);
		req.setAttribute("select", select);
		req.setAttribute("strSearch", strSearch);
		req.setAttribute("main_jsp", "../board/board_main.jsp");
		req.setAttribute("sub_jsp", "../board/search.jsp");
		return "main/main.jsp";
	}
	
	//댓글 입력
	@RequestMapping("board_comment_insert.do")
	public String board_commnet_insert(HttpServletRequest req, HttpServletResponse res) throws Exception{
		req.setCharacterEncoding("EUC-KR");
		String m_email = req.getParameter("m_email");
		int b_no = Integer.parseInt(req.getParameter("b_no"));
		String bc_content = req.getParameter("bc_content");
		String grade = req.getParameter("grade");
		String page = req.getParameter("page");

		BoardCommentVO vo = new BoardCommentVO();
		vo.setM_email(m_email);
		vo.setB_no(b_no);
		vo.setBc_content(bc_content);
		BoardDAO.commentNewInsert(vo);
		
		req.setAttribute("no", b_no);
		req.setAttribute("grade", grade);
		req.setAttribute("page", page);
		return "board/comment_ok.jsp";
	}
	
	//댓글 입력
		@RequestMapping("board_comment_update.do")
		public String board_comment_update(HttpServletRequest req, HttpServletResponse res) throws Exception{
			req.setCharacterEncoding("EUC-KR");
			String m_email = req.getParameter("m_email");
			int b_no = Integer.parseInt(req.getParameter("b_no"));
			int bc_no = Integer.parseInt(req.getParameter("bc_no"));
			String bc_content = req.getParameter("bc_content");
			String grade = req.getParameter("grade");
			String page = req.getParameter("page");

			BoardCommentVO vo = new BoardCommentVO();
			vo.setM_email(m_email);
			vo.setB_no(b_no);
			vo.setBc_content(bc_content);
			vo.setBc_no(bc_no);
			BoardDAO.commentUpdate(vo);
			
			req.setAttribute("no", b_no);
			req.setAttribute("grade", grade);
			req.setAttribute("page", page);
			return "board/comment_ok.jsp";
		}
		
		@RequestMapping("board_comment_delete.do")
		public String board_comment_delete(HttpServletRequest req, HttpServletResponse res) {
			int b_no = Integer.parseInt(req.getParameter("b_no"));
			int bc_no = Integer.parseInt(req.getParameter("bc_no"));
			String grade = req.getParameter("grade");
			String page = req.getParameter("page");
			
			BoardDAO.commentDelete(bc_no);
			
			req.setAttribute("no", b_no);
			req.setAttribute("grade", grade);
			req.setAttribute("page", page);
			return "board/comment_ok.jsp";
		}
		
		//대댓글 입력
		@RequestMapping("board_cocoment_insert.do")
		public String board_reply_reply_insert(HttpServletRequest req, HttpServletResponse res) {
			try {
				req.setCharacterEncoding("EUC-KR");
			}catch(Exception e) {
				e.printStackTrace();
			}
			String grade = req.getParameter("grade");
			String page = req.getParameter("page");
			String b_no = req.getParameter("b_no");
			String bc_pcno = req.getParameter("bc_pcno");
			String bc_pcnick = req.getParameter("bc_pcnick");
			String bc_root = "";
			if (bc_pcno==null)
				bc_root = req.getParameter("bc_root");
			String bc_content = req.getParameter("bc_content");
			HttpSession session = req.getSession();
			String m_email = (String)session.getAttribute("m_email");
			//대대댓글인 경우 => 부모를 설정
			if(bc_pcno != null) {
				bc_root = bc_pcno;
				bc_pcnick += bc_content;
				bc_content = bc_pcnick;
			}
			//DB연동
			BoardCommentVO pvo = BoardDAO.commentGetParentInfo(Integer.parseInt(bc_root));
			BoardCommentVO vo = new BoardCommentVO();
			
			vo.setB_no(Integer.parseInt(b_no));
			vo.setM_email(m_email);
			vo.setBc_content(bc_content);
			vo.setBc_root(Integer.parseInt(bc_root));
			vo.setBc_group_id(pvo.getBc_group_id());
			vo.setBc_group_step(pvo.getBc_group_step()+1);
			vo.setBc_group_tab(pvo.getBc_group_tab()+1);
			//step증가
			BoardDAO.commentStepIncrement(pvo); //상위 vo를 줘야 하위 commnet step증가
			//insert
			BoardDAO.coComentInsert(vo);
			//depth증가
			BoardDAO.commentDepthIncrement(Integer.parseInt(bc_root));
			//전송
			//req.setAttribute("no", bno); //sendredirect는 값을 보낼 수 없음 ?뒤에 실어줬음
			
			req.setAttribute("no", b_no);
			req.setAttribute("grade", grade);
			req.setAttribute("page", page);
			return "board/comment_ok.jsp";
		}
	
}
