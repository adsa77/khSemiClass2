package com.kh.love.admin.calender.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.calender.vo.CalenderAdminPageVo;
import com.kh.love.admin.calender.vo.CalenderAdminVo;

public class CalenderAdminDao {

	public int getCalenderAdminCnt(SqlSession ss) {
		return ss.selectOne("CalenderAdminMapper.getCalenderAdminCnt");
	}//method

	public List<CalenderAdminVo> selectCalenderAdminPageList(SqlSession ss, CalenderAdminPageVo caPvo) {
		return ss.selectList("CalenderAdminMapper.selectCalenderAdminList");

	}

	public List<CalenderAdminVo> CalenderHoliday(SqlSession ss) {
		return ss.selectList("CalenderAdminMapper.selectCalenderHoliday");
	}

	public int CalenderAdminInsert(SqlSession ss, CalenderAdminVo cavo) {
	    return ss.insert("CalenderAdminMapper.CalenderAdminInsert", cavo);
	}

	public int CalenderAdminDelete(SqlSession ss, int no) {
		return ss.update("CalenderAdminMapper.CalenderAdminDelete", no);
	}

}
