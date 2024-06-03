package com.kh.love.diary.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.diary.vo.DiaryVo;
import com.kh.love.memo.vo.MemoVo;
import com.kh.love.memo.vo.PageVo;

public class DiaryDao {

	public int diaryInsert(SqlSession ss, DiaryVo dvo) {
        return ss.insert("DiaryMapper.DiaryInsert", dvo);

	}

	public int getListCnt(SqlSession ss) {
		return ss.selectOne("DiaryMapper.getListCnt");
	}

	public List<DiaryVo> selectDiaryList(SqlSession ss, PageVo pvo, String writerNo) {
		Map<String, Object> params = new HashMap<>();
        params.put("writerNo", writerNo);
        params.put("pageVo", pvo);
        List<DiaryVo> voList = ss.selectList("DiaryMapper.DiaryListByWriter", params);

        return voList;
	}

	public int delete(SqlSession ss, DiaryVo dvo) {
		return ss.update("DiaryMapper.DiaryDelete", dvo);
	}

	public DiaryVo selectDiaryByNo(SqlSession ss, String diaryNo) {
		 return ss.selectOne("DiaryMapper.selectDiaryByNo", diaryNo);
	}

	public int updateDiary(SqlSession ss, DiaryVo dvo) {
		 return ss.update("DiaryMapper.updateDiary", dvo);
	}

}
