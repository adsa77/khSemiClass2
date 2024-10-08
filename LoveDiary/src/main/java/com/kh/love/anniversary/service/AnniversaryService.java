package com.kh.love.anniversary.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.anniversary.dao.AnniversaryDao;
import com.kh.love.anniversary.vo.AnniversaryVo;
import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.search.vo.SearchVo;

public class AnniversaryService {
private AnniversaryDao dao;
	
	public AnniversaryService() {
		this.dao = new AnniversaryDao();
	}
	
	public int anniversaryInsert(AnniversaryVo avo) throws Exception {
		//biz
		
		//dao
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		int result = dao.annivarsaryInsert(ss,avo);
		
		if(result == 1) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
		
		return result;
	}
	
	public List<AnniversaryVo> getAnniversaryList(SearchVo svo)throws Exception{
		
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		List<AnniversaryVo> voList = dao.getAnniversaryList(ss,svo);
		
		ss.close();
		
		return voList;
		
	}
	
	//기념일 등록 삭제
	public int anniversaryDelete(AnniversaryVo avo) throws Exception{
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		
		int result = dao.anniversaryDelete(ss, avo);
		
		if(result == 1) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
		
		return result;
	}

	public int anniversaryUpdate(AnniversaryVo avo) throws Exception {
		SqlSession ss = SqlSessionTemplate.getSqlSession();
		int result = dao.anniversaryEdit(ss, avo);
		
		if(result == 1){
			ss.commit();
		}else{
			ss.rollback();
		}
		ss.close();
		
		return result;
	}
	
	
}


