package com.kh.love.admin.faq.service;

import static com.kh.love.db.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.faq.dao.FaqDao;
import com.kh.love.admin.faq.vo.FaqPageVo;
import com.kh.love.admin.faq.vo.FaqSearchVo;
import com.kh.love.admin.faq.vo.FaqVo;
import com.kh.love.notice.vo.NoticeSearchVo;
import com.kh.love.notice.vo.NoticeVo;

public class FaqService {
	
	private FaqDao dao;
	
	public FaqService() {
		this.dao = new FaqDao();
	}

	public int getFAQCnt() throws Exception {
		// biz

		// SQL
		SqlSession ss = getSqlSession();
		int cnt = dao.getFAQCnt(ss);

		ss.close();
		return cnt;
	}

	public List<FaqVo> searchFAQ(FaqSearchVo fsVo) throws Exception {
		SqlSession ss = getSqlSession();
		List<FaqVo> faqList = dao.searchFAQ(ss, fsVo);
        ss.commit();
        ss.close();
        return faqList;
	}

	public List<FaqVo> selectFAQList(FaqPageVo pvo) throws Exception {
		// 비즈니스 로직

		// DAO 호출
		SqlSession ss = getSqlSession();
		List<FaqVo> voList = dao.selectNoticeList(ss, pvo);
		ss.close();

		return voList;
	}

	public FaqVo getFaqByNo(String no) throws Exception {
		// 비즈니스 로직

		// DAO 호출
		SqlSession ss = getSqlSession();
		FaqVo fvo = dao.getNoticeByNo(ss, no);
		ss.close();
		return fvo;
	}

	

}
