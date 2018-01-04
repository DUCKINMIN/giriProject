package com.sist.cb_detail.model;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.clubbar.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ClubBarModel {
	@RequestMapping("cb_detail.do")
	public String cbDetail(HttpServletRequest req, HttpServletResponse res) {

		String s_cb_no = req.getParameter("cb_no");
		int cb_no = Integer.parseInt(s_cb_no);
		ClubBarDAO.clubbarHitIncrement(cb_no);
		ClubBarVO vo = ClubBarDAO.clubbarDetail(cb_no);
		List<MotelVO> mList = MotelDAO.motelData(cb_no);
		Map map = ClubBarDAO.clubbarJjimRating(cb_no);
		
		//다솜
		//시간별 count 가져오기
		ClubBarRankVO rvo = new ClubBarRankVO();
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        String cbr_time = (new SimpleDateFormat("yy-MM-dd HH").format(date));
		rvo.setCb_no(cb_no);
		rvo.setCbr_time(cbr_time);
		int cnt = ClubBarDAO.cbrTimeCount(rvo); //count
		if(cnt==0) {
			ClubBarDAO.cbrTimeInsert(rvo); //row추가
		}
		//시간별 조회수 업데이트
		ClubBarDAO.cbrHitUpdate(rvo);
		//댓글 리스트 보내기
		String rPage = req.getParameter("rpage");
		if(rPage==null)
			rPage="1";
		int curpage = Integer.parseInt(rPage);
		int rowSize = 5;
		int rstart = (curpage*rowSize)-(rowSize-1);
		int rend = curpage*rowSize;
		Map cbc_map = new HashMap();
		cbc_map.put("start", rstart);
		cbc_map.put("end", rend);
		cbc_map.put("cb_no", cb_no);
		
		List<ClubBarCommentVO> cbc_list = ClubBarCommentDAO.cbCommentList(cbc_map);
		
		//대댓글 리스트 보내기
		String rc_Page = req.getParameter("rc_Page");
		if(rc_Page==null)
			rc_Page="1";
		int rc_curpage = Integer.parseInt(rc_Page);
		int rc_rowSize = 5;
		int rc_start = (rc_curpage*rc_rowSize) - (rc_rowSize-1);
		int rc_end = rc_curpage*rc_rowSize;
		Map rc_cbc_map = new HashMap();
		rc_cbc_map.put("start", rc_start);
		rc_cbc_map.put("end", rc_end);
		rc_cbc_map.put("cb_no", cb_no);
		
		List<ClubBarCommentVO> rc_list = ClubBarCommentDAO.cbcReplyList(rc_cbc_map);

		//리뷰등록시 리뷰쪽으로 스크롤옮기기 위해
		String review = req.getParameter("review");
		if(review==null)
			review="0";
		
		req.setAttribute("review", review);
		req.setAttribute("rc_list", rc_list);
		req.setAttribute("mList", mList);
		req.setAttribute("vo", vo);
		req.setAttribute("cb_map", map);
		req.setAttribute("cbc_list", cbc_list);
		req.setAttribute("main_jsp", "../cb_detail/cb_detail.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("cbc_new_insert.do") 
	public String cbcInsert(HttpServletRequest req, HttpServletResponse res){

		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception e) { }
		
		String cbc_rating = req.getParameter("cbc_rating");
		String cbc_content = req.getParameter("cbc_content");
		
		if(cbc_rating == null)
			cbc_rating = "0";

		int cb_no = Integer.parseInt(req.getParameter("cb_no"));
		ClubBarCommentVO cbc_vo = new ClubBarCommentVO();
		cbc_vo.setCb_no(Integer.parseInt(req.getParameter("cb_no")));
		cbc_vo.setM_email(req.getParameter("m_email"));
		cbc_vo.setCbc_content(cbc_content);
		cbc_vo.setCbc_rating(Double.parseDouble(cbc_rating));
		ClubBarCommentDAO.cbCommentInsert(cbc_vo);
		
		String review = req.getParameter("review");
		
		req.setAttribute("review", review);
		req.setAttribute("cb_no", cb_no);
		return "cb_detail/comment_ok.jsp";
	}
	
	@RequestMapping("cbc_update.do")
	public String cbcUupdate(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception e) { }
		
		String cb_no = req.getParameter("cb_no");
		System.out.println("cb_no: " + cb_no);
		String cbc_no = req.getParameter("cbc_no");
		System.out.println("cbc_no: " + cbc_no);
		String cbc_content = req.getParameter("cbc_content");
		System.out.println("cbc_content: " + cbc_content);
		double cbc_rating = Double.parseDouble(req.getParameter("update_rating_" + cbc_no));
		System.out.println("cbc_rating: " + cbc_rating);
		
		ClubBarCommentVO vo = new ClubBarCommentVO();
		vo.setCbc_no(Integer.parseInt(cbc_no));
		vo.setCbc_content(cbc_content);
		vo.setCbc_rating(cbc_rating);
		
		ClubBarCommentDAO.cbCommentUpdate(vo);
		
		String review = req.getParameter("review");
		req.setAttribute("review", review);

		return "cb_detail.do?cb_no=" + cb_no + "&review=1";
	}

	@RequestMapping("re_reply_update.do")
	public String cbc_reply_update(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception e) { }
		
		String cb_no = req.getParameter("cb_no");
		String cbc_no = req.getParameter("cbc_no");
		String cbc_content = req.getParameter("cbc_content");
		
		ClubBarCommentVO vo = new ClubBarCommentVO();
		vo.setCbc_no(Integer.parseInt(cbc_no));
		vo.setCbc_content(cbc_content);
		
		ClubBarCommentDAO.cbcReplyUpdate(vo);

		return "cb_detail.do?cb_no=" + cb_no + "&review=1";
	}
	
	
	@RequestMapping("re_reply_insert.do")
	public String cbcReReplyInsert(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception e) { }
		

		String cb_no = req.getParameter("cb_no");
		String cbc_pno = req.getParameter("cbc_pno");
		String cbc_content = req.getParameter("cbc_content");
		HttpSession session = req.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String m_nick = (String)session.getAttribute("m_nick");
		
		//부모댓글 정보 읽기
		ClubBarCommentVO pvo = ClubBarCommentDAO.cbcGetParentInfo(Integer.parseInt(cbc_pno));
		
		ClubBarCommentVO cvo = new ClubBarCommentVO();
		cvo.setCb_no(Integer.parseInt(cb_no));
		cvo.setM_email(m_email);
		cvo.setM_nick(m_nick);
		cvo.setCbc_content(cbc_content);
		cvo.setCbc_group_id(pvo.getCbc_group_id());
		cvo.setCbc_group_step(pvo.getCbc_group_step()+1);
		cvo.setCbc_group_tab(pvo.getCbc_group_tab()+1);
		cvo.setCbc_root(Integer.parseInt(cbc_pno));
		
		//step증가
		ClubBarCommentDAO.cbcStepIncrement(cvo);
		//insert
		ClubBarCommentDAO.cbcReplyInsert(cvo);
		//depth증가
		ClubBarCommentDAO.cbcDepthIncrement(Integer.parseInt(cbc_pno));

		
		String review = req.getParameter("review");
		req.setAttribute("review", review);

		return "cb_detail.do?cb_no=" + cb_no + "&review=1";
	}

	@RequestMapping("hot3.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../hot3/hot3main.jsp");
		
		return "main/main.jsp";
	}
	
	@RequestMapping("hot3search.do")
	public String hot3search(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String[] a_addr1s = req.getParameter("a_addr1").replaceAll(",", " ").split(" ");
		String cb_name = req.getParameter("cb_name");
		String[] cb_grades = req.getParameter("cb_grade").replaceAll(",", " ").split(" ");
		String order = req.getParameter("order");
		
		String cb_grade = "";
		for(int i = 0; i < cb_grades.length; i++) {
			if(!cb_grades[i].equals("")) {	
				cb_grade += cb_grades[i];
				if(i != cb_grades.length-1)
					cb_grade += ",";
			}
		}
		
		String a_addr1 = "";
		for(int i = 0; i < a_addr1s.length; i++) {
			if(!a_addr1s[i].equals("")) {	
				a_addr1 += a_addr1s[i];
				if(i != a_addr1s.length-1)
					a_addr1 += "|";
			}
		}
		
		Map map = new HashMap();
		
		map.put("cb_grade", cb_grade);
		map.put("cb_name", cb_name);
		map.put("a_addr1", a_addr1);
		map.put("order", order);
		
		List<ClubBarVO> list = ClubBarDAO.hot3Search(map);
		
		for(ClubBarVO vo:list) {
			int count = vo.getCb_content().length();
			
			if(count>=100)
				vo.setCb_content(vo.getCb_content().substring(0, 20)+"...");
		}

		req.setAttribute("list", list);
		
		return "hot3/hot3list.jsp";


	}
	
	@RequestMapping("hot3insert.do")
	public String hot3insert(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../hot3/hot3insert.jsp");
		
		return "main/main.jsp";
	}
}
