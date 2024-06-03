package com.kh.love.memo.service;

import static com.kh.love.db.SqlSessionTemplate.getSqlSession;
import static com.kh.love.db.JDBCTemplate.*;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
        int result = dao.memoInsert(ss, mvo);

        if (result == 1) {
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();

        return result;
    }

    public int getBoardCnt() throws Exception {
        SqlSession ss = getSqlSession();
        int cnt = dao.getBoardCnt(ss);
        ss.close();

        return cnt;
    }

    public List<MemoVo> selectMemoList(PageVo pvo, String writerNo) throws Exception {
        SqlSession ss = getSqlSession();
        List<MemoVo> voList = dao.selectMemoList(ss, pvo, writerNo);
        ss.close();
        return voList;
    }

    public MemoVo getMemoByNo(String memoNo) throws Exception {
        SqlSession ss = getSqlSession();
        MemoVo memo = dao.selectMemoByNo(ss, memoNo);
        ss.close();
        return memo;
    }

    public int updateMemo(MemoVo mvo) throws Exception {
        SqlSession ss = getSqlSession();
        int result = dao.updateMemo(ss, mvo);

        if (result == 1) {
            ss.commit();
        } else {
            ss.rollback();
            throw new Exception("메모 수정 실패 발생");
        }
        ss.close();

        return result;
    }

    public int delete(MemoVo mvo) throws Exception {
        SqlSession ss = getSqlSession();
        int result = dao.delete(ss, mvo);

        if (result == 1) {
            ss.commit();
        } else {
            ss.rollback();
            throw new Exception("게시글 삭제 실패 발생");
        }
        ss.close();

        return result;
    }
}
