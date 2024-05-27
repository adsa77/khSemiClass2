package com.kh.love.code.dao;

import static com.kh.love.db.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kh.love.member.vo.MemberVo;

public class CalendarCodeDao {

    public int codecreate(Connection conn, MemberVo vo) throws Exception {
        String sql = "UPDATE MEMBER SET CODE = ? WHERE NO = ? AND QUIT_YN = 'N'";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, vo.getCode());
        pstmt.setString(2, vo.getNo());

        int result = pstmt.executeUpdate();

        close(pstmt);

        return result;
    }

    public boolean isCodeExist(Connection conn, String code) throws Exception {
        String sql = "SELECT COUNT(*) FROM MEMBER WHERE CODE = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, code);
        ResultSet rs = pstmt.executeQuery();

        boolean exists = false;
        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }

        close(rs);
        close(pstmt);

        return exists;
    }

    public int countCodeUsage(Connection conn, String code) throws Exception {
        String sql = "SELECT COUNT(*) FROM MEMBER WHERE CODE = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, code);
        ResultSet rs = pstmt.executeQuery();

        int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
        }

        close(rs);
        close(pstmt);

        return count;
    }
}
