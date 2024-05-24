package com.kh.love.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.notice.dao.NoticeDao;
import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.vo.PageVo;

public class NoticeService {
	
	private NoticeDao dao;

	public NoticeService() {
		dao = new NoticeDao();
	}

	public int getNoticeCnt() throws Exception {
		//biz
		
		//SQL
		SqlSession ss= SqlSessionTemplate.getSqlSession();
		int cnt = dao.getNoticeCnt(ss);
		
		ss.close();
		return cnt;
	}//method

	public List<NoticeVo> selectNoticeList(PageVo pvo) throws Exception {
		// 비즈니스 로직

		// DAO 호출
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		List<NoticeVo> voList = dao.selectNoticeList(ss , pvo);

		ss.close();
		
		return voList;

	}//method

}
