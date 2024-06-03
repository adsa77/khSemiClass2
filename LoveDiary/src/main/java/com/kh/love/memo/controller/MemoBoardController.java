package com.kh.love.memo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.vo.MemberVo;
import com.kh.love.memo.service.MemoService;
import com.kh.love.memo.vo.MemoVo;
import com.kh.love.memo.vo.PageVo;

@WebServlet("/memo/list")
public class MemoBoardController extends HttpServlet {

    private MemoService ms;

    public MemoBoardController() {
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
            String writerNo = loginMemberVo.getNo(); // 로그인한 사용자의 회원 번호 가져오기

            // 데이터 가져오기
            int listCount = ms.getBoardCnt();
            String x = req.getParameter("pno") == null ? "1" : req.getParameter("pno");
            int currentPage = Integer.parseInt(x);
            int pageLimit = 5;
            int boardLimit = 10;
            PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);

            // 목록 조회
            List<MemoVo> voList = ms.selectMemoList(pvo, writerNo);

           

            // 결과
            req.setAttribute("voList", voList);
            req.setAttribute("pvo", pvo);
            req.getRequestDispatcher("/WEB-INF/views/memo/memolist.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
        }
    }
}
