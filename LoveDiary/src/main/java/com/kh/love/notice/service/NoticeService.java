package com.kh.love.notice.service;

import java.sql.Connection;
import java.util.List;

import com.kh.love.admin.dao.AdminDao;
import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.dao.NoticeDao;
import com.kh.love.notice.vo.PageVo;

import static com.kh.love.db.JDBCTemplate.*;

public class NoticeService {
	
	private NoticeDao dao;

	public NoticeService() {
		dao = new NoticeDao();
	}

	public int getNoticeCnt() throws Exception {
		//biz
		
		//SQL
		Connection conn = getConnection();
		int cnt = dao.getNoticeCnt(conn);
		
		close(conn);
		return cnt;
	}//method

	public List<NoticeVo> selectNoticeList(PageVo pvo) throws Exception {
		// 비즈니스 로직

		// DAO 호출
		Connection conn = getConnection();
		List<NoticeVo> voList = dao.selectNoticeList(conn , pvo);

		close(conn);
		
		return voList;

	}//method

}
