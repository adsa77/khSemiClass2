package com.kh.love.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.vo.AdminVo;

@WebServlet("/info/adminInfo")
public class InfoController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
		
		if(loginAdminVo != null) {
			req.getRequestDispatcher("/WEB-INF/views/info/adminInfo.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
