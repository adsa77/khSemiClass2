package com.kh.love.admin.faq.controller;

import java.io.IOException;

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

@WebServlet("/faq/adminFaqEdit")
public class FaqEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

        if (loginAdminVo == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
            return;
        }

        String no = req.getParameter("no");
        FaqService fs = new FaqService();
        FaqVo vo = null;

        try {
            vo = fs.getFaqByNo(no);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "공지사항 정보를 불러오는 중 오류가 발생했습니다.");
            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
            return;
        }

        if (vo != null) {
            req.setAttribute("FaqVo", vo);
            req.getRequestDispatcher("/WEB-INF/views/faq/adminFaqEdit.jsp").forward(req, resp);
        } else {
            req.setAttribute("errMsg", "존재하지 않는 공지사항입니다.");
            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
        }
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

        if (loginAdminVo == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
            return;
        }

        String no = req.getParameter("no");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        FaqVo vo = new FaqVo();
        vo.setNo(no);
        vo.setTitle(title);
        vo.setContent(content);

        FaqService fs = new FaqService();

        try {
            int result = fs.editFaq(vo);
            if (result == 1) {
                req.getSession().setAttribute("alertMsg", "공지사항 수정 성공!");
                resp.sendRedirect("/LoveDiary/faq/adminFaqEdit");
            } else {
                throw new Exception("공지 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "공지사항 수정 중 오류가 발생했습니다. 다시 시도해 주세요.");
            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
        }
	}
}
