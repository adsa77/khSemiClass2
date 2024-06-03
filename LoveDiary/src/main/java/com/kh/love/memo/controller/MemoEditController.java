package com.kh.love.memo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.kh.love.member.vo.MemberVo;
import com.kh.love.memo.service.MemoService;
import com.kh.love.memo.vo.MemoVo;

@WebServlet("/memo/edit")
public class MemoEditController extends HttpServlet {

    private MemoService ms;

    public MemoEditController() {
        this.ms = new MemoService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");

        if (loginMemberVo == null) {
            resp.getWriter().write("로그인 상태가 아닙니다.");
            resp.sendRedirect("/LoveDiary/home");
            return;
        }

        try {
            String memoNo = req.getParameter("memoNo");
            MemoVo memo = ms.getMemoByNo(memoNo);

            req.setAttribute("memo", memo);
            req.getRequestDispatcher("/WEB-INF/views/memo/memoedit.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");

            if (loginMemberVo == null) {
                resp.getWriter().write("로그인 상태가 아닙니다.");
                resp.sendRedirect("/LoveDiary/home");
                return;
            }

            String memoNo = req.getParameter("memoNo");
            String title = req.getParameter("memoTitle");
            String content = req.getParameter("memoContent");
            String checkDate = req.getParameter("memoCheckDate");

            MemoVo mvo = new MemoVo();
            mvo.setNo(memoNo);
            mvo.setTitle(title);
            mvo.setContent(content);
            mvo.setCheckDate(checkDate);

            int result = ms.updateMemo(mvo);

            if (result < 1) {
                throw new Exception("메모 수정 실패...");
            }

            resp.sendRedirect("/memo/list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
    }
}
