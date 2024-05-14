package com.kh.love.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.love.member.service.MemberService;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 꺼내기
		String no = req.getParameter("no");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String nick = req.getParameter("nick");
		String name = req.getParameter("name");
		String birthDate = req.getParameter("birthDate");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		MemberVo vo = new MemberVo();
		vo.setNo(no);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setNick(nick);
		vo.setName(name);
		vo.setBirthDate(birthDate);
		vo.setAddress(address);
		vo.setPhone(phone);
		vo.setEmail(email);
		
		MemberService ms = new MemberService();
		int result = ms.join();
		//호출하기
		
		//결과처리
	}
	
}
