package com.kh.love.diary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.diary.service.DiaryService;
import com.kh.love.diary.vo.DiaryVo;
import com.kh.love.member.vo.MemberVo;
import com.kh.love.memo.vo.MemoVo;

@WebServlet("/diary/edit")
public class DiaryEditController extends HttpServlet{
	private DiaryService dsc;

    public DiaryEditController() {
        this.dsc = new DiaryService();
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
            String diaryNo = req.getParameter("diaryNo");
            DiaryVo diary = dsc.getDiaryByNo(diaryNo);

            req.setAttribute("diary", diary);
            req.getRequestDispatcher("/WEB-INF/views/diary/edit.jsp").forward(req, resp);

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

            String diaryNo = req.getParameter("diaryNo");
            String title = req.getParameter("diaryTitle");
            String content = req.getParameter("diaryContent");
            String checkDate = req.getParameter("diaryCheckDate");

            DiaryVo dvo = new DiaryVo();
            dvo.setNo(diaryNo);
            dvo.setTitle(title);
            dvo.setContent(content);
            dvo.setCheckDate(checkDate);

            int result = dsc.updateDiary(dvo);

            if (result < 1) {
                throw new Exception("메모 수정 실패...");
            }

            resp.sendRedirect("/LoveDiary/diary/list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
	}
	
}
