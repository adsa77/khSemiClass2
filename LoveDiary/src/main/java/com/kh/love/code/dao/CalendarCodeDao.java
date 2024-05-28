package com.kh.love.code.dao;

import static com.kh.love.db.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.member.vo.MemberVo;

public class CalendarCodeDao {

    public int codecreate(SqlSession ss, MemberVo vo) throws Exception {
    	return ss.update("CodeMapper.codecreate", vo);
    }

    public boolean isCodeExist(SqlSession ss, String code) throws Exception {
    	int result = ss.selectOne("CodeMapper.isCodeExist", code);
    	if(result == 1) {
    		return true;
    	}
    	return false;
    }

    public int countCodeUsage(SqlSession ss, String code) throws Exception {
    	return ss.selectOne("CodeMapper.countCodeUsage", code);
    }
}
