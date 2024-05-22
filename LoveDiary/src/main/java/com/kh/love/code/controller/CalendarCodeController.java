package com.kh.love.code.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.love.code.service.CalendarCodeService;
import com.kh.love.code.vo.CalendarCodeVo;

@WebServlet("/code/check")
public class CalendarCodeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/code/check.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String no = req.getParameter("no");
			String code = req.getParameter("code");
			
			CalendarCodeVo cvo = new CalendarCodeVo();
			cvo.setNo(no);
			cvo.setCode(code);
			
			CalendarCodeService ccs = new CalendarCodeService();
			int result = ccs.codecreate(cvo);
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
