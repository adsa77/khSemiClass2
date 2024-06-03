package com.kh.love.admin.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.faq.service.FaqService;
import com.kh.love.admin.faq.vo.FaqVo;
import com.kh.love.admin.vo.AdminVo;
import com.kh.love.notice.service.NoticeService;
import com.kh.love.notice.vo.NoticeVo;

@WebServlet("/faq/adminFaqDetail")
public class FaqDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
		FaqService fs = new FaqService();

		if (loginAdminVo == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
			return;
		}

		String no = req.getParameter("no");

		try {
			FaqVo fvo = fs.getFaqByNo(no);

			if (fvo == null) {
				req.setAttribute("errMsg", "해당 공지사항을 찾을 수 없습니다.");
				req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
				return;
			}

			req.setAttribute("vo", fvo);
			req.getRequestDispatcher("/WEB-INF/views/faq/adminFaqDetail.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
