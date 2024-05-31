package com.kh.love.todo.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.todo.vo.TodoVo;

public class TodoDao {

	public int todoInsert(SqlSession ss, TodoVo tvo) {
		
		return ss.insert("TodoMapper.todoInsert",tvo);
	}

	public int delete(SqlSession ss, TodoVo tvo) {
		
		return ss.update("TodoMapper.todoDelete",tvo);
	}

}
