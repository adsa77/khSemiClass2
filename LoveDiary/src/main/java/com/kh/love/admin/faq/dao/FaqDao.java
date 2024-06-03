package com.kh.love.admin.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.faq.vo.FaqPageVo;
import com.kh.love.admin.faq.vo.FaqSearchVo;
import com.kh.love.admin.faq.vo.FaqVo;
import com.kh.love.notice.vo.NoticeSearchVo;
import com.kh.love.notice.vo.NoticeVo;

public class FaqDao {

	public int getFAQCnt(SqlSession ss) {
		return ss.selectOne("FaqMapper.getFaqCnt");
	}

	public List<FaqVo> searchFAQ(SqlSession ss, FaqSearchVo fsVo) {
		return ss.selectList("FaqMapper.searchFaq", fsVo);
	}

	public List<FaqVo> selectNoticeList(SqlSession ss, FaqPageVo pvo) {
		return  ss.selectList("FaqMapper.selectFaqList", pvo);
	}

	public FaqVo getNoticeByNo(SqlSession ss, String no) {
		return  ss.selectOne("FaqMapper.getNoticeByNo", no);
	}


}
