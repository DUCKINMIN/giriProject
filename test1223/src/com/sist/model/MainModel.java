package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.board.dao.BoardVO;
import com.sist.clubbar.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.SearchDao;
import com.sist.dao.SearchVo;
import com.sist.weekbest.WeekBestDAO;
import com.sist.weekbest.WeekBestVO;

@Controller
public class MainModel {
	@RequestMapping("main.do")
	public String main_page(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../main2/main2.jsp");
		return "main/main.jsp";
	}

	@RequestMapping("mainsearch.do")
	public String search_main(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String search_name = req.getParameter("search_name");
		String addr_name = "";
		if (search_name.equals("ȫ��")) {
			addr_name = "����";
		} else if (search_name.equals("����")) {
			addr_name = "����";
		} else if (search_name.equals("���¿�")) {
			addr_name = "���";
		} else {

			addr_name = search_name;
		}
		
		
		/////////////////////////////////////////////////// ù�Խ��� ����
		String p1 = req.getParameter("p1");
		if (p1 == null)
			p1 = "1";
		int curpage1 = Integer.parseInt(p1);
		int rowSize = 5;
		int start = (curpage1 * rowSize) - (rowSize - 1);
		int end = curpage1 * rowSize;
		int totalpage1 = 0;
		
		

		Map map = new HashMap();
		map.put("addr_name", addr_name);
		map.put("search_name", search_name);
		map.put("start", start);
		map.put("end", end);

		List<SearchVo> list1 = SearchDao.namecheck(map);
		
		totalpage1 = SearchDao.TotalPage(addr_name);
		/////////////////////////////////////////////////////////////////////////////////////////�� �Խ��� ����
		String p2 = req.getParameter("p2");

		if (p2 == null)
			p2 = "1";
		int curpage2 = Integer.parseInt(p2);
		int start2 = (curpage2 * rowSize) - (rowSize - 1);
		int end2 = curpage2 * rowSize;
		int totalpage2 = 0;

		Map map2 = new HashMap();
		map2.put("addr_name", addr_name);
		map2.put("search_name", search_name);
		map2.put("start2", start2);
		map2.put("end2", end2);
		List<BoardVO> list2 = SearchDao.namecheck2(map2);
		totalpage2 = SearchDao.TotalPage2(search_name);

		////////////////////////////////////////////////////3�Խ��� ����
		// DAO�Ű����� �־��ְ�
		
		String p3 = req.getParameter("p3");

		if (p3 == null)
			p3 = "1";
		int curpage3 = Integer.parseInt(p3);
		int start3 = (curpage3 * rowSize) - (rowSize - 1);
		int end3 = curpage3 * rowSize;
		int totalpage3 = 0;

		Map map3 = new HashMap();
		map3.put("search_name", search_name);
		map3.put("start3", start3);
		map3.put("end3", end3);
		List<BoardVO> list3 = SearchDao.namecheck3(map3);
		totalpage3 = SearchDao.TotalPage3(search_name);		
		
		//////////////////////////////////////////////////������
		req.setAttribute("search_name", search_name);
		req.setAttribute("curpage1", curpage1);
		req.setAttribute("list1", list1);
		req.setAttribute("totalpage1", totalpage1);

		req.setAttribute("curpage2", curpage2);
		req.setAttribute("list2", list2);
		req.setAttribute("totalpage2", totalpage2);
		
		req.setAttribute("curpage3", curpage3);
		req.setAttribute("list3", list3);
		req.setAttribute("totalpage3", totalpage3);

		req.setAttribute("main_jsp", "../main2/search_main2.jsp");

		return "main/main.jsp";
	}

	/*
	 * @RequestMapping("jumposearch.do") public String
	 * jumposearch(HttpServletRequest req, HttpServletResponse res) throws Exception
	 * { req.setCharacterEncoding("EUC-KR"); String search_name =
	 * req.getParameter("search_name"); int count =
	 * SearchDao.namecheck(search_name); // DAO�Ű����� �־��ְ� if (count != 0) {
	 * req.setAttribute("search_count", 1); }
	 * 
	 * req.setAttribute("search_name", search_name); req.setAttribute("main_jsp",
	 * "../main2/search_main2.jsp");
	 * 
	 * return "main/main.jsp"; }
	 */

	@RequestMapping("mian2.do")
	public String movie_detail(HttpServletRequest req, HttpServletResponse res) {

		WeekBestVO vo = WeekBestDAO.namecheck("������");
		WeekBestVO vo1 = WeekBestDAO.namecheck("��걸");
		WeekBestVO vo2 = WeekBestDAO.namecheck("������");

		req.setAttribute("vo", vo);
		req.setAttribute("vo1", vo1);
		req.setAttribute("vo2", vo2);
		return "main2/ajaxtext.jsp";
	}
	
	//�ǽð� ��ȸ�� �ټ�
		@RequestMapping("rank.do")
		public String cbr_rank(HttpServletRequest req, HttpServletResponse res) {
			// ���˺��� ( ����� ��)
			String cbr_time = null;
			Date date = new Date();
			SimpleDateFormat sdformat = new SimpleDateFormat("yy-MM-dd HH");
			// Java �ð� ���ϱ�
			Calendar cal = Calendar.getInstance();

			cal.setTime(date);
			cal.add(Calendar.HOUR, -1);

			cbr_time = sdformat.format(cal.getTime());
			//System.out.println("1�ð� �� : " + cbr_time);
			
			List<ClubBarRankVO> list = ClubBarDAO.cbrList(cbr_time);
		
			req.setAttribute("list", list);
			return "timeranking/timerank.jsp";
		}
}
