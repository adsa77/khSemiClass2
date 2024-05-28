package com.kh.love.schedule.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.schedule.dao.ScheduleDao;
import com.kh.love.schedule.vo.ScheduleVo;
import com.kh.love.search.vo.SearchVo;

public class ScheduleService {
	
	private ScheduleDao dao;
	
	public ScheduleService() {
		this.dao = new ScheduleDao();
	}
	
	public int insertSchedule(ScheduleVo svo) throws Exception{
		
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		int result = dao.insertSchedule(ss,svo);
		
		if(result == 1) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
		
		return result;
		
	}
	
	public List<ScheduleVo> getScheduleList(SearchVo vo)throws Exception{
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		List<ScheduleVo> voList = dao.getScheduleList(ss,vo);
		
		ss.close();
		
		return voList;
	}
	
}
