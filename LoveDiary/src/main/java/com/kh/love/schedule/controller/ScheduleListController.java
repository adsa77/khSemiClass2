package com.kh.love.schedule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.love.schedule.service.ScheduleService;
import com.kh.love.schedule.vo.ScheduleVo;
import com.kh.love.search.vo.SearchVo;

@WebServlet("/sche/list")
public class ScheduleListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String type = req.getParameter("type");
			String value = req.getParameter("value");
			
			SearchVo vo = new SearchVo();
			vo.setType(type);
			vo.setValue(value);
			
			ScheduleService scs = new ScheduleService();
			List<ScheduleVo> voList = scs.getScheduleList(vo);
			
			req.setAttribute("voList", voList);
			req.getRequestDispatcher("/WEB-INF/views/schedule/list.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
	}
}
