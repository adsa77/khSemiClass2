package com.kh.love.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.service.MemberSelectService;
import com.kh.love.member.vo.MemberVo;


@WebServlet("/select/id")
public class MemberSelectId extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/selectid.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 try {
		        HttpSession session = req.getSession();
		        String name = req.getParameter("name");
		        String birthDate = req.getParameter("birthDate");
		        String phone = req.getParameter("phone");
		        String email = req.getParameter("email");

		        MemberVo vo = new MemberVo();
		        vo.setName(name);
		        vo.setBirthDate(birthDate);
		        vo.setPhone(phone);
		        vo.setEmail(email);

		        MemberSelectService mss = new MemberSelectService();
		        MemberVo resultVo = mss.selectid(vo);

		        if (resultVo != null && resultVo.getId() != null) {
		        	 req.setAttribute("foundId", resultVo.getId());
		        } else {
		        	req.setAttribute("foundId", "아이디를 찾을 수 없습니다.");
		        }
		        req.getRequestDispatcher("/WEB-INF/views/member/selectid.jsp").forward(req, resp);

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		
	}
}
