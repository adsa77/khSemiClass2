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

@WebServlet("/diary/del")
public class DiaryDelContriller extends HttpServlet{

	private DiaryService dsc;

    public DiaryDelContriller() {
        this.dsc = new DiaryService();
    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
            HttpSession session = req.getSession();
            MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");

            if (loginMemberVo == null) {
                resp.getWriter().write("로그인 상태가 아닙니다.");
                resp.sendRedirect("/LoveDiary/diary/list");
                return;
            }

            String diaryNo = req.getParameter("diaryNo");

            if (diaryNo == null || diaryNo.isEmpty()) {
                throw new IllegalArgumentException("유효하지 않은 번호입니다.");
            }

            DiaryVo dvo = new DiaryVo();
            dvo.setNo(diaryNo);

            int result = dsc.delete(dvo);

            if (result < 1) {
                throw new Exception("일기 삭제 실패...");
            }

            resp.sendRedirect("/LoveDiary/diary/list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
	}
	
}
