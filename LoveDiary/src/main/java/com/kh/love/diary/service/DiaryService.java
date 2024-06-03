package com.kh.love.diary.service;

import static com.kh.love.db.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.diary.dao.DiaryDao;
import com.kh.love.diary.vo.DiaryVo;
import com.kh.love.memo.vo.MemoVo;
import com.kh.love.memo.vo.PageVo;

public class DiaryService {

	private DiaryDao dao;

    public DiaryService() {
        dao = new DiaryDao();
    }
	public int diaryInsert(DiaryVo dvo) throws Exception {
		SqlSession ss = getSqlSession();
        int result = dao.diaryInsert(ss, dvo);

        if (result == 1) {
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();

        return result;
	}
	public int getListCnt() throws Exception {
		SqlSession ss = getSqlSession();
        int cnt = dao.getListCnt(ss);
        ss.close();

        return cnt;
	}
	public List<DiaryVo> selectDiaryList(PageVo pvo, String writerNo) throws Exception {
		SqlSession ss = getSqlSession();
        List<DiaryVo> voList = dao.selectDiaryList(ss, pvo, writerNo);
        ss.close();
        return voList;
	}
	public int delete(DiaryVo dvo) throws Exception {
		SqlSession ss = getSqlSession();
        int result = dao.delete(ss, dvo);

        if (result == 1) {
            ss.commit();
        } else {
            ss.rollback();
            throw new Exception("게시글 삭제 실패 발생");
        }
        ss.close();

        return result;
	}
	public DiaryVo getDiaryByNo(String diaryNo) throws Exception{
		  SqlSession ss = getSqlSession();
	        DiaryVo diary = dao.selectDiaryByNo(ss, diaryNo);
	        ss.close();
	        return diary;
	}
	public int updateDiary(DiaryVo dvo) throws Exception {
		SqlSession ss = getSqlSession();
        int result = dao.updateDiary(ss, dvo);

        if (result == 1) {
            ss.commit();
        } else {
            ss.rollback();
            throw new Exception("메모 수정 실패 발생");
        }
        ss.close();

        return result;
	}

}
