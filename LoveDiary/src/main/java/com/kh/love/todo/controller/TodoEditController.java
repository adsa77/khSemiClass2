package com.kh.love.todo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;
import com.kh.love.memo.vo.MemoVo;
import com.kh.love.todo.service.TodoService;
import com.kh.love.todo.vo.TodoVo;

@WebServlet("/todo/edit")
public class TodoEditController extends HttpServlet{
	
	 private TodoService tsc;

	    public TodoEditController() {
	        this.tsc = new TodoService();
	    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession();
	        MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");

	        if (loginMemberVo == null) {
	            resp.getWriter().write("로그인 상태가 아닙니다.");
	            resp.sendRedirect("/LoveDiary/home");
	            return;
	        }
	        String no = req.getParameter("no"); // null 
	        System.out.println("Received no in doGet: " + no);
	      
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
            	String no = req.getParameter("no");
    			String code = loginMemberVo.getCode();
    			System.out.println("Received no in doPost: " + no);

    			String title = req.getParameter("title");
    			String content = req.getParameter("content");
    			String checkDate =req.getParameter("date");
    			
    			TodoVo tvo = new TodoVo();
    			
    			tvo.setNo(no);
    			tvo.setTitle(title);
    			tvo.setContent(content);
    			tvo.setCode(code);
    			tvo.setCheckDate(checkDate);
    			
    			System.out.println("controller > tvo : " + tvo);

            int result = tsc.updateTodo(tvo);

            if (result < 1) {
                throw new Exception("Todo 수정 실패...");
            }

            resp.sendRedirect("/LoveDiary/calender/main");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
	}
	
}
