package com.kh.love.admin.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.faq.service.FaqService;
import com.kh.love.admin.faq.vo.FaqVo;
import com.kh.love.admin.vo.AdminVo;
import com.kh.love.notice.service.NoticeService;
import com.kh.love.notice.vo.NoticeVo;

@WebServlet("/faq/adminFaqInsert")
public class FaqInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

		if (loginAdminVo == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
			return;
		}
		req.getRequestDispatcher("/WEB-INF/views/faq/adminFaqInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");
		try {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			FaqVo vo = new FaqVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWriterNo(loginAdminVo.getNo());

			FaqService fs = new FaqService();
			int result = fs.writeFaq(vo);
			if (result == 1) {
				req.getSession().setAttribute("alertMsg", "FAQ 추가 성공!");
				resp.sendRedirect("/LoveDiary/faq/adminFaq");
			} else {
	            throw new Exception("게시글 작성에 실패했습니다.");
			}

		} catch (Exception e) {
	        System.out.println(e.getMessage());
	        e.printStackTrace();
	        req.setAttribute("errMsg", "게시글 작성 중 오류가 발생했습니다. 다시 시도해 주세요.");
	        
	        if (!resp.isCommitted()) {
	            req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
			}
		}
	}

}
