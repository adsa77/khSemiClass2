package com.kh.love.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.member.service.MemberService;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/member/login")
public class MemberLogin extends HttpServlet{
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         //세션
         HttpSession session = req.getSession();
         
         //데이터 꺼내기
         String id = req.getParameter("id");
         String pwd = req.getParameter("pwd");
         String code = req.getParameter("code");
         
         
         MemberVo vo = new MemberVo();
         vo.setId(id);
         vo.setPwd(pwd);
         vo.setCode(code);
         
         //복잡
         MemberService ms = new MemberService();
         MemberVo loginMemberVo = ms.login(vo);
         //결과 (화면==문자열 내보내기)
         if (loginMemberVo != null) {
                session.setAttribute("loginMemberVo", loginMemberVo);
                if (loginMemberVo.getCode() != null) {
                    resp.sendRedirect("/LoveDiary/calender/main");
                } else {
                    session.setAttribute("alertMsg", "로그인 성공");
                    resp.sendRedirect("/LoveDiary/code/check");
                }
            } else {
                session.setAttribute("alertMsg", "로그인 실패!");
                resp.sendRedirect("/LoveDiary/member/login");
            }
         
//         req.getRequestDispatcher("/WEB-INF/views/common/result.jsp").forward(req, resp);
         
      }catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("errMsg", "[ERROR-M0002] 로그인중 에러 발생");
         req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);

      }
      
      
      
   }

}