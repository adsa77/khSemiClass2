package com.kh.love.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.love.member.service.MemberService;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/join")
public class MemberJoin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
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
		String profile = req.getParameter("profile");
		
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
		vo.setProfile(profile);
		
		MemberService ms = new MemberService();
		int result = ms.join(vo);
		//호출하기
		
		//결과처리
		if(result == 1) {
			req.setAttribute("resultMsg", "회원가입성공");
			
		}else {
			req.setAttribute("resultMsg", "회원가입실패");
			
		}
		resp.sendRedirect("/love/member/login");
		}catch(Exception e) { //[ERROR-M0001]
		System.out.println("에러메세지 : " + e.getMessage());
		e.printStackTrace();
		req.setAttribute("errMsg", e.getMessage());
		req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
	}
	}
}

