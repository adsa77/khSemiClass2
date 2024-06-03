package com.kh.love.schedule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.schedule.vo.ScheduleVo;
import com.kh.love.search.vo.SearchVo;

public class ScheduleDao {
	
	public int insertSchedule(SqlSession ss,ScheduleVo svo) {
		return ss.insert("ScheduleMapper.insertSchedule",svo);
	}
	
	public List<ScheduleVo> getScheduleList(SqlSession ss,SearchVo vo) {
		return ss.selectList("ScheduleMapper.getScheduleList",vo);
	}
	
	public int scheduleDelete(SqlSession ss, ScheduleVo svo) {
		return ss.update("ScheduleMapper.scheDelete",svo);
	}
	
	public int scheduleEdit(SqlSession ss, ScheduleVo svo) {
		return ss.update("ScheduleMapper.scheEdit",svo);
	}
	
}
