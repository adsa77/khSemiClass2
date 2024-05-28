package com.kh.love.code.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.code.service.CalendarCodeService;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/code/check")
public class CalendarCodeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/code/check.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");

        try {
            HttpSession session = req.getSession();
            MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
            if (loginMemberVo == null) {
                resp.getWriter().write("로그인 상태가 아닙니다.");
                return;
            }

            String no = req.getParameter("no");
//            loginMemberVo.setNo(no);

            String code = req.getParameter("code");
            
            
            CalendarCodeService ccs = new CalendarCodeService();
            int result;
//            if (code == null || code.isEmpty()) {
            if (code == null) {
                result = ccs.codecreate(loginMemberVo);
            } else {
                result = ccs.updateCode(loginMemberVo, code);
            }

            if (result == 1) {
                resp.getWriter().write("코드 생성 성공: " + loginMemberVo.getCode());
            } else if(result == -1){
            	 session.setAttribute("alertMsg", "해당 코드 값은 이미 최대 사용 인원에 도달했습니다.");
                 resp.sendRedirect("/LoveDiary/code/check");
            }else {
                resp.getWriter().write("코드 생성 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("에러 발생: " + e.getMessage());
        }
    }
}