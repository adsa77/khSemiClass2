package com.kh.love.memo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;
import com.kh.love.memo.service.MemoService;
import com.kh.love.memo.vo.MemoVo;

@WebServlet("/memo/insert")
public class MemoController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/memo/insert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			if (loginMemberVo == null) {
	           resp.getWriter().write("로그인 상태가 아닙니다.");
	           resp.sendRedirect("/LoveDiary/calender/main");
	           return;
	            }
			String writerNo = loginMemberVo.getNo();
			String code = loginMemberVo.getCode();
			
			String title = req.getParameter("memoTitle");
			String content = req.getParameter("memoContent");
			String checkDate =req.getParameter("memoCheckDate");
			
			MemoVo mvo = new MemoVo();
			
			mvo.setTitle(title);
			mvo.setContent(content);
			mvo.setWriterNo(writerNo);
			mvo.setCode(code);
			mvo.setCheckDate(checkDate);
			
			MemoService msc = new MemoService();
			int result = msc.memoInsert(mvo);
			
			if(result < 1) {
	            throw new Exception("게시글 작성 실패 ...");
	         }
	         resp.sendRedirect("/LoveDiary/calender/main");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
