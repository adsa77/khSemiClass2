package com.kh.love.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;
import com.kh.love.schedule.service.ScheduleService;
import com.kh.love.schedule.vo.ScheduleVo;

@WebServlet("/sche/delete")
public class ScheduleDeleteController extends HttpServlet {
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
			String code = loginMemberVo.getCode();
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String checkDate = req.getParameter("date");
			String no = req.getParameter("no");
			

			ScheduleVo svo = new ScheduleVo();
			svo.setTitle(title);
			svo.setContent(content);
			svo.setCheckDate(checkDate);
			svo.setWriterNo(writerNo);
			svo.setNo(no);
			svo.setCode(code);

			ScheduleService scs = new ScheduleService();
			int result = scs.insertSchedule(svo);
			
			System.out.println("result : " +result);
			
			PrintWriter out = resp.getWriter();
			out.write("result: " +result);
			
			if(result < 1) {
				throw new Exception("게시글 작성 실패");
			}
			req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp");
		}

	}
}
