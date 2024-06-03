package com.kh.love.memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.memo.vo.MemoVo;
import com.kh.love.memo.vo.PageVo;

public class MemoDao {

    public int memoInsert(SqlSession ss, MemoVo mvo) throws Exception {
        return ss.insert("MemoMapper.MemoInsert", mvo);
    }

    public int getBoardCnt(SqlSession ss) throws Exception {
        return ss.selectOne("MemoMapper.getBoardCnt");
    }

    public List<MemoVo> selectMemoList(SqlSession ss, PageVo pvo, String writerNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("writerNo", writerNo);
        params.put("pageVo", pvo);
        List<MemoVo> memoList = ss.selectList("MemoMapper.MemoListByWriter", params);

        return memoList;
    }

    public MemoVo selectMemoByNo(SqlSession ss, String memoNo) {
        return ss.selectOne("MemoMapper.selectMemoByNo", memoNo);
    }

    public int updateMemo(SqlSession ss, MemoVo mvo) {
        return ss.update("MemoMapper.updateMemo", mvo);
    }

    public int delete(SqlSession ss, MemoVo mvo) {
        return ss.update("MemoMapper.MemoDelete", mvo);
    }
}
