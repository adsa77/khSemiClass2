package com.kh.love.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.love.member.service.MemberService;

@WebServlet("/member/id-dup")
public class MemberIdDupCheck extends HttpServlet{

	//아이디 중복 검사
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			
			try {
				//전달받을 아이디
				
				//돼껍
				String id = req.getParameter("id");
				//서비스
				MemberService ms = new MemberService();
				boolean isAvailable = ms.checkIdDup(id);
				//결과
				if(!isAvailable) {
					throw new Exception("중복검사 실패"); 
				} 

				resp.getWriter().write("good");
				
			}catch (Exception e) {
				e.printStackTrace();
				resp.getWriter().write("bad");
				
			}
		
		}
		
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
			
		}
		
}
