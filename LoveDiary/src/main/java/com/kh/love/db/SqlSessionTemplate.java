package com.kh.love.db;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {

	public static SqlSession getSqlSession() throws Exception {
		
		String resource = "/conf.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession ss= sqlSessionFactory.openSession(false);
		return ss;
	}
	
    public static void commit(SqlSession sqlSession) {
        sqlSession.commit();
        sqlSession.close();
    }

    public static void rollback(SqlSession sqlSession) {
        sqlSession.rollback();
        sqlSession.close();
    }

    public static void close(SqlSession sqlSession) {
        if (sqlSession != null) {
            sqlSession.close();
        }
    }

}
