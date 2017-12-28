package com.sist.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MemberModel {
	@RequestMapping("join.do")
	public String join(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/join.jsp");
		return "main/main.jsp";
	}

	@RequestMapping("login_ok.do")
	public String loginOk(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../main2/main2.jsp");
		return "main/main.jsp";
	}

	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/mypage.jsp");
		req.setAttribute("member_jsp", "../member/myzzim.jsp");
		return "main/main.jsp";
	}

	@RequestMapping("myzzim.do")
	public String myzzim(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/mypage.jsp");
		req.setAttribute("member_jsp", "../member/myzzim.jsp");
		return "main/main.jsp";
	}

	@RequestMapping("myevent.do")
	public String myevent(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/mypage.jsp");
		req.setAttribute("member_jsp", "../member/myevent.jsp");
		return "main/main.jsp";
	}

	@RequestMapping("myinfo.do")
	public String myinfo(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("main_jsp", "../member/mypage.jsp");
		req.setAttribute("member_jsp", "../member/myinfo.jsp");
		return "main/main.jsp";
	}


}
