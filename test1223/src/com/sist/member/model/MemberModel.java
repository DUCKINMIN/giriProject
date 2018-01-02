package com.sist.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.member.dao.MemberDao;
import com.sist.member.dao.MemberVo;

import java.io.File;
import java.util.*;
@Controller
public class MemberModel {
	//String path = "C:\\webDev\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\test1223\\member\\profile";
	
	// 회원가입페이지이동{
	@RequestMapping("joinpage.do")
	public String joinpage(HttpServletRequest req, HttpServletResponse res) {		
		req.setAttribute("main_jsp", "../member/join.jsp");
		return "main/main.jsp";
	}
	// 이메일중복체크
	@RequestMapping("emailCheck.do")
	public String emailCheck(HttpServletRequest req, HttpServletResponse res) {	
		String m_email = req.getParameter("email");
		MemberVo vo = MemberDao.emailCheck(m_email);
		req.setAttribute("vo", vo);
		return "member/check.jsp";
	}
	// 닉네임중복체크
	@RequestMapping("nickCheck.do")
	public String nickCheck(HttpServletRequest req, HttpServletResponse res) {	
		String m_nick = req.getParameter("nick");
		MemberVo vo = MemberDao.nickCheck(m_nick);
		req.setAttribute("vo", vo);
		return "member/check.jsp";
	}
	// 인증번호체크
	@RequestMapping("telCheck.do")
	public String telCheck(HttpServletRequest req, HttpServletResponse res) {	
		int checkno = (int)(Math.random() * 89999) + 10000;
		System.out.println(checkno);
		req.setAttribute("checkno", checkno);
		return "member/telcheck.jsp";
	}
		
