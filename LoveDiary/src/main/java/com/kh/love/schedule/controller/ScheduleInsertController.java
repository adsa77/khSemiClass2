package com.kh.love.schedule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;
import com.kh.love.schedule.service.ScheduleService;
import com.kh.love.schedule.vo.ScheduleVo;

@WebServlet("/sche/insert")
public class ScheduleInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			String writerNo = loginMemberVo.getNo();
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String scDate = req.getParameter("scDate");
			
			if(loginMemberVo != null) {
				System.out.println("로그인 성공 -" +loginMemberVo );
			}else{
				System.out.println("로그인 실패 -"+ loginMemberVo);
			}

			ScheduleVo svo = new ScheduleVo();
			svo.setTitle(title);
			svo.setContent(content);
			svo.setScDate(scDate);
			svo.setWriterNo(writerNo);

			ScheduleService scs = new ScheduleService();
			int result = scs.insertSchedule(svo);

			req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp");
		}

	}
}
