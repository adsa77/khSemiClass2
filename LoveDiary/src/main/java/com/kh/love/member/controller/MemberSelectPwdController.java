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

@WebServlet("/select/pwd")
public class MemberSelectPwdController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/selectpwd.jsp").forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
	        HttpSession session = req.getSession();
	        String id = req.getParameter("id");
	        String name = req.getParameter("name");
	        String birthDate = req.getParameter("birthDate");
	        String phone = req.getParameter("phone");
	        String email = req.getParameter("email");

	        MemberVo vo = new MemberVo();
	        vo.setId(id);
	        vo.setName(name);
	        vo.setBirthDate(birthDate);
	        vo.setPhone(phone);
	        vo.setEmail(email);

	        MemberSelectService mss = new MemberSelectService();
	        MemberVo resultVo = mss.selectpwd(vo);

	        if (resultVo != null && resultVo.getPwd() != null) {
	        	 req.setAttribute("foundPwd", resultVo.getPwd());
	        } else {
	        	req.setAttribute("foundPwd", "입력하신 정보가 일치하지 않습니다.");
	        }
	        req.getRequestDispatcher("/WEB-INF/views/member/selectpwd.jsp").forward(req, resp);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
