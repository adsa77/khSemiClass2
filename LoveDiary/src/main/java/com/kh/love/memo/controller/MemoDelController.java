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

@WebServlet("/memo/deleteMemo")
public class MemoDelController extends HttpServlet {

    private MemoService ms;

    public MemoDelController() {
        this.ms = new MemoService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");

            if (loginMemberVo == null) {
                resp.getWriter().write("로그인 상태가 아닙니다.");
                resp.sendRedirect("/LoveDiary/memo/list");
                return;
            }

            String memoNo = req.getParameter("memoNo");

            if (memoNo == null || memoNo.isEmpty()) {
                throw new IllegalArgumentException("유효하지 않은 메모 번호입니다.");
            }

            MemoVo mvo = new MemoVo();
            mvo.setNo(memoNo);

            int result = ms.delete(mvo);

            if (result < 1) {
                throw new Exception("메모 삭제 실패...");
            }

            resp.sendRedirect("/LoveDiary/memo/list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
    }
}
