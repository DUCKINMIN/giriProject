package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		return "main/main.jsp";
	}

	@RequestMapping("mainsearch.do")
	public String search_main(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String search_name = req.getParameter("search_name");
		String addr_name = "";
		if (search_name.equals("홍대")) {
			addr_name = "마포";
		} else if (search_name.equals("강남")) {
			addr_name = "강남";
		} else if (search_name.equals("이태원")) {
			addr_name = "용산";
		}
		Map map = new HashMap();
		map.put("search_name", search_name);
		map.put("addr_name", addr_name);

		List<SearchVo> list = SearchDao.namecheck(map);
		if(list.size()==0) {
			System.out.println("0");
		}
		// DAO매개변수 넣어주고
		System.out.println(search_name+" "+ addr_name);

		req.setAttribute("search_name", search_name);
		req.setAttribute("list", list);
		//req.setAttribute("main_jsp", "../main2/search_main2.jsp");

		return "main/main.jsp";
	}

	/*@RequestMapping("jumposearch.do")
	public String jumposearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String search_name = req.getParameter("search_name");
		int count = SearchDao.namecheck(search_name);
		// DAO매개변수 넣어주고
		if (count != 0) {
			req.setAttribute("search_count", 1);
		}

		req.setAttribute("search_name", search_name);
		req.setAttribute("main_jsp", "../main2/search_main2.jsp");

		return "main/main.jsp";
	}*/

	@RequestMapping("mian2.do")
	public String movie_detail(HttpServletRequest req, HttpServletResponse res) {

		WeekBestVO vo = WeekBestDAO.namecheck("강남구");
		WeekBestVO vo1 = WeekBestDAO.namecheck("용산구");
		WeekBestVO vo2 = WeekBestDAO.namecheck("마포구");

		req.setAttribute("vo", vo);
		req.setAttribute("vo1", vo1);
		req.setAttribute("vo2", vo2);
		return "main2/ajaxtext.jsp";
	}
}
