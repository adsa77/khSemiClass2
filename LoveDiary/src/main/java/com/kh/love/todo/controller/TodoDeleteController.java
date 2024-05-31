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

@WebServlet("/todo/delete")
public class TodoDeleteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			String writerNo = loginMemberVo.getNo();
			String code = loginMemberVo.getCode();
			
			TodoVo tvo = new TodoVo();
			tvo.setNo(writerNo);
			tvo.setCode(code);
			
			TodoService tsc = new TodoService();
			int result = tsc.delete(tvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}
