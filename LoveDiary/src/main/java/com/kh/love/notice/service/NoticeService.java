package com.kh.love.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import static com.kh.love.db.SqlSessionTemplate.*;
import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.notice.dao.NoticeDao;
import com.kh.love.notice.vo.NoticeSearchVo;
import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.vo.PageVo;

public class NoticeService {

	private NoticeDao dao;

	public NoticeService() {
		dao = new NoticeDao();
	}

	// 게시글 갯수 조회
	public int getNoticeCnt() throws Exception {
		// biz

		// SQL
		SqlSession ss = getSqlSession();
		int cnt = dao.getNoticeCnt(ss);

		ss.close();
		return cnt;
	}// method

	// 게시글 목록 조회
	public List<NoticeVo> selectNoticeList(PageVo pvo) throws Exception {
		// 비즈니스 로직

		// DAO 호출
		SqlSession ss = getSqlSession();
		List<NoticeVo> voList = dao.selectNoticeList(ss, pvo);
		ss.close();

		return voList;

	}// method

	// 게시글 확인
	public int writeNotice(NoticeVo vo) throws Exception {
		SqlSession ss = getSqlSession();
		int result = dao.writeNotice(ss, vo);

		if (result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();

		return result;
	}// method

	public NoticeVo getNoticeByNo(String no) throws Exception {
		SqlSession ss = getSqlSession();
		NoticeVo vo = dao.getNoticeByNo(ss, no);
		ss.close();
		return vo;
	}// method

	// 게시글 수정
	public int editNotice(NoticeVo vo) throws Exception {
		SqlSession ss = getSqlSession();
		int result = dao.editNotice(ss, vo);

		if (result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();

		return result;

	}// method

	// 게시글 삭제
	public int deleteNotice(Integer no) throws Exception {
		SqlSession ss = getSqlSession();
		int result = dao.deleteNotice(ss, no);

		if (result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();

		return result;
	}

	// 게시글 검색
	public List<NoticeVo> searchNotice(NoticeSearchVo nsVo) throws Exception {
		SqlSession ss = getSqlSession();
		List<NoticeVo> noticeList = dao.searchNotice(ss, nsVo);
        ss.commit();
        ss.close();
        return noticeList;
	}

}
