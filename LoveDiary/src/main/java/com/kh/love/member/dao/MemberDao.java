package com.kh.love.member.dao;

import static com.kh.love.db.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.member.vo.MemberVo;

public class MemberDao {

	public int join(SqlSession ss, MemberVo vo) throws Exception {

		return ss.insert("MemberMapper.memberjoin", vo);

	}

	public MemberVo login(SqlSession ss, MemberVo vo) throws Exception {

		return ss.selectOne("MemberMapper.memberlogin", vo);
	}

	public int checkIdDup(SqlSession ss, String id) throws Exception {
		return ss.selectOne("MemberMapper.membercheckIdDup", id);
	}

	public int edit(SqlSession ss, MemberVo vo)throws Exception {
		return ss.update("MemberMapper.memberEdit",vo);
	}
}