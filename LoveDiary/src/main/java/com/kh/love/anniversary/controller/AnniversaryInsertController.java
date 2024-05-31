package com.kh.love.anniversary.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.anniversary.service.AnniversaryService;
import com.kh.love.anniversary.vo.AnniversaryVo;
import com.kh.love.member.vo.MemberVo;

@WebServlet("/anni/insert")
public class AnniversaryInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			

			HttpSession session = req.getSession();
			MemberVo loginMemberVo = (MemberVo) session.getAttribute("loginMemberVo");
			
			if(loginMemberVo != null) {
				System.out.println("로그인 성공 -" +loginMemberVo);
			}else {
				System.out.println("로그인 실패 -"+ loginMemberVo);
			}
			
			String writerNo = loginMemberVo.getNo();
			String code = loginMemberVo.getCode();
			String title = req.getParameter("anniTitle");
			String content = req.getParameter("anniContent");
			String checkDate = req.getParameter("anniDate");
			
			AnniversaryVo avo = new AnniversaryVo();
			avo.setTitle(title);
			avo.setContent(content);

			avo.setCheckDate(checkDate);

			avo.setWriterNo(writerNo);
			avo.setCode(code);

			AnniversaryService cs = new AnniversaryService();
			int result = cs.anniversaryInsert(avo);
			
			System.out.println("result : " +result);
			
			PrintWriter out = resp.getWriter();
			out.write("result: " +result);
			
			if(result < 1) {
				throw new Exception("게시글 작성 실패");
			}
			req.getRequestDispatcher("/WEB-INF/views/calender/calender.jsp").forward(req, resp);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	}

}
