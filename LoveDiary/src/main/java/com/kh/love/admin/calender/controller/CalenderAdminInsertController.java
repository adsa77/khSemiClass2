package com.kh.love.admin.calender.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.calender.service.CalenderAdminService;
import com.kh.love.admin.calender.vo.CalenderAdminVo;
import com.kh.love.admin.vo.AdminVo;
import com.kh.love.calender.service.CalenderService;

@WebServlet("/calender/adminEditCalenderInsert")
public class CalenderAdminInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

		if (loginAdminVo == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
			return;
		}
		req.getRequestDispatcher("/WEB-INF/views/calender/adminEditCalenderInsert.jsp").forward(req, resp);
	
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
        
        try {
        	String title = req.getParameter("title");
        	String date = req.getParameter("date");
        	
        	CalenderAdminVo cavo = new CalenderAdminVo();
        	cavo.setTitle(title);
        	cavo.setHolidayDate(date);
        	cavo.setWriterNo(loginAdminVo.getNo());
        	
        	CalenderAdminService cas = new CalenderAdminService();
        	int result = cas.CalenderAdminInsert(cavo);
			if (result == 1) {
				req.getSession().setAttribute("alertMsg", "공휴일 추가 성공!");
				resp.sendRedirect("/LoveDiary/calender/adminEditCalenderList");
			} else {
	            throw new Exception("게시글 작성에 실패했습니다.");
			}

			
		} catch (Exception e) {
			e.printStackTrace();
	        req.setAttribute("errMsg", "게시글 작성 중 오류가 발생했습니다. 다시 시도해 주세요."); // 일반적인 메시지 설정
	        
	        // 에러 페이지로 포워드
	        if (!resp.isCommitted()) {
	            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
			}
		}
	
	
	}

}
