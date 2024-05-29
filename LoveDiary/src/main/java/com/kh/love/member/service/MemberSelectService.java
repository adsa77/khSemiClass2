package com.kh.love.member.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.member.dao.MemberSelectDao;
import com.kh.love.member.vo.MemberVo;

public class MemberSelectService {

private MemberSelectDao dao;
	
	public MemberSelectService(){
		
	dao = new MemberSelectDao();
		
	}
	
	public MemberVo selectid(MemberVo vo) throws Exception {
		SqlSession ss = SqlSessionTemplate.getSqlSession();
	    MemberVo resultVo = dao.selectid(ss, vo);
	    ss.close();
	    return resultVo;
	}

	public MemberVo selectpwd(MemberVo vo) throws Exception {
		SqlSession ss = SqlSessionTemplate.getSqlSession();
	    MemberVo resultVo = dao.selectpwd(ss, vo);
	    ss.close();
	    return resultVo;
	}
	

}
