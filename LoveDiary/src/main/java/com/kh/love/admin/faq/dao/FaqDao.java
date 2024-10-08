package com.kh.love.admin.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.faq.vo.FaqPageVo;
import com.kh.love.admin.faq.vo.FaqSearchVo;
import com.kh.love.admin.faq.vo.FaqVo;
import com.kh.love.notice.vo.NoticeSearchVo;
import com.kh.love.notice.vo.NoticeVo;

public class FaqDao {

	public int getFaqCnt(SqlSession ss) {
		return ss.selectOne("FaqMapper.getFaqCnt");
	}

	public List<FaqVo> searchFaq(SqlSession ss, FaqSearchVo fsVo) {
		return ss.selectList("FaqMapper.searchFaq", fsVo);
	}

	public List<FaqVo> selectFaqList(SqlSession ss, FaqPageVo pvo) {
		return  ss.selectList("FaqMapper.selectFaqList", pvo);
	}

	public FaqVo getFaqByNo(SqlSession ss, String no) {
		return  ss.selectOne("FaqMapper.getFaqByNo", no);
	}

	public int writeFaq(SqlSession ss, FaqVo vo) {
		return ss.insert("FaqMapper.writeFaq", vo);
	}

	public int editFaq(SqlSession ss, FaqVo vo) {
		return ss.update("FaqMapper.editFaq", vo);
	}

	public int deleteFaq(SqlSession ss, int no) {
		return ss.update("FaqMapper.deleteFaq", no);
	}


}
