package com.kh.love.code.service;

import static com.kh.love.db.JDBCTemplate.close;
import static com.kh.love.db.JDBCTemplate.commit;
import static com.kh.love.db.JDBCTemplate.getConnection;
import static com.kh.love.db.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;

import com.kh.love.code.dao.CalendarCodeDao;
import com.kh.love.db.SqlSessionTemplate;
import com.kh.love.member.vo.MemberVo;

public class CalendarCodeService {

    private CalendarCodeDao dao;

    public CalendarCodeService() {
        dao = new CalendarCodeDao();
    }

    private String generateRandomNumber() {
        Random random = new Random();
        int randomNumber = 1000 + random.nextInt(9000); // 1000에서 9999 사이의 숫자 생성
        return String.valueOf(randomNumber); // 문자열로 변환하여 반환
    }

    public int codecreate(MemberVo vo) throws Exception {
    	SqlSession ss = SqlSessionTemplate.getSqlSession();

        String randomNumber;
        do {
            randomNumber = generateRandomNumber();
        } while (dao.isCodeExist(ss, randomNumber)); // 중복되지 않는 코드가 생성될 때까지 반복

        vo.setCode(randomNumber);
        int result = dao.codecreate(ss, vo);

        if (result == 1) {
            ss.commit();
        } else {
           ss.rollback();
            throw new Exception("코드 생성 실패 발생");
        }
        ss.close();

        return result;
    }

    public int updateCode(MemberVo vo, String code) throws Exception {
    	SqlSession ss = SqlSessionTemplate.getSqlSession();
        try {
            // code 값을 사용하는 사용자가 2명 이상인지 확인
            int codeUsageCount = dao.countCodeUsage(ss, code);
            if (codeUsageCount >= 2) {
            	
            	return -1;
            }
            vo.setCode(code);
            int result = dao.codecreate(ss, vo);

            if (result == 1) {
                ss.commit();
            } else {
                ss.rollback();
                throw new Exception("코드 업데이트 실패 발생: 결과가 1이 아닙니다.");
            }
            return result;
        } catch (Exception e) {
            ss.rollback();
            throw new Exception("코드 업데이트 중 예외 발생: " + e.getMessage(), e);
        } finally {
            ss.close();
        }
    }
}
