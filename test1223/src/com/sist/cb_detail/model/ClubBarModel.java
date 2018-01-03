package com.sist.cb_detail.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.clubbar.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;

@Controller
public class ClubBarModel {
	@RequestMapping("cb_detail.do")
	public String cbDetail(HttpServletRequest req, HttpServletResponse res) {
//		String cb_no = req.getParameter("cb_no");
		String s_cb_no = "34";
		int cb_no = Integer.parseInt(s_cb_no);
		ClubBarDAO.clubbarHitIncrement(cb_no);
		ClubBarVO vo = ClubBarDAO.clubbarDetail(cb_no);
		List<MotelVO> mList = MotelDAO.motelData(cb_no);
		Map map = ClubBarDAO.clubbarJjimRating(cb_no);
		
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
		

		//리뷰등록시 리뷰쪽으로 스크롤옮기기 위해
		String review = req.getParameter("review");
		if(review==null)
			review="0";
		
		req.setAttribute("review", review);
		
		req.setAttribute("mList", mList);
		req.setAttribute("vo", vo);
		req.setAttribute("cb_map", map);
		req.setAttribute("cbc_list", cbc_list);
		System.out.println("ClubBarModel_jjim : " + map.get("JJIM") );
		System.out.println("vo.cb_name : " + vo.getCb_name());
		req.setAttribute("main_jsp", "../cb_detail/cb_detail.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("cbc_new_insert.do") 
	public String cbcInsert(HttpServletRequest req, HttpServletResponse res){

		try {
			req.setCharacterEncoding("EUC-KR");
		} catch (Exception e) { }

		int cb_no = Integer.parseInt(req.getParameter("cb_no"));
		ClubBarCommentVO cbc_vo = new ClubBarCommentVO();
		cbc_vo.setCb_no(Integer.parseInt(req.getParameter("cb_no")));
		cbc_vo.setCbc_content(req.getParameter("cbc_content"));
		cbc_vo.setCbc_rating(Double.parseDouble(req.getParameter("cbc_rating")));
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

		return "cb_detail.do?cb_no=" + cb_no;
	}
}
