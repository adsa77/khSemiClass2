package com.kh.love.member.dao;

import static com.kh.love.db.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	public MemberVo login(Connection conn, MemberVo vo) throws Exception {
		String sql ="SELECT * FROM MEMBER WHERE ID = ? AND PWD = ? AND QUIT_YN = 'N'";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPwd());
		ResultSet rs = pstmt.executeQuery();
		

	      MemberVo loginMemberVo = null;
	      if(rs.next()) {
	         String no = rs.getString("NO");
	         String id = rs.getString("ID");
	         String pwd = rs.getString("PWD");
	         String nick = rs.getString("NICK");
	         String quitYn = rs.getString("QUIT_YN");
	         String enrollDate = rs.getString("ENROLL_DATE");
	         String modifyDate = rs.getString("MODIFY_DATE");
	         String profile = rs.getString("PROFILE");
	         
	         loginMemberVo = new MemberVo();
	         loginMemberVo.setNo(no);
	         loginMemberVo.setId(id);
	         loginMemberVo.setPwd(pwd);
	         loginMemberVo.setNick(nick);
	         loginMemberVo.setQuitYn(quitYn);
	         loginMemberVo.setEmrollDate(enrollDate);
	         loginMemberVo.setModifyDate(modifyDate);
	         loginMemberVo.setProfile(profile);
	      }
	      
	      close(rs);
	      close(pstmt);
	      
	      return loginMemberVo;
		
	}

	public int checkIdDup(Connection conn, String id) throws Exception {
		String spl = "SELECT COUNT(*) AS CNT FROM MEMBER WHERE ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(spl);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		int cnt = 1;
		if(rs.next()) {
			cnt = rs.getInt("CNT");
			
		}
		
		close(conn);
		close(pstmt);
		
		return cnt;
	}

}
