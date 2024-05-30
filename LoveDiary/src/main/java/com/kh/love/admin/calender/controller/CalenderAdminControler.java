package com.kh.love.admin.calender.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.vo.AdminVo;

@WebServlet("/calender/adminEditCalenderList")
public class CalenderAdminControler extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
		
		if(loginAdminVo != null) {
			req.getRequestDispatcher("/WEB-INF/views/calender/adminEditCalenderList.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");			
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
