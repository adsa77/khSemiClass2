package com.kh.love.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.vo.PageVo;


public class NoticeDao {

	//게시글 갯수 조회
	public int getNoticeCnt(SqlSession ss) throws Exception {
		return ss.selectOne("getNoticeCnt");
	}

	//게시글 목록 조회
	public List<NoticeVo> selectNoticeList(SqlSession ss, PageVo pvo) throws Exception {
		return  ss.selectList("NoticeMapper.selectNoticeList", pvo);
	}// method

	//게시글 확인
	public int writeNotice(SqlSession ss, NoticeVo vo) {
		return ss.insert("NoticeMapper.writeNotice", vo);
	}// method

	
	public NoticeVo getNoticeByNo(SqlSession ss, String no) {
		return ss.selectOne("NoticeMapper.getNoticeByNo", no);
	}// method

	//게시글 수정
	public int editNotice(SqlSession ss, NoticeVo vo) {
		return ss.update("NoticeMapper.updateNotice", vo);
	}// method

	//게시글 삭제
	public int deleteNotice(SqlSession ss, Integer no) {
		return ss.update("NoticeMapper.deleteNotice", no);
	}



}
