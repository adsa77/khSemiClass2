package com.kh.love.admin.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.faq.service.FaqService;
import com.kh.love.admin.vo.AdminVo;
import com.kh.love.notice.service.NoticeService;

@WebServlet("/faq/adminFaqDelete")
public class FaqDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

		if (loginAdminVo == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
			return;
		}
		req.getRequestDispatcher("/WEB-INF/views/faq/faqDelete.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strNo = req.getParameter("no");

		if (strNo == null || strNo.isEmpty()) {
			req.getSession().setAttribute("alertMsg", "잘못된 접근입니다.");
			resp.sendRedirect(req.getContextPath() + "/faq/adminFaq");
			return;
		}

		int no;
		try {
			no = Integer.parseInt(strNo);
		} catch (NumberFormatException e) {
			req.getSession().setAttribute("alertMsg", "잘못된 접근입니다.");
			resp.sendRedirect(req.getContextPath() + "/faq/adminFaq");
			return;
		}

		FaqService fs = new FaqService();

		try {
			int result = fs.deleteFaq(no);
			if (result == 1) {
				req.getSession().setAttribute("alertMsg", "FAQ 삭제 성공!");
			} else {
				req.getSession().setAttribute("alertMsg", "FAQ 삭제 실패!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("alertMsg", "FAQ 삭제 중 오류가 발생했습니다.");
		}

		resp.sendRedirect(req.getContextPath() + "/faq/adminFaq");
	}
}
