package com.kh.love.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.love.notice.vo.NoticeVo;
import com.kh.love.notice.vo.PageVo;
import com.kh.love.db.JDBCTemplate;
import static com.kh.love.db.JDBCTemplate.*;


public class NoticeDao {

	public int getNoticeCnt(Connection conn) throws Exception {
		// SQL
		String sql = "SELECT COUNT(NO) FROM NOTICE WHERE DEL_YN = 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		if (rs.next()) {
			cnt = rs.getInt(1);
		}

		close(rs);
		close(pstmt);

		return cnt;
	}

	public List<NoticeVo> selectNoticeList(Connection conn, PageVo pvo) throws Exception {
		// SQL
		String spl = "SELECT * FROM ( SELECT ROWNUM AS RNUM ,T.* FROM ( SELECT * FROM NOTICE N JOIN ADMIN A ON A.NO = N.WRITER_NO WHERE N.DEL_YN = 'N' ORDER BY N.NO DESC )T ) WHERE RNUM BETWEEN ? AND ?";

		PreparedStatement pstmt = conn.prepareStatement(spl);
		pstmt.setInt(1, pvo.getStartNum());
		pstmt.setInt(2, pvo.getEndNum());
		ResultSet rs = pstmt.executeQuery();
		
		System.out.println("startNum" + pvo.getStartNum());
		System.out.println("endtNum" + pvo.getEndNum());

		List<NoticeVo> voList = new ArrayList<NoticeVo>();
		while (rs.next()) {
			String no = rs.getString("NO");
			String writerNo = rs.getString("WRITER_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String enrollDate = rs.getString("ENROLL_DATE");
			String modifyDate = rs.getString("MODIFY_DATE");

			NoticeVo vo = new NoticeVo();
			vo.setNo(no);
			vo.setWriterNo(writerNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setEnrollDate(enrollDate);
			vo.setModifyDate(modifyDate);
			voList.add(vo);
		}

		for (NoticeVo noticeVo : voList) {
			System.out.println(noticeVo);
		}

		close(pstmt);
		close(rs);
		return voList;
	}// method

}
