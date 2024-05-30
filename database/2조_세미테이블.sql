--------------------------------------------------
-------------------------회원---------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_MEMBER_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE MEMBER (
   NO              NUMBER           CONSTRAINT PK_MEMBER_NO   PRIMARY KEY 
    ,ID            VARCHAR2(20)     CONSTRAINT NN_MEMBER_ID   NOT NULL UNIQUE
    ,PWD           VARCHAR2(20)     CONSTRAINT NN_MEMBER_PW   NOT NULL
    ,NICK          VARCHAR2(20)     CONSTRAINT NN_MEMBER_NI   NOT NULL
    ,NAME          VARCHAR2(20)     CONSTRAINT NN_MEMBER_NA   NOT NULL
    ,BIRTH_DATE    CHAR(10)         CONSTRAINT NN_MEMBER_BD   NOT NULL
    ,ADDRESS       VARCHAR2(100)    CONSTRAINT NN_MEMBER_AD   NOT NULL
    ,PHONE         CHAR(13)         CONSTRAINT NN_MEMBER_PH   NOT NULL
    ,EMAIL         VARCHAR2(100)    CONSTRAINT NN_MEMBER_EM   NOT NULL
    ,EMROLL_DATE   TIMESTAMP        DEFAULT SYSDATE
    ,MODIFY_DATE   TIMESTAMP       
    ,QUIT_DATE     TIMESTAMP       
    ,QUIT_YN       CHAR(1)          DEFAULT 'N'
    ,CODE          VARCHAR2(4)       
);

--------------------------------------------------


--------------------------------------------------
-----------------------메모-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_MEMO_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_MEMO_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE MEMO CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE MEMO (
   NO           NUMBER          CONSTRAINT PK_MEMO_NO   PRIMARY KEY
   ,WRITER_NO   NUMBER          CONSTRAINT NN_MEMO_WN   NOT NULL
   ,TITLE       VARCHAR2(100)   CONSTRAINT NN_MEMO_TI   NOT NULL   
   ,CONTENT     VARCHAR2(100)   CONSTRAINT NN_MEMO_CO   NOT NULL   
   ,IMG         VARCHAR2(1000)  NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT SYSDATE
   ,MODIFY_DATE TIMESTAMP                        
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);


-----외래키 제약조건-----
ALTER TABLE MEMO 
ADD CONSTRAINT FK_MEMO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------TODO-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_TODO_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_TODO_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE TODO CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE TODO (
    NO              NUMBER          CONSTRAINT PK_TODO_NO  PRIMARY KEY
    ,WRITER_NO      NUMBER          CONSTRAINT NN_TODO_WN  NOT NULL
    ,TITLE          VARCHAR2(100)   CONSTRAINT NN_TODO_TI  NOT NULL
    ,CONTENT        VARCHAR2(4000)  CONSTRAINT NN_TODO_CO  NOT NULL
    ,ENROLL_DATE    TIMESTAMP       DEFAULT SYSDATE
    ,MODIFY_DATE    TIMESTAMP   
    ,COMPLETE_YN    CHAR(1)         DEFAULT 'N' 
    ,DEL_YN         CHAR(1)         DEFAULT 'N'
    ,CHECK_DATE     DATE
    ,CODE          VARCHAR2(4)      
);

