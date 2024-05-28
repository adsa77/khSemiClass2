package com.kh.love.member.service;



import static com.kh.love.db.JDBCTemplate.close;
import static com.kh.love.db.JDBCTemplate.commit;
import static com.kh.love.db.JDBCTemplate.getConnection;
import static com.kh.love.db.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.member.dao.MemberDao;
import com.kh.love.member.vo.MemberVo;

public class MemberService {
private MemberDao dao;
	
	public MemberService(){
		
	dao = new MemberDao();
		
	}
	public int join(MemberVo vo) throws Exception{
		if(vo.getId().length() < 4) {
			throw new Exception("아이디가 짧습니다. 최소 4글자이상.");
		}
		
		if(vo.getPwd().length() < 8) {
			throw new Exception("비밀번호 최소 8글자 이상 바랍니다.");
		}
		if(!vo.getPwd().equals(vo.getPwd2())) {
			throw new Exception("비밀번호가 일치하지 않습니다. 확인바랍니다.");
		}
		if(!isValidName(vo.getName())) {
            throw new Exception("이름은 한글만 가능합니다.");
        }
		if(!isValidBirthDate(vo.getBirthDate())) {
            throw new Exception("생년월일 형식이 올바르지 않습니다.");
        }
        if(!isValidPhone(vo.getPhone())) {
            throw new Exception("휴대폰 번호 형식이 올바르지 않습니다.");
        }
        if(!isValidEmail(vo.getEmail())) {
            throw new Exception("이메일 형식이 올바르지 않습니다.");
        }
        
		//dao호출
        SqlSession ss = SqlSessionTemplate.getSqlSession();
		int result = dao.join(ss,vo);
		
		if(result == 1) {
			ss.commit();
		}else {
			ss.rollback();
		}
		
		ss.close();
		
		return result;
	
	}
	public MemberVo login(MemberVo vo) throws Exception {
		// 비즈니스 로직 == 서비스 로직
		
		// SQL (DAO 호출)
        SqlSession ss = SqlSessionTemplate.getSqlSession();
		MemberVo loginMemberVo = dao.login(ss,vo);
	
		ss.close();
	
		return loginMemberVo;
	}
	public boolean checkIdDup(String id) throws Exception {
		//비지니스 로직
		
		//dao호출
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		int result = dao.checkIdDup(ss,id);
		ss.close();
		
		return result == 0;
	}
	
	private boolean isValidName(String name) {
	   // 한글만 포함하는지 검사하는 정규 표현식
	   return Pattern.matches("^[가-힣]*$", name);
	}
	private boolean isValidBirthDate(String birthDate) {
		//생년월일 유효성 검사하는 정규 표현식
        return Pattern.matches("^(19\\d{2}|20[0-1][0-9]|202[0-3])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$", birthDate);
    }

    private boolean isValidPhone(String phone) {
        return Pattern.matches("^\\d{3}-\\d{3,4}-\\d{4}$", phone);
    }

    private boolean isValidEmail(String email) {
        return Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", email);
    }

}
