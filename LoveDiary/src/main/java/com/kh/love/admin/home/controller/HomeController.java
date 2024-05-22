package com.kh.love.admin.home.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.vo.AdminVo;

@WebServlet("/admin/adminHome")
public class HomeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션에서 로그인 정보 가져오기
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
        
        // 로그인 상태 확인
        if (loginAdminVo != null) {
            req.getRequestDispatcher("/WEB-INF/views/admin/adminHome.jsp").forward(req, resp);
        } else {
            // 로그인 되어 있지 않으면 로그인 페이지로 리다이렉트
            resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
        }
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
