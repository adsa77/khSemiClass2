package com.kh.love.calender.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.calender.service.CalenderService;
import com.kh.love.calender.vo.CalenderVo;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/calender/main")
public class CalenderController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			
			if (loginMemberVo != null) {
				req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
			} else {
				resp.sendRedirect("/LoveDiary/member/login");
			}

			String code = loginMemberVo.getCode();
			
			CalenderVo cdvo = new CalenderVo();
			cdvo.setCode(code);
			
			CalenderService cs = new CalenderService();
			List<CalenderVo> voList = cs.calenderCodeCheck(cdvo);
			
			req.setAttribute("voList", voList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