-----외래키 제약조건-----
ALTER TABLE TODO 
ADD CONSTRAINT FK_TODO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
---------------------다이어리----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_DIARY_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_DIARY_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE DIARY CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE DIARY (
   NO           NUMBER          CONSTRAINT PK_DIARY_NO   PRIMARY KEY
   ,WRITER_NO   NUMBER          CONSTRAINT NN_DIARY_WN   NOT NULL
   ,TITLE       VARCHAR2(100)   CONSTRAINT NN_DIARY_TI   NOT NULL
   ,CONTENT     VARCHAR2(100)   CONSTRAINT NN_DIARY_CO   NOT NULL
   ,IMG         VARCHAR2(1000)  NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT SYSDATE
   ,MODIFY_DATE TIMESTAMP       
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE DIARY 
ADD CONSTRAINT FK_DIARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------가계부----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_ACCOUNT_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_ACCOUNT_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE ACCOUNT_BOOK CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE ACCOUNT_BOOK (
   NO           NUMBER          CONSTRAINT PK_ACCOUNT_NO   PRIMARY KEY
   ,WRITER_NO   NUMBER          CONSTRAINT NN_ACCOUNT_WN  NOT NULL
   ,TITLE       VARCHAR2(100)   CONSTRAINT NN_ACCOUNT_TI  NOT NULL
   ,CONTENT     VARCHAR2(100)   CONSTRAINT NN_ACCOUNT_CO  NOT NULL
   ,MOMEY       NUMBER          CONSTRAINT NN_ACCOUNT_MY  NOT NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT SYSDATE
   ,MODIFY_DATE TIMESTAMP       
   ,CHECK_DATE  DATE
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE ACCOUNT_BOOK 
ADD CONSTRAINT FK_ACCOUNT_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------관리자 아이디--------------------
--------------------------------------------------

-----시퀀스 생성-----
DROP SEQUENCE SEQ_ADMIN_NO;

-----시퀀스 삭제-----
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE ADMIN CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE ADMIN (
   NO     NUMBER          CONSTRAINT PK_ADMIN_NO  PRIMARY KEY
    , ID      VARCHAR2(20)   NOT NULL UNIQUE
   , PWD     VARCHAR2(20)   NOT NULL
   , NICK    VARCHAR2(20)   NOT NULL
);

--------------------------------------------------


--------------------------------------------------
--------------------공지 사항----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_NOTICE_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE NOTICE CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE NOTICE (
   NO              NUMBER          CONSTRAINT PK_NOTIC_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(100)   NOT NULL
    , CONTENT       VARCHAR2(4000)   NOT NULL
    , ENROLL_DATE   TIMESTAMP       DEFAULT SYSDATE
    , MODIFY_DATE   TIMESTAMP       
    , DEL_YN        CHAR(1)         DEFAULT 'N'
);

-----외래키 제약조건-----
ALTER TABLE NOTICE
ADD CONSTRAINT FK_NOTICE_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------FAQ------------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_FAQ_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE FAQ CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE FAQ (
   NO              NUMBER          CONSTRAINT PK_FAQ_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(1000)  NOT NULL
    , CONTENT       VARCHAR2(4000)  NOT NULL
    , ENROLL_DATE   TIMESTAMP       NOT NULL
    , MODIFY_DATE   TIMESTAMP
    , DEL_YN        CHAR(1) DEFAULT 'N'   
);

-----외래키 제약조건-----
ALTER TABLE FAQ
ADD CONSTRAINT FK_FAQ_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
--------------------공지 사항----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_QNA_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE QNA CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE QNA (
   NO                  NUMBER          CONSTRAINT PK_QNA_NO PRIMARY KEY
    , ADMIN_NO          NUMBER          NOT NULL
    , WRITER_NO         NUMBER          NOT NULL
    , TITLE             VARCHAR2(100)   NOT NULL
    , CONTENT           VARCHAR2(4000)  NOT NULL
    , ENROLL_DATE       TIMESTAMP       NOT NULL
    , MODIFY_DATE       TIMESTAMP
    , DEL_YN            CHAR(1)         DEFAULT 'N'   
    , ADMIN_TITLE       VARCHAR(100)    
    , ADMIN_CONTENT     VARCHAR2(4000)  
    , ADMIN_ENROLL_DATE TIMESTAMP     
);

-----외래키 제약조건-----
ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_WRITER_NO
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_ADMIN_NO
FOREIGN KEY (ADMIN_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------캘린더----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_CALENDER_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_CALENDER_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE CALENDER CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE CALENDER (
   NO           NUMBER          CONSTRAINT PK_CALENDER_NO PRIMARY KEY
   ,CODE        VARCHAR2(100)   NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT     SYSDATE
   ,DEL_YN      CHAR(1)         DEFAULT'N'
);

--------------------------------------------------


--------------------------------------------------
----------------------기념일-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_ANNIVERSARY_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_ANNIVERSARY_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE ANNIVERSARY CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE ANNIVERSARY (
   NO           NUMBER          NOT NULL    CONSTRAINT PK_ANNIVERSARY_NO PRIMARY KEY
   ,WRITER_NO   NUMBER          NOT NULL
   ,TITLE       VARCHAR2(100)   NOT NULL
   ,CONTENT     VARCHAR2(4000)  NOT NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT     SYSDATE
   ,MODIFY_DATE TIMESTAMP      
   ,DEL_YN      CHAR(1)         DEFAULT'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE ANNIVERSARY 
ADD CONSTRAINT FK_ANNIVERSARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
----------------------공휴일-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_HOLIDAY_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_HOLIDAY_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE HOLIDAY CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE HOLIDAY (
   NO               NUMBER          NOT NULL    CONSTRAINT PK_HOLIDAY_NO PRIMARY KEY
   ,TITLE           VARCHAR2(100)   NOT NULL
   ,HOLIDAY_DATE    DATE        
   ,DEL_YN          CHAR(1)         --------------------------------------------------
-------------------------회원---------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_MEMBER_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE MEMBER (
   NO              NUMBER           CONSTRAINT PK_MEMBER_NO   PRIMARY KEY 
    ,ID            VARCHAR2(20)     CONSTRAINT NN_MEMBER_ID   NOT NULL UNIQUE
    ,PWD           VARCHAR2(20)     CONSTRAINT NN_MEMBER_PW   NOT NULL
    ,NICK          VARCHAR2(20)     CONSTRAINT NN_MEMBER_NI   NOT NULL
    ,NAME          VARCHAR2(20)     CONSTRAINT NN_MEMBER_NA   NOT NULL
    ,BIRTH_DATE    CHAR(10)         CONSTRAINT NN_MEMBER_BD   NOT NULL
    ,ADDRESS       VARCHAR2(100)    CONSTRAINT NN_MEMBER_AD   NOT NULL
    ,PHONE         CHAR(13)         CONSTRAINT NN_MEMBER_PH   NOT NULL
    ,EMAIL         VARCHAR2(100)    CONSTRAINT NN_MEMBER_EM   NOT NULL
    ,EMROLL_DATE   TIMESTAMP        DEFAULT SYSDATE
    ,MODIFY_DATE   TIMESTAMP       
    ,QUIT_DATE     TIMESTAMP       
    ,QUIT_YN       CHAR(1)          DEFAULT 'N'
    ,CODE          VARCHAR2(4)       
);

--------------------------------------------------


--------------------------------------------------
-----------------------메모-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_MEMO_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_MEMO_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE MEMO CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE MEMO (
   NO           NUMBER          CONSTRAINT PK_MEMO_NO   PRIMARY KEY
   ,WRITER_NO   NUMBER          CONSTRAINT NN_MEMO_WN   NOT NULL
   ,TITLE       VARCHAR2(100)   CONSTRAINT NN_MEMO_TI   NOT NULL   
   ,CONTENT     VARCHAR2(100)   CONSTRAINT NN_MEMO_CO   NOT NULL   
   ,IMG         VARCHAR2(1000)  NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT SYSDATE
   ,MODIFY_DATE TIMESTAMP                        
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);


-----외래키 제약조건-----
ALTER TABLE MEMO 
ADD CONSTRAINT FK_MEMO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------TODO-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_TODO_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_TODO_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE TODO CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE TODO (
    NO              NUMBER          CONSTRAINT PK_TODO_NO  PRIMARY KEY
    ,WRITER_NO      NUMBER          CONSTRAINT NN_TODO_WN  NOT NULL
    ,TITLE          VARCHAR2(100)   CONSTRAINT NN_TODO_TI  NOT NULL
    ,CONTENT        VARCHAR2(4000)  CONSTRAINT NN_TODO_CO  NOT NULL
    ,ENROLL_DATE    TIMESTAMP       DEFAULT SYSDATE
    ,MODIFY_DATE    TIMESTAMP   
    ,COMPLETE_YN    CHAR(1)         DEFAULT 'N' 
    ,DEL_YN         CHAR(1)         DEFAULT 'N'
    ,CHECK_DATE     DATE
    ,CODE          VARCHAR2(4)      
);

-----외래키 제약조건-----
ALTER TABLE TODO 
ADD CONSTRAINT FK_TODO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
---------------------다이어리----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_DIARY_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_DIARY_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE DIARY CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE DIARY (
   NO           NUMBER          CONSTRAINT PK_DIARY_NO   PRIMARY KEY
   ,WRITER_NO   NUMBER          CONSTRAINT NN_DIARY_WN   NOT NULL
   ,TITLE       VARCHAR2(100)   CONSTRAINT NN_DIARY_TI   NOT NULL
   ,CONTENT     VARCHAR2(100)   CONSTRAINT NN_DIARY_CO   NOT NULL
   ,IMG         VARCHAR2(1000)  NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT SYSDATE
   ,MODIFY_DATE TIMESTAMP       
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE DIARY 
ADD CONSTRAINT FK_DIARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------가계부----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_ACCOUNT_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_ACCOUNT_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE ACCOUNT_BOOK CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE ACCOUNT_BOOK (
   NO           NUMBER          CONSTRAINT PK_ACCOUNT_NO   PRIMARY KEY
   ,WRITER_NO   NUMBER          CONSTRAINT NN_ACCOUNT_WN  NOT NULL
   ,TITLE       VARCHAR2(100)   CONSTRAINT NN_ACCOUNT_TI  NOT NULL
   ,CONTENT     VARCHAR2(100)   CONSTRAINT NN_ACCOUNT_CO  NOT NULL
   ,MOMEY       NUMBER          CONSTRAINT NN_ACCOUNT_MY  NOT NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT SYSDATE
   ,MODIFY_DATE TIMESTAMP       
   ,CHECK_DATE  DATE
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE ACCOUNT_BOOK 
ADD CONSTRAINT FK_ACCOUNT_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------관리자 아이디--------------------
--------------------------------------------------

-----시퀀스 생성-----
DROP SEQUENCE SEQ_ADMIN_NO;

-----시퀀스 삭제-----
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE ADMIN CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE ADMIN (
   NO     NUMBER          CONSTRAINT PK_ADMIN_NO  PRIMARY KEY
    , ID      VARCHAR2(20)   NOT NULL UNIQUE
   , PWD     VARCHAR2(20)   NOT NULL
   , NICK    VARCHAR2(20)   NOT NULL
);

--------------------------------------------------


--------------------------------------------------
--------------------공지 사항----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_NOTICE_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE NOTICE CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE NOTICE (
   NO              NUMBER          CONSTRAINT PK_NOTIC_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(100)   NOT NULL
    , CONTENT       VARCHAR2(4000)   NOT NULL
    , ENROLL_DATE   TIMESTAMP       DEFAULT SYSDATE
    , MODIFY_DATE   TIMESTAMP       
    , DEL_YN        CHAR(1)         DEFAULT 'N'
);

-----외래키 제약조건-----
ALTER TABLE NOTICE
ADD CONSTRAINT FK_NOTICE_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------FAQ------------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_FAQ_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE FAQ CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE FAQ (
   NO              NUMBER          CONSTRAINT PK_FAQ_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(1000)  NOT NULL
    , CONTENT       VARCHAR2(4000)  NOT NULL
    , ENROLL_DATE   TIMESTAMP       NOT NULL
    , MODIFY_DATE   TIMESTAMP
    , DEL_YN        CHAR(1) DEFAULT 'N'   
);

-----외래키 제약조건-----
ALTER TABLE FAQ
ADD CONSTRAINT FK_FAQ_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
--------------------공지 사항----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_QNA_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE QNA CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE QNA (
   NO                  NUMBER          CONSTRAINT PK_QNA_NO PRIMARY KEY
    , ADMIN_NO          NUMBER          NOT NULL
    , WRITER_NO         NUMBER          NOT NULL
    , TITLE             VARCHAR2(100)   NOT NULL
    , CONTENT           VARCHAR2(4000)  NOT NULL
    , ENROLL_DATE       TIMESTAMP       NOT NULL
    , MODIFY_DATE       TIMESTAMP
    , DEL_YN            CHAR(1)         DEFAULT 'N'   
    , ADMIN_TITLE       VARCHAR(100)    
    , ADMIN_CONTENT     VARCHAR2(4000)  
    , ADMIN_ENROLL_DATE TIMESTAMP     
);

-----외래키 제약조건-----
ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_WRITER_NO
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_ADMIN_NO
FOREIGN KEY (ADMIN_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------캘린더----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_CALENDER_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_CALENDER_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE CALENDER CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE CALENDER (
   NO           NUMBER          CONSTRAINT PK_CALENDER_NO PRIMARY KEY
   ,CODE        VARCHAR2(100)   NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT     SYSDATE
   ,DEL_YN      CHAR(1)         DEFAULT'N'
);

--------------------------------------------------


--------------------------------------------------
----------------------기념일-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_ANNIVERSARY_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_ANNIVERSARY_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE ANNIVERSARY CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE ANNIVERSARY (
   NO           NUMBER          NOT NULL    CONSTRAINT PK_ANNIVERSARY_NO PRIMARY KEY
   ,WRITER_NO   NUMBER          NOT NULL
   ,TITLE       VARCHAR2(100)   NOT NULL
   ,CONTENT     VARCHAR2(4000)  NOT NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT     SYSDATE
   ,MODIFY_DATE TIMESTAMP      
   ,DEL_YN      CHAR(1)         DEFAULT'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE ANNIVERSARY 
ADD CONSTRAINT FK_ANNIVERSARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
----------------------공휴일-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_HOLIDAY_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_HOLIDAY_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE HOLIDAY CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE HOLIDAY (
   NO               NUMBER          NOT NULL    CONSTRAINT PK_HOLIDAY_NO PRIMARY KEY
   ,TITLE           VARCHAR2(100)   NOT NULL
   ,HOLIDAY_DATE    DATE        
   ,DEL_YN          CHAR(1)         DEFAULT 'N'
);

--------------------------------------------------


--------------------------------------------------
----------------------스케쥴-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_SCHEDULE_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_SCHEDULE_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE SCHEDULE (
   NO           NUMBER          NOT NULL    CONSTRAINT PK_SCHEDULE_NO PRIMARY KEY
   ,WRITER_NO   NUMBER          NOT NULL
   ,TITLE       VARCHAR2(100)   NOT NULL
   ,CONTENT     VARCHAR2(4000)  NOT NULL
   ,SC_DATE     CHAR(12)        NOT NULL
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE SCHEDULE 
ADD CONSTRAINT FK_SCHEDULE_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------제목--------------------
--------------------------------------------------

-----시퀀스 삭제-----


-----시퀀스 생성-----


-----테이블 삭제-----


-----테이블 생성-----


-----외래키 제약조건-----


--------------------------------------------------





);

--------------------------------------------------


--------------------------------------------------
----------------------스케쥴-----------------------
--------------------------------------------------

-----시퀀스 삭제-----
DROP SEQUENCE SEQ_SCHEDULE_NO;

-----시퀀스 생성-----
CREATE SEQUENCE SEQ_SCHEDULE_NO NOCACHE NOCYCLE;

-----테이블 삭제-----
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;

-----테이블 생성-----
CREATE TABLE SCHEDULE (
   NO           NUMBER          NOT NULL    CONSTRAINT PK_SCHEDULE_NO PRIMARY KEY
   ,WRITER_NO   NUMBER          NOT NULL
   ,TITLE       VARCHAR2(100)   NOT NULL
   ,CONTENT     VARCHAR2(4000)  NOT NULL
   ,SC_DATE     CHAR(12)        NOT NULL
   ,DEL_YN      CHAR(1)         DEFAULT 'N'
   ,CHECK_DATE  DATE
   ,CODE        VARCHAR2(4)   
);

-----외래키 제약조건-----
ALTER TABLE SCHEDULE 
ADD CONSTRAINT FK_SCHEDULE_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------제목--------------------
--------------------------------------------------

-----시퀀스 삭제-----


-----시퀀스 생성-----


-----테이블 삭제-----


-----테이블 생성-----


-----외래키 제약조건-----


--------------------------------------------------



