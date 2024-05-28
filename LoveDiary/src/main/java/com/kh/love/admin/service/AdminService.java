package com.kh.love.admin.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.admin.dao.AdminDao;
import com.kh.love.admin.vo.AdminVo;
import com.kh.love.db.SqlSessionTemplate;


public class AdminService {

	private AdminDao dao;

	public AdminService() {
		dao = new AdminDao();
	}

	//admin login
	public AdminVo login(AdminVo vo) throws Exception{
        SqlSession ss = SqlSessionTemplate.getSqlSession();
        AdminVo loginAdminVo = null;
        try {
            loginAdminVo = dao.login(ss, vo);
        } finally {
            ss.close();
        }
        return loginAdminVo;
    }

}
