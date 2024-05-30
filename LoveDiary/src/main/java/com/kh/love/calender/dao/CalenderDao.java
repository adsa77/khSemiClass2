package com.kh.love.calender.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.calender.vo.CalenderVo;

public class CalenderDao {

	public List<CalenderVo> calenderCodeCheck(SqlSession ss, CalenderVo cdvo) {
		return ss.selectList("CalenderMapper.getCalenderList" , cdvo);
	}

}
