package com.kh.love.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.vo.AdminVo;
import com.kh.love.notice.service.NoticeService;
import com.kh.love.notice.vo.NoticeVo;

@WebServlet("/notice/noticeEdit")
public class NoticeEditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

        if (loginAdminVo == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
            return;
        }

        String no = req.getParameter("no");
        NoticeService ns = new NoticeService();
        NoticeVo vo = null;

        try {
            vo = ns.getNoticeByNo(no);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "공지사항 정보를 불러오는 중 오류가 발생했습니다.");
            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
            return;
        }

        if (vo != null) {
            req.setAttribute("noticeVo", vo);
            req.getRequestDispatcher("/WEB-INF/views/notice/noticeEdit.jsp").forward(req, resp);
        } else {
            req.setAttribute("errMsg", "존재하지 않는 공지사항입니다.");
            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
        }
	}// get
	
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

        NoticeVo vo = new NoticeVo();
        vo.setNo(no);
        vo.setTitle(title);
        vo.setContent(content);

        NoticeService ns = new NoticeService();

        try {
            int result = ns.editNotice(vo);
            if (result == 1) {
                req.getSession().setAttribute("alertMsg", "공지사항 수정 성공!");
                resp.sendRedirect("/LoveDiary/notice/noticeList");
            } else {
                throw new Exception("공지 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "공지사항 수정 중 오류가 발생했습니다. 다시 시도해 주세요.");
            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
        }

	}// post

}