	// 회원가입완료
	@RequestMapping("join.do")
	public String join(HttpServletRequest req, HttpServletResponse res){
		try {
			String path = req.getServletContext().getRealPath("/member/profile");
			req.setCharacterEncoding("EUC-KR");
			MemberVo vo = new MemberVo();
			int size = 1024*1024*100;
			String enctype = "EUC-KR";
			MultipartRequest mr = new MultipartRequest(req, path, size, enctype, new DefaultFileRenamePolicy());	
			String m_profile = mr.getOriginalFileName("profile");
			vo.setM_email(mr.getParameter("email"));
			
			if (m_profile != null) {
				File f = new File(path+"\\"+m_profile);
				File f2 = new File(path+"\\"+vo.getM_email()+".jpg");
				if (!f.renameTo(f2)) {
					System.err.println("이름 변경 에러 : " + f);
				}
				vo.setM_profile(f2.getName());
			}
			vo.setM_pwd(mr.getParameter("pwd"));
			vo.setM_name(mr.getParameter("name"));
			vo.setM_nick(mr.getParameter("nick"));
			vo.setM_sex(mr.getParameter("gender"));
			vo.setM_birth(mr.getParameter("birth"));
			vo.setM_tel(mr.getParameter("tel"));
			vo.setM_grade(Integer.parseInt(mr.getParameter("grade")));
			vo.setM_companyno(mr.getParameter("companyno"));
			MemberDao.memberJoin(vo);
			req.setAttribute("main_jsp", "../member/join_ok.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "main/main.jsp";
	}
	// 로그인
	@RequestMapping("loginok.do")
	public String loginOk(HttpServletRequest req, HttpServletResponse res) {
		String m_email = req.getParameter("email");
		String m_pwd = req.getParameter("pwd");
		MemberVo vo = MemberDao.emailCheck(m_email);
		if (vo.getCount()==0) {
			req.setAttribute("vo", vo);
			return "member/login_ok.jsp";
		} else {
			vo = MemberDao.isLogin(m_email, m_pwd);
			if (vo.getCount()==2) {
				req.setAttribute("vo", vo);
				return "member/login_ok.jsp";
			} else {
				req.setAttribute("vo", vo);
				HttpSession session = req.getSession();
				session.setAttribute("m_email", vo.getM_email());
				session.setAttribute("m_pwd", vo.getM_pwd());
				session.setAttribute("m_nick", vo.getM_nick());
				session.setAttribute("m_profile", vo.getM_profile());
				session.setAttribute("m_grade", vo.getM_grade());
				if (vo.getM_sex().equals("0")) {
					session.setAttribute("m_sex", "남");
				} else {
					session.setAttribute("m_sex", "여");
				}
				return "member/login_ok.jsp";
			}
		}
	}
	// 이메일 찾기
	@RequestMapping("emailFind.do")
	public String emailFind(HttpServletRequest req, HttpServletResponse res) {		
		String m_name = req.getParameter("name");
		String m_tel = req.getParameter("tel");
		int count = MemberDao.telCount(m_tel);
		if (count==0) {
			req.setAttribute("count", 0);
		} else {
			MemberVo vo = MemberDao.emailFind(m_tel);
			if(!m_name.equals(vo.getM_name())) {
				req.setAttribute("count", 1);
			} else if(m_name.equals(vo.getM_name())){
				req.setAttribute("count", 2);
				req.setAttribute("m_email", vo.getM_email());
			}
		}
		return "member/emailFindOk.jsp";
	}
	// 비밀번호 찾기
	@RequestMapping("pwdFind.do")
	public String pwdFind(HttpServletRequest req, HttpServletResponse res) {		
		String m_email = req.getParameter("email");
		String m_tel = req.getParameter("tel");
		int count = MemberDao.telCount(m_tel);
		if (count==0) {
			req.setAttribute("count", 0);
		} else {
			MemberVo vo = MemberDao.pwdFind(m_tel);
			if(!m_email.equals(vo.getM_email())) {
				req.setAttribute("count", 1);
			} else if(m_email.equals(vo.getM_email())){
				req.setAttribute("count", 2);
				req.setAttribute("m_pwd", vo.getM_pwd());
			}
		}
		return "member/pwdFindOk.jsp";
	}
	
	// 회원정보출력
	@RequestMapping("myinfo.do")
	public String myinfo(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String m_email = (String) session.getAttribute("m_email");
		MemberVo vo = MemberDao.memberInfo(m_email);
		if (vo.getM_sex().equals("0")) {
			vo.setM_sex("남");
		} else {
			vo.setM_sex("여");
		}
		String profile = vo.getM_profile();
		vo.setM_profile(profile);
		req.setAttribute("vo", vo);
		req.setAttribute("main_jsp", "../member/mypage.jsp");
		req.setAttribute("member_jsp", "../member/myinfo.jsp");
		return "main/main.jsp";
	}
	// 닉네임중복체크
		@RequestMapping("myNickCheck.do")
		public String mynickCheck(HttpServletRequest req, HttpServletResponse res) {	
			String mynick = req.getParameter("mynick");	//내아이디
			String m_nick = req.getParameter("nick");	//찾을아이디
			Map map = new HashMap();
			map.put("mynick", mynick);
			map.put("m_nick", m_nick);
			MemberVo vo = MemberDao.myNickCheck(map);
			req.setAttribute("vo", vo);
			return "member/check.jsp";
		}
	// 회원정보수정
	@RequestMapping("myinfo_update.do")
	public String myinfo_update(HttpServletRequest req, HttpServletResponse res){
		try {
			String path = req.getServletContext().getRealPath("/member/profile");
			HttpSession session = req.getSession();
			req.setCharacterEncoding("EUC-KR");		
			MemberVo vo = new MemberVo();
			int size = 1024*1024*100;
			String enctype = "EUC-KR";
			MultipartRequest mr = new MultipartRequest(req, path, size, enctype);	
			String m_profile = mr.getOriginalFileName("profile");
			String m_nick = mr.getParameter("nick");
			String m_email = mr.getParameter("email");
			
			vo.setM_nick(m_nick);
			vo.setM_email(m_email);
			vo.setM_companyno(mr.getParameter("companyno"));
			vo.setM_grade(Integer.parseInt(mr.getParameter("grade")));
			if (m_profile != null) {
				File f3 = new File(path+"\\"+m_email+".jpg");
				f3.delete();
				File f = new File(path+"\\"+m_profile);
				File f2 = new File(path+"\\"+m_email+".jpg");				
				if (!f.renameTo(f2)) {
					System.err.println("이름 변경 에러 : " + f);
				} else {
					vo.setM_profile(f2.getName());
					session.setAttribute("m_profile", vo.getM_profile());
				}
			}
			MemberDao.myinfo_update(vo);
			session.setAttribute("m_nick", vo.getM_nick());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "member/myinfo_update.jsp";
	}
	// 비밀번호 수정
	@RequestMapping("pwd_update.do")
	public String pwd_update(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String m_email = (String) session.getAttribute("m_email");
		String pwd = req.getParameter("changepwd");
		Map map = new HashMap();
		map.put("m_email", m_email);
		map.put("pwd", pwd);
		MemberDao.pwd_update(map);
		session.setAttribute("m_pwd", pwd);
		return "member/myinfo_update.jsp";
	}
	// 핸드폰번호 수정
	@RequestMapping("tel_update.do")
	public String tel_update(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String m_email = (String) session.getAttribute("m_email");
		String tel = req.getParameter("tel");
		Map map = new HashMap();
		map.put("m_email", m_email);
		map.put("tel", tel);
		MemberDao.tel_update(map);
		return "member/myinfo_update.jsp";
	}
	// 회원탈퇴
	@RequestMapping("member_delete.do")
	public String member_delete(HttpServletRequest req, HttpServletResponse res) throws Exception{
		String path = req.getServletContext().getRealPath("/member/profile");
		HttpSession session = req.getSession();
		String m_email = (String) session.getAttribute("m_email");
		File file = new File(path+"\\"+m_email+".jpg");
		file.delete();
		MemberDao.member_delete(m_email);
		return "index.jsp";
	}
	
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String m_email = (String) session.getAttribute("m_email");
		
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize * curpage;

		Map map = new HashMap<>();
		map.put("m_email", m_email);
		map.put("start", start);
		map.put("end", end);
		
		int totalpage = MemberDao.myBoardTotalPage(m_email);
		
		List<MemberVo> list = MemberDao.myBoardList(map);
		
		req.setAttribute("curpage", curpage);
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list);
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
		



}
