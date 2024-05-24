package com.kh.love.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.vo.PageVo;


public class NoticeDao {

	public int getNoticeCnt(SqlSession ss) throws Exception {
		return ss.selectOne("getNoticeCnt");
	}

	public List<NoticeVo> selectNoticeList(SqlSession ss, PageVo pvo) throws Exception {
		return  ss.selectList("NoticeMapper.selectNoticeList", pvo);
	}// method

}
