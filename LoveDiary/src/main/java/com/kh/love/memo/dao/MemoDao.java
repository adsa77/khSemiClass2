package com.kh.love.memo.dao;

import static com.kh.love.db.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.memo.vo.MemoVo;
import com.kh.love.memo.vo.PageVo;

public class MemoDao {

	public int memoInsert(SqlSession ss, MemoVo mvo)throws Exception {
		return ss.insert("MemoMapper.MemoInsert");

	}

	public int getBoardCnt(Connection conn) throws Exception {
		//SQL
		String sql = "SELECT COUNT(NO) FROM MEMO WHERE DEL_YN = 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		if(rs.next()) {
			cnt  = rs.getInt(1);
		}
		
		close(rs);
		close(pstmt);
		
		return cnt;
	}

	public List<MemoVo> selectMemoList(SqlSession ss, PageVo pvo, String writerNo) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("writerNo", writerNo);
	    params.put("pageVo", pvo);
	    List<MemoVo> memoList = ss.selectList("MemoMapper.MemoListByWriter", params);
	    
	    // 로그 추가
	    for (MemoVo memo : memoList) {
	        System.out.println("Memo: " + memo);
	    }

	    return memoList;
	}



}
