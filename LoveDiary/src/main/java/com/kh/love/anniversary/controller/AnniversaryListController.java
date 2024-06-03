package com.kh.love.anniversary.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.love.anniversary.service.AnniversaryService;
import com.kh.love.anniversary.vo.AnniversaryVo;
import com.kh.love.search.vo.SearchVo;

@WebServlet("/anni/list")
public class AnniversaryListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String type = req.getParameter("type");
			String value = req.getParameter("value");
			
			SearchVo svo = new SearchVo();
			svo.setType(type);
			svo.setValue(value);
			
			AnniversaryService cs = new AnniversaryService();
			List<AnniversaryVo> voList = cs.getAnniversaryList(svo);
			
			req.setAttribute("voList", voList);
			req.getRequestDispatcher("/WEB-INF/views/anniversary/list.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
