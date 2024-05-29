package com.kh.love.calender.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;

@WebServlet("/calender/calender")
public class Calender extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVo loginAdminVo = (MemberVo) session.getAttribute("loginMemberVo");

		if (loginAdminVo != null) {
			req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("/LoveDiary/member/login");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
