package com.sist.cb_detail.model;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sist.clubbar.dao.CartVO;
import com.sist.clubbar.dao.ClubBarCommentDAO;
import com.sist.clubbar.dao.ClubBarCommentVO;
import com.sist.clubbar.dao.ClubBarDAO;
import com.sist.clubbar.dao.ClubBarRankVO;
import com.sist.clubbar.dao.ClubBarVO;
import com.sist.clubbar.dao.MotelDAO;
import com.sist.clubbar.dao.MotelVO;
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
		Map rc_cbc_map = new HashMap();
		rc_cbc_map.put("cb_no", cb_no);
		
		List<ClubBarCommentVO> rc_list = ClubBarCommentDAO.cbcReplyList(rc_cbc_map);

		//리뷰등록시 리뷰쪽으로 스크롤옮기기 위해
		String review = req.getParameter("review");
		if(review==null)
			review="0";
		
		//이메일 받기
		HttpSession session = req.getSession();
		String m_email = (String)session.getAttribute("m_email");
		
		//찜카운트
		CartVO cartVo = new CartVO();
		cartVo.setCb_no(cb_no);
		cartVo.setM_email(m_email);
		vo.setJjim(ClubBarDAO.cartCount(cartVo));
		
		req.setAttribute("review", review);
		req.setAttribute("rc_list", rc_list);
		req.setAttribute("mList", mList);
		req.setAttribute("vo", vo);
		req.setAttribute("cb_map", map);
		req.setAttribute("cbc_list", cbc_list);
		req.setAttribute("main_jsp", "../cb_detail/cb_detail.jsp");
		return "main/main.jsp";
	}
	
	@RequestMapping("cart_insert.do")
	public String cart_insert(HttpServletRequest req, HttpServletResponse res){
		HttpSession session = req.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String cb_no = req.getParameter("cb_no");

		CartVO vo = new CartVO();
		vo.setCb_no(Integer.parseInt(cb_no));
		vo.setM_email(m_email);
		ClubBarDAO.cartInsert(vo);
		
		return "cb_detail.do?cb_no=" + cb_no;
	}
	
	@RequestMapping("cart_delete.do")
	public String cart_delete(HttpServletRequest req, HttpServletResponse res){
		HttpSession session = req.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String cb_no = req.getParameter("cb_no");

		CartVO vo = new CartVO();
		vo.setCb_no(Integer.parseInt(cb_no));
		vo.setM_email(m_email);
		ClubBarDAO.cartDelete(vo);
		
		return "cb_detail.do?cb_no=" + cb_no;
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
		
		//대대댓글
		
		String cb_no = req.getParameter("cb_no");
		System.out.println("cb_no : " + cb_no);
		String cbc_pno = req.getParameter("cbc_pno");
		System.out.println("cbc_pno : " + cbc_pno);
		String cbc_pcno = req.getParameter("cbc_pcno");
		System.out.println("cbc_pcno : " + cbc_pcno);
		String cbc_content = req.getParameter("cbc_content");
		System.out.println("cbc_content : " + cbc_content);
		HttpSession session = req.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String m_nick = (String)session.getAttribute("m_nick");
		String cbc_pcnick = req.getParameter("cbc_pcnick");
		System.out.println("cbc_pcnick : " + cbc_pcnick);
		
		//대대댓글인 경우 => 부모를 설정
		if(cbc_pcno != null) {
			cbc_pno = cbc_pcno;
			cbc_pcnick += cbc_content;
			cbc_content = cbc_pcnick;
		}
			
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
	
	@RequestMapping("cbcDelete_ok.do")
	public String cbcDeleteOk(HttpServletRequest req, HttpServletResponse res) {
		
		String cb_no = req.getParameter("cb_no");
		System.out.println("cb_no : " + cb_no);
		String cbc_no = req.getParameter("cbc_no");
		System.out.println("cbc_no : " + cbc_no);
		
		ClubBarCommentDAO.cbcDelete(Integer.parseInt(cbc_no));
		
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
	
	@RequestMapping("hot3insert_ok.do")
	public String hot3insert_ok(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		req.setCharacterEncoding("EUC-KR");
		String path = req.getServletContext().getRealPath("/hot3/cb_img"); //파일 다운받을 폴더
		//String path="C:\\git\\giriProject\\test1223\\WebContent\\board\\boardImg";
		System.out.println(path);
		int size = 1024*1024*100;
		String enctype = "EUC-KR";
		//파일업로드 라이브러리
		MultipartRequest mr = new MultipartRequest(req, path, size, enctype);
		
		int cb_no = ClubBarDAO.cbNoMax()+1;
		String m_email = mr.getParameter("hot3email");
		String cb_name = mr.getParameter("hot3name");
		String cb_crn = mr.getParameter("hot3crn");
		String cb_tel = mr.getParameter("hot3phone");
		String a_addr1 = mr.getParameter("hot3addr1");
		String a_addr2 = mr.getParameter("hot3addr2");
		String cb_content = mr.getParameter("hot3content");
		String cb_open = mr.getParameter("hot3open");
		int cb_img_cnt = Integer.parseInt(mr.getParameter("img_count"));
		int cb_grade = Integer.parseInt(mr.getParameter("cb_grade"));
		
		for(int i = 0; i < cb_img_cnt; i++) {
			String filename = mr.getParameter("filename"+i);
			System.out.println("filename"+i+":"+filename);
			
			if(filename != null) {
				File f = new File(path+"\\"+filename);
				
				File f2 = new File(path+"\\cb_img_"+cb_no+
				((i+1)==1?"":("_"+(i+1)))+
				".jpg");
				if(!f.renameTo(f2)) {
					System.out.println("rename error : " + f);
				}
			}
		}
		
		ClubBarVO vo = new ClubBarVO();
		vo.setCb_no(cb_no);
		vo.setCb_name(cb_name);
		vo.setM_email(m_email);
		vo.setCb_crn(cb_crn);
		vo.setCb_tel(cb_tel);
		vo.setA_addr1(a_addr1);
		vo.setA_addr2(a_addr2);
		vo.setCb_content(cb_content);
		vo.setCb_open(cb_open);
		vo.setCb_grade(cb_grade);
		vo.setCb_img_cnt(cb_img_cnt);
		
		ClubBarDAO.hot3cbInsert(vo);
		
		req.setAttribute("cb_no", cb_no);
		
		return "hot3/hot3insert_ok.jsp";
	}
	
	@RequestMapping("hot3delete_ok.do")
	public String hot3delete(HttpServletRequest req, HttpServletResponse res) {
		int cb_no = Integer.parseInt(req.getParameter("cb_no"));
		int cb_img_cnt = ClubBarDAO.getCbImgCnt(cb_no);

		ClubBarDAO.hot3cbDelete(cb_no);
		
		for(int i = 0; i < cb_img_cnt; i++) {
			String filename = "cb_img_"+cb_no+(i==0?"":"_"+(i+1));
			String path = req.getServletContext().getRealPath("/hot3/cb_img/");
			path += filename;
			File f = new File(path);
			System.out.println("delete path : " + path);
			if(f.exists()) f.delete();
		}
		
		return "hot3/hot3delete_ok.jsp";
	}
	
	@RequestMapping("hot3update.do")
	public String hot3update(HttpServletRequest req, HttpServletResponse res) {
		String m_email = req.getParameter("email");
		List<ClubBarVO> mycb = ClubBarDAO.getMyCb(m_email);
		
		req.setAttribute("mycb", mycb);
		req.setAttribute("main_jsp", "../hot3/hot3update.jsp");
		
		return "main/main.jsp";
	}
	
	@RequestMapping("hot3update_ok.do")
	public String hot3update_ok(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		req.setCharacterEncoding("EUC-KR");
		String path = req.getServletContext().getRealPath("/hot3/cb_img"); //파일 다운받을 폴더
		//String path="C:\\git\\giriProject\\test1223\\WebContent\\board\\boardImg";
		System.out.println(path);
		int size = 1024*1024*100;
		String enctype = "EUC-KR";
		//파일업로드 라이브러리
		MultipartRequest mr = new MultipartRequest(req, path, size, enctype);
		
		int cb_no = Integer.parseInt(mr.getParameter("cb_no"));
		String cb_name = mr.getParameter("hot3name");
		String cb_tel = mr.getParameter("hot3phone");
		String a_addr1 = mr.getParameter("hot3addr1");
		String a_addr2 = mr.getParameter("hot3addr2");
		String cb_content = mr.getParameter("hot3content");
		String cb_open = mr.getParameter("hot3open");
		int cb_img_cnt = Integer.parseInt(mr.getParameter("img_count"));
		
		for (int i = 0; i < cb_img_cnt; i++) {
			for (int j = 0; i < 4; i++) {
				String filename = "cb_img_" + cb_no + (i == 0 ? "" : "_" + (i + 1));
				path += filename;
				File f = new File(path);
				System.out.println("delete path : " + path);
				if (f.exists())
					f.delete();
			}
		}
		
		for(int i = 0; i < cb_img_cnt; i++) {
			String filename = mr.getParameter("filename"+i);
			System.out.println("filename"+i+":"+filename);
			
			if(filename != null) {
				File f = new File(path+"\\"+filename);
				
				File f2 = new File(path+"\\cb_img_"+cb_no+
				((i+1)==1?"":("_"+(i+1)))+
				".jpg");
				if(!f.renameTo(f2)) {
					System.out.println("rename error : " + f);
				}
			}
		}
		
		ClubBarVO vo = new ClubBarVO();
		vo.setCb_no(cb_no);
		vo.setCb_name(cb_name);
		vo.setCb_tel(cb_tel);
		vo.setA_addr1(a_addr1);
		vo.setA_addr2(a_addr2);
		vo.setCb_content(cb_content);
		vo.setCb_open(cb_open);
		vo.setCb_img_cnt(cb_img_cnt);
		
		ClubBarDAO.hot3cbUpdate(vo);
		
		req.setAttribute("cb_no", cb_no);
		
		return "hot3/hot3update_ok.jsp";
	}
}
