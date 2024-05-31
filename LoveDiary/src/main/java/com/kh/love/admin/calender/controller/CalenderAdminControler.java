package com.kh.love.admin.calender.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.calender.service.CalenderAdminService;
import com.kh.love.admin.calender.vo.CalenderAdminPageVo;
import com.kh.love.admin.calender.vo.CalenderAdminVo;
import com.kh.love.admin.vo.AdminVo;
import com.kh.love.notice.vo.NoticePageVo;

@WebServlet("/calender/adminEditCalenderList")
public class CalenderAdminControler extends HttpServlet{
	
	private final CalenderAdminService caService;
	
	
	
	public CalenderAdminControler() {
		this.caService = new CalenderAdminService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
		
		if(loginAdminVo == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");			
		}
		
		try {
            int listCount = caService.getCalenderAdminCnt();
            String x = req.getParameter("pno") == null ? "1" : req.getParameter("pno");
            int currentPage = Integer.parseInt(x);
            int pageLimit = 5;
            int boardLimit = 20;

            CalenderAdminPageVo caPvo = new CalenderAdminPageVo(listCount, currentPage, pageLimit, boardLimit);
            
            List<CalenderAdminVo> voList = caService.selectCalenderAdminPageList(caPvo);
            
            req.setAttribute("voList", voList);
            req.setAttribute("caPvo", caPvo);
            
            System.out.println("HvoList :" +voList);
            if (!resp.isCommitted()) {
            	req.getRequestDispatcher("/WEB-INF/views/calender/adminEditCalenderList.jsp").forward(req, resp);
            }
            

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
