package com.kh.love.diary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.diary.service.DiaryService;
import com.kh.love.diary.vo.DiaryVo;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/diary/insert")
public class DiaryInsertController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/diary/insert.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			if (loginMemberVo == null) {
	           resp.getWriter().write("로그인 상태가 아닙니다.");
	           resp.sendRedirect("/LoveDiary/home");
	           return;
	            }
			String writerNo = loginMemberVo.getNo();
			String code = loginMemberVo.getCode();
			
			String title = req.getParameter("diaryTitle");
			String content = req.getParameter("diaryContent");
			String checkDate =req.getParameter("diaryCheckDate");
			
			DiaryVo dvo = new DiaryVo();
			
			dvo.setTitle(title);
			dvo.setContent(content);
			dvo.setWriterNo(writerNo);
			dvo.setCode(code);
			dvo.setCheckDate(checkDate);
			
			DiaryService dsc = new DiaryService();
			int result = dsc.diaryInsert(dvo);
			
			if(result < 1) {
	            throw new Exception("게시글 작성 실패 ...");
	         }
	         resp.sendRedirect("/LoveDiary/diary/list");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
