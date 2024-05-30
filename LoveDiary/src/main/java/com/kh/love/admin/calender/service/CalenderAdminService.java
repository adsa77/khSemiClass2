package com.kh.love.admin.calender.service;

import org.apache.ibatis.session.SqlSession;

import static com.kh.love.db.SqlSessionTemplate.*;

import java.util.List;

import com.kh.love.admin.calender.dao.CalenderAdminDao;
import com.kh.love.admin.calender.vo.CalenderAdminPageVo;
import com.kh.love.admin.calender.vo.CalenderAdminVo;

public class CalenderAdminService {
	
	private CalenderAdminDao dao;
	
	public CalenderAdminService() {
		this.dao = new CalenderAdminDao();
	}



	public int getCalenderAdminCnt() throws Exception {
		SqlSession ss = getSqlSession();
		int cnt = dao.getCalenderAdminCnt(ss);
		ss.close();
		return cnt;
	}//method



	public List<CalenderAdminVo> selectCalenderAdminPageList(CalenderAdminPageVo caPvo) throws Exception {
		SqlSession ss = getSqlSession();
		List<CalenderAdminVo> voList = dao.selectCalenderAdminPageList(ss, caPvo);
		return voList;
	}
	
	

}
