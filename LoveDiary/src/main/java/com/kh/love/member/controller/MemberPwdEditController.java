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

@WebServlet("/member/pwdedit")
public class MemberPwdEditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
	         HttpSession session = req.getSession();
	         MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
	         if(loginMemberVo == null) {
	        	resp.sendRedirect("/LoveDiary/home");
	            throw new Exception("로그인 하고 오세요");
	            
	         }
	         req.getRequestDispatcher("/WEB-INF/views/member/edit.jsp").forward(req, resp);
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	         req.setAttribute("errMsg", e.getMessage());
	         req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
	      }
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//데이터 꺼내기
			
			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			String no = loginMemberVo.getNo();
			String id = loginMemberVo.getId();
			String pwd = req.getParameter("editpwd");
			String pwd2 = req.getParameter("editpwd2");
			
			MemberVo vo = new MemberVo();
			vo.setNo(no);
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setPwd2(pwd2);
			//서비스호출
			
		
			//출력하기
			
			
			 MemberService ms = new MemberService();
		        int result = ms.pwdedit(vo);

		        // 출력하기
		        if (result != 1) {
		            throw new Exception("회원정보 수정 실패");
		        }

		        session.setAttribute("alertMsg", "회원정보 수정 성공");

		        session.removeAttribute("loginMemberVo");
		        resp.sendRedirect("/LoveDiary/home");
		    } catch (Exception e) {
		        System.out.println(e.getMessage());
		        e.printStackTrace();
		        req.setAttribute("errMsg", "회원정보 수정중 에러발생");
		        req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		    }
	}
	
}
