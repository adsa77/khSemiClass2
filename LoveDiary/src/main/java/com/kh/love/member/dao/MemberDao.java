package com.kh.love.member.dao;

import static com.kh.love.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kh.love.member.vo.MemberVo;

public class MemberDao {

	public int join(Connection conn, MemberVo vo) throws Exception {
		
		String sql = "INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL) VALUES (SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPwd());
		pstmt.setString(3, vo.getNick());
		pstmt.setString(4, vo.getName());
		pstmt.setString(5, vo.getBirthDate());
		pstmt.setString(6, vo.getAddress());
		pstmt.setString(7, vo.getPhone());
		pstmt.setString(8, vo.getEmail());
		
		int result = pstmt.executeUpdate();
		
		close(pstmt);
		
		return result;
		
		
	}

}
