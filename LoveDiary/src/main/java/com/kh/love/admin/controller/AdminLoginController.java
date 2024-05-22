package com.kh.love.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.service.AdminService;
import com.kh.love.admin.vo.AdminVo;

@WebServlet("/admin/adminLogin")
public class AdminLoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/admin/adminLogin.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			//세션
			HttpSession session = req.getSession();
			
			//데이터 꺼내기
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			System.out.println("입력된 ID: " + id);  // 입력된 ID를 콘솔에 출력해서 확인
		    System.out.println("입력된 PWD: " + pwd);  // 입력된 PWD를 콘솔에 출력해서 확인
			
			AdminVo vo = new AdminVo();
			vo.setId(id);
			vo.setPwd(pwd);
			
			//복잡한 작업
			AdminService as = new AdminService();
			AdminVo loginAdminVo = as.login(vo);
			
			//결과 (화면 == 문자열 내보내기)
			if(loginAdminVo != null) {
				session.setAttribute("alertMsg", "로그인성공 !!!");
				session.setAttribute("loginAdminVo", loginAdminVo);
				resp.sendRedirect("/LoveDiary/admin/adminHome");
				System.out.println("로그인 성공@@@@@@@@@@@@@@@");
			}else {
				session.setAttribute("alertMsg", "로그인 실패 ...");
				resp.sendRedirect("/LoveDiary/admin/adminLogin");
				System.out.println("로그인 실패@@@@@@@@@@@@@");
			}
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("errMsg", "[ERROR-M0002] 로그인 중 에러 발생 ...");
			req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
		}
		
		
	}

}
