package com.kh.love.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.vo.AdminVo;
import com.kh.love.notice.service.NoticeService;
import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.vo.PageVo;

@WebServlet("/notice/noticeList")
public class NoticeController extends HttpServlet {
    
    private final NoticeService ns;
    
    public NoticeController() {
        this.ns = new NoticeService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

        if (loginAdminVo == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
            return;
        }

        try {
            int listCount = ns.getNoticeCnt();
            String x = req.getParameter("pno") == null ? "1" : req.getParameter("pno");
            int currentPage = Integer.parseInt(x);
            int pageLimit = 5;
            int boardLimit = 10;

            PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);

            // 서비스
            List<NoticeVo> voList = ns.selectNoticeList(pvo);

            // 결과
            req.setAttribute("voList", voList);
            req.setAttribute("pvo", pvo);
            
            System.out.println("controller"+voList);
            
            // 포워드 직전에 응답 커밋 체크
            if (!resp.isCommitted()) {
                req.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            
            // 에러 페이지로 포워드
            if (!resp.isCommitted()) {
                req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
