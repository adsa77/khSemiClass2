package com.kh.love.todo.service;

import static com.kh.love.db.SqlSessionTemplate.getSqlSession;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.todo.dao.TodoDao;
import com.kh.love.todo.vo.TodoVo;

public class TodoService {
	private TodoDao dao;

	public TodoService() {
		dao = new TodoDao();
	}
	public int todoInsert(TodoVo tvo) throws Exception {
		SqlSession ss = getSqlSession();
		int result = dao.todoInsert(ss,tvo);
		
		 if (result == 1) {
		        ss.commit();
		    } else {
		        ss.rollback();
		    }
		    ss.close();
		    
		    return result;
		
	}
	public int delete(TodoVo tvo) throws Exception {
		//dao호출
		SqlSession ss = getSqlSession();
        int result =  dao.delete(ss,tvo);
        
        if(result == 1) {
           ss.commit();
        }else {
           ss.rollback();
           throw new Exception("게시글 삭제 실패 발생");
        }
        ss.close();
        
        return result;
	}

	

}
