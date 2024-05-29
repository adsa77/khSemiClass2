package com.kh.love.todo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;
import com.kh.love.todo.service.TodoService;
import com.kh.love.todo.vo.TodoVo;

@WebServlet("/todo/insert")
public class TodoController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			String writerNo = loginMemberVo.getNo();
			String code = loginMemberVo.getCode();
			
			String title = req.getParameter("todoTitle");
			String content = req.getParameter("todoContent");
			String checkDate =req.getParameter("todoCheckDate");
			
			TodoVo tvo = new TodoVo();
			
			tvo.setTitle(title);
			tvo.setContent(content);
			tvo.setWriterNo(writerNo);
			tvo.setCode(code);
			tvo.setCheckDate(checkDate);
			
			TodoService tsc = new TodoService();
			int result = tsc.todoInsert(tvo);
			
			if(result < 1) {
	            throw new Exception("게시글 작성 실패 ...");
	         }
	         resp.sendRedirect("/LoveDiary/calender/calender");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
