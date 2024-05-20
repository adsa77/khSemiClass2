package com.kh.love.member.service;



import static com.kh.love.db.JDBCTemplate.close;
import static com.kh.love.db.JDBCTemplate.commit;
import static com.kh.love.db.JDBCTemplate.getConnection;
import static com.kh.love.db.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.love.member.dao.MemberDao;
import com.kh.love.member.vo.MemberVo;

public class MemberService {
private MemberDao dao;
	
	public MemberService(){
		
	dao = new MemberDao();
		
	}
	public int join(MemberVo vo) throws Exception{
		System.out.println("여기는 서비스"+vo);
		if(vo.getId().length() < 4) {
			throw new Exception("아이디가 짧습니다. 최소 4글자이상.");
		}
		
		if(vo.getPwd().length() < 8) {
			throw new Exception("비밀번호 최소 8글자 이상 바랍니다.");
		}
		if(!vo.getPwd().equals(vo.getPwd2())) {
			throw new Exception("비밀번호가 일치하지 않습니다. 확인바랍니다.");
		}
		
		
		//dao호출
		Connection conn = getConnection();
		int result = dao.join(conn,vo);
		
		if(result == 1) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	
	}
	public MemberVo login(MemberVo vo) throws Exception {
		// 비즈니스 로직 == 서비스 로직
		
		// SQL (DAO 호출)
		Connection conn = getConnection();
		MemberVo loginMemberVo = dao.login(conn,vo);
	
		close(conn);
	
		return loginMemberVo;
	}
	public boolean checkIdDup(String id) throws Exception {
		//비지니스 로직
		
		//dao호출
		Connection conn = getConnection();
		int result = dao.checkIdDup(conn,id);
		
		close(conn);
		
		return result == 0;
	}
	
	


}
