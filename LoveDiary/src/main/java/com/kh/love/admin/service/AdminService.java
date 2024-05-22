package com.kh.love.admin.service;

import com.kh.love.admin.dao.AdminDao;
import com.kh.love.admin.vo.AdminVo;
import static com.kh.love.db.JDBCTemplate.*;

import java.sql.Connection;

public class AdminService {

	private AdminDao dao;

	public AdminService() {
		dao = new AdminDao();
	}

	//admin login
	public AdminVo login(AdminVo vo) throws Exception{
		// 비즈니스 로직 == 서비스 로직

		// SQL (DAO 호출)
		Connection conn = getConnection();
		AdminVo loginAdminVo = dao.login(conn, vo);

		close(conn);

		return loginAdminVo;

	}

}
