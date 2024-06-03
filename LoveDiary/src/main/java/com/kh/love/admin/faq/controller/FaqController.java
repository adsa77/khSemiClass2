package com.kh.love.admin.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.love.admin.faq.service.FaqService;
import com.kh.love.admin.faq.vo.FaqPageVo;
import com.kh.love.admin.faq.vo.FaqSearchVo;
import com.kh.love.admin.faq.vo.FaqVo;
import com.kh.love.admin.vo.AdminVo;

@WebServlet("/faq/adminFaq")
public class FaqController extends HttpServlet {
	
	private final FaqService fs;

	public FaqController() {
		this.fs = new FaqService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        AdminVo loginAdminVo = (AdminVo) session.getAttribute("loginAdminVo");

        if (loginAdminVo == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/adminLogin");
            return;
        }

        try {
            int listCount = fs.getFaqCnt();
            String x = req.getParameter("pno") == null ? "1" : req.getParameter("pno");
            int currentPage = Integer.parseInt(x);
            int pageLimit = 5;
            int boardLimit = 20;

            FaqPageVo pvo = new FaqPageVo(listCount, currentPage, pageLimit, boardLimit);

            String searchCol = req.getParameter("faqCol");
            String searchVal = req.getParameter("searchBox");

            List<FaqVo> voList;
            if (searchCol != null && searchVal != null && !searchCol.isEmpty() && !searchVal.isEmpty()) {
                FaqSearchVo fsVo = new FaqSearchVo(listCount, currentPage, pageLimit, boardLimit);
                fsVo.setSearchCol(searchCol);
                fsVo.setValue(searchVal);
                voList = fs.searchFaq(fsVo);
            } else {
                voList = fs.selectFaqList(pvo);
            }

            req.setAttribute("voList", voList);
            req.setAttribute("pvo", pvo);

            if (!resp.isCommitted()) {
            	req.getRequestDispatcher("/WEB-INF/views/faq/adminFaq.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", e.getMessage());

            if (!resp.isCommitted()) {
                req.getRequestDispatcher("/WEB-INF/views/adminCommon/error.jsp").forward(req, resp);
            }
        }
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
