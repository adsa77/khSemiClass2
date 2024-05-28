package com.kh.love.admin.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.vo.AdminVo;

public class AdminDao {

	public AdminVo login(SqlSession ss, AdminVo vo) throws Exception {
		return ss.selectOne("AdminMapper.loginAdmin", vo);
	}// AdminVo login

}
