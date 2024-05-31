package com.kh.love.memo.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.memo.vo.MemoVo;

public class MemoDao {

	public int memoInsert(SqlSession ss, MemoVo mvo)throws Exception {
		return ss.insert("MemoMapper.MemoInsert");

	}

}
