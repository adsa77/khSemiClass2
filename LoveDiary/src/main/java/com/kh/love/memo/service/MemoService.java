package com.kh.love.memo.service;

import static com.kh.love.db.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.memo.dao.MemoDao;
import com.kh.love.memo.vo.MemoVo;

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

}
