package com.kh.love.calender.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.calender.service.CalenderAdminService;
import com.kh.love.admin.calender.vo.CalenderAdminVo;
import com.kh.love.calender.service.CalenderService;
import com.kh.love.calender.vo.CalenderVo;
import com.kh.love.member.vo.MemberVo;
import com.kh.love.todo.vo.TodoVo;

@WebServlet("/calender/main")
public class CalenderController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			
			if (loginMemberVo != null) {
				String code = loginMemberVo.getCode();
				String no = req.getParameter("no");
				CalenderVo cdvo = new CalenderVo();
				cdvo.setCode(code);
				
				CalenderService cs = new CalenderService();
				List<CalenderVo> voList = cs.calenderCodeCheck(cdvo);
				System.out.println("222222222+" + voList);
				// 공휴일 조회
				CalenderAdminService cas = new CalenderAdminService();
				List<CalenderAdminVo> voHoliList = cas.CalenderHoliday();
				
				TodoVo todoVo = new TodoVo();
				todoVo.setNo(no);
				todoVo.setCode(code);
				
				System.out.println("캘런더"+todoVo);
				req.setAttribute("voList", voList);
				req.setAttribute("voHoliList", voHoliList);
				req.setAttribute("vo", todoVo);
				System.out.println(voHoliList);
				
				
				req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
			} else {
				resp.sendRedirect("/LoveDiary/member/login");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
