package com.kh.love.admin.dao;

import java.io.Closeable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.kh.love.db.JDBCTemplate.*;

import com.kh.love.admin.vo.AdminVo;

public class AdminDao {

	public AdminVo login(Connection conn, AdminVo vo) throws Exception {
		String sql = "SELECT * FROM ADMIN WHERE ID = ? AND PWD = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPwd());
		System.out.println("dad id : " + vo.getId());
		System.out.println("dao pwd :" + vo.getPwd());
		ResultSet rs = pstmt.executeQuery();

		
		AdminVo loginAdminVo = null;
		if(rs.next()) {
			String no = rs.getString("NO");
			String id = rs.getString("ID");
			String pwd = rs.getString("PWD");
			String nick = rs.getString("NICK");

			
			loginAdminVo = new AdminVo();
			loginAdminVo.setNo(no);
			loginAdminVo.setId(id);
			loginAdminVo.setPwd(pwd);
			loginAdminVo.setNick(nick);
			System.out.println(loginAdminVo);
		}

		System.out.println("loginAdminVo : " + loginAdminVo);
		
		close(rs);
		close(pstmt);
		return loginAdminVo;
		
		
		
	}

}
