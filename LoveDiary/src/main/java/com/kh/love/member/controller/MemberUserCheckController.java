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

@WebServlet("/member/edit")
public class MemberUserCheckController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
	         HttpSession session = req.getSession();
	         MemberVo loginMemberVo = (MemberVo)session.getAttribute("loginMemberVo");
	         
	         if(loginMemberVo == null) {
	            throw new Exception("로그인 하고 오세요");
	         }
	         req.getRequestDispatcher("/WEB-INF/views/member/edit.jsp").forward(req, resp);
	         req.setAttribute("loginMemberVo", loginMemberVo);
	      }catch(Exception e) {
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
	        String no = loginMemberVo.getNo();
	        String code = loginMemberVo.getCode();
	        String id = loginMemberVo.getId();
	        String pwd = req.getParameter("editpwd");
	        String pwd2 = req.getParameter("editpwd2");

	        if (!pwd.equals(pwd2)) {
	            throw new Exception("비밀번호가 일치하지 않습니다.");
	        }

	        MemberVo vo = new MemberVo();
	        vo.setNo(no);
	        vo.setCode(code);
	        vo.setId(id);
	        vo.setPwd(pwd);
	        vo.setPwd2(pwd2);

	        // 서비스 호출
	        MemberService ms = new MemberService();
	        MemberVo result = ms.edit(vo);

	        if (result == null) {
	            throw new Exception("비밀번호 검증 실패");
	        }

	        session.setAttribute("alertMsg", "검증이 완료 되었습니다.");
	        session.setAttribute("loginMemberVo", result); // 검증 완료된 회원 정보 다시 설정
	        resp.sendRedirect("/LoveDiary/member/pwdedit");
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	        e.printStackTrace();
	        req.setAttribute("errMsg", "회원정보 수정중 에러발생");
	        req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
	    }
	}
	
}
