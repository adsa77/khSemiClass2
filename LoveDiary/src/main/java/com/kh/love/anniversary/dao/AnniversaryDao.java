package com.kh.love.anniversary.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.anniversary.vo.AnniversaryVo;
import com.kh.love.search.vo.SearchVo;

public class AnniversaryDao {

	public int annivarsaryInsert(SqlSession ss, AnniversaryVo avo) {

		return ss.insert("CoupleMapper.AnniversaryInsert", avo);

	}

	public List<AnniversaryVo> getAnniversaryList(SqlSession ss, SearchVo vo) {
		return ss.selectList("CoupleMapper.getAnniversaryList", vo);
	}

//	public AnniversaryVo getList() {
//		return ss.
//	}
}
