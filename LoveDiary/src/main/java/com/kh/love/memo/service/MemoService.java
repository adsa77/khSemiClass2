package com.kh.love.memo.service;

import static com.kh.love.db.SqlSessionTemplate.getSqlSession;
import static com.kh.love.db.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.calender.vo.CalenderAdminVo;
import com.kh.love.memo.dao.MemoDao;
import com.kh.love.memo.vo.MemoVo;
import com.kh.love.memo.vo.PageVo;

public class MemoService {
	private MemoDao dao;

	public MemoService() {
		dao = new MemoDao();
	}

	public int memoInsert(MemoVo mvo) throws Exception {
		SqlSession ss = getSqlSession();
		int result = dao.memoInsert(ss,mvo);
		
		 if (result == 1) {
		        ss.commit();
		    } else {
		        ss.rollback();
		    }
		    ss.close();
		    
		    return result;
	}

	public int getBoardCnt() throws Exception {
		Connection conn = getConnection();
		int cnt = dao.getBoardCnt(conn);
		
		close(conn);
		
		return cnt;

}

	public List<MemoVo> selectMemoList(PageVo pvo, String writerNo) throws Exception {
        SqlSession ss = getSqlSession();
        List<MemoVo> voList = dao.selectMemoList(ss, pvo, writerNo);
        ss.close();
        return voList;
    }

	
	
	
}
