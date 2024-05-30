package com.kh.love.calender.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.calender.dao.CalenderDao;
import com.kh.love.calender.vo.CalenderVo;
import com.kh.love.db.SqlSessionTemplate;

public class CalenderService {
private CalenderDao dao;
	
	public CalenderService(){
		
	dao = new CalenderDao();
		
	}

	public List<CalenderVo> calenderCodeCheck(CalenderVo cdvo) throws Exception {
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		List<CalenderVo> voList = dao.calenderCodeCheck(ss, cdvo);
		ss.close();
		return voList;
	}

	
	
	

	

}
