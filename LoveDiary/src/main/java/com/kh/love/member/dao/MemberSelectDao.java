package com.kh.love.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.member.vo.MemberVo;

public class MemberSelectDao {

	public MemberVo selectid(SqlSession ss, MemberVo vo) {
		
		return ss.selectOne("MemberSelectMapper.SelectId", vo);
	}

	public MemberVo selectpwd(SqlSession ss, MemberVo vo) {
		
		return ss.selectOne("MemberSelectMapper.SelectPwd", vo);
	}

}
