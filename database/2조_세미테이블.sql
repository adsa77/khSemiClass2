--------------------------------------------------
-------------------------ȸ��---------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_MEMBER_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-----���̺� ����-----
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
-----------------------�޸�-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_MEMO_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_MEMO_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE MEMO CASCADE CONSTRAINTS;

-----���̺� ����-----
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


-----�ܷ�Ű ��������-----
ALTER TABLE MEMO 
ADD CONSTRAINT FK_MEMO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------TODO-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_TODO_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_TODO_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE TODO CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE TODO 
ADD CONSTRAINT FK_TODO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
---------------------���̾----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_DIARY_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_DIARY_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE DIARY CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE DIARY 
ADD CONSTRAINT FK_DIARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------�����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_ACCOUNT_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_ACCOUNT_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE ACCOUNT_BOOK CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE ACCOUNT_BOOK 
ADD CONSTRAINT FK_ACCOUNT_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------������ ���̵�--------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_ADMIN_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE ADMIN CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE ADMIN (
   NO     NUMBER          CONSTRAINT PK_ADMIN_NO  PRIMARY KEY
    , ID      VARCHAR2(20)   NOT NULL UNIQUE
   , PWD     VARCHAR2(20)   NOT NULL
   , NICK    VARCHAR2(20)   NOT NULL
);

--------------------------------------------------


--------------------------------------------------
--------------------���� ����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_NOTICE_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE NOTICE CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE NOTICE (
   NO              NUMBER          CONSTRAINT PK_NOTIC_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(100)   NOT NULL
    , CONTENT       VARCHAR2(4000)   NOT NULL
    , ENROLL_DATE   TIMESTAMP       DEFAULT SYSDATE
    , MODIFY_DATE   TIMESTAMP       
    , DEL_YN        CHAR(1)         DEFAULT 'N'
);

-----�ܷ�Ű ��������-----
ALTER TABLE NOTICE
ADD CONSTRAINT FK_NOTICE_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------FAQ------------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_FAQ_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE FAQ CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE FAQ (
   NO              NUMBER          CONSTRAINT PK_FAQ_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(1000)  NOT NULL
    , CONTENT       VARCHAR2(4000)  NOT NULL
    , ENROLL_DATE   TIMESTAMP       NOT NULL
    , MODIFY_DATE   TIMESTAMP
    , DEL_YN        CHAR(1) DEFAULT 'N'   
);

-----�ܷ�Ű ��������-----
ALTER TABLE FAQ
ADD CONSTRAINT FK_FAQ_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
--------------------���� ����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_QNA_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE QNA CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
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
-----------------------Ķ����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_CALENDER_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_CALENDER_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE CALENDER CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE CALENDER (
   NO           NUMBER          CONSTRAINT PK_CALENDER_NO PRIMARY KEY
   ,CODE        VARCHAR2(100)   NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT     SYSDATE
   ,DEL_YN      CHAR(1)         DEFAULT'N'
);

--------------------------------------------------


--------------------------------------------------
----------------------�����-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_ANNIVERSARY_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_ANNIVERSARY_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE ANNIVERSARY CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE ANNIVERSARY 
ADD CONSTRAINT FK_ANNIVERSARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
----------------------������-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_HOLIDAY_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_HOLIDAY_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE HOLIDAY CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE HOLIDAY (
   NO               NUMBER          NOT NULL    CONSTRAINT PK_HOLIDAY_NO PRIMARY KEY
   ,TITLE           VARCHAR2(100)   NOT NULL
   ,HOLIDAY_DATE    DATE        
   ,DEL_YN          CHAR(1)         --------------------------------------------------
-------------------------ȸ��---------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_MEMBER_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE MEMBER CASCADE CONSTRAINTS;

-----���̺� ����-----
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
-----------------------�޸�-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_MEMO_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_MEMO_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE MEMO CASCADE CONSTRAINTS;

-----���̺� ����-----
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


-----�ܷ�Ű ��������-----
ALTER TABLE MEMO 
ADD CONSTRAINT FK_MEMO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------TODO-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_TODO_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_TODO_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE TODO CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE TODO 
ADD CONSTRAINT FK_TODO_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
---------------------���̾----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_DIARY_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_DIARY_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE DIARY CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE DIARY 
ADD CONSTRAINT FK_DIARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------�����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_ACCOUNT_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_ACCOUNT_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE ACCOUNT_BOOK CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE ACCOUNT_BOOK 
ADD CONSTRAINT FK_ACCOUNT_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER(NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------������ ���̵�--------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_ADMIN_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE ADMIN CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE ADMIN (
   NO     NUMBER          CONSTRAINT PK_ADMIN_NO  PRIMARY KEY
    , ID      VARCHAR2(20)   NOT NULL UNIQUE
   , PWD     VARCHAR2(20)   NOT NULL
   , NICK    VARCHAR2(20)   NOT NULL
);

--------------------------------------------------


--------------------------------------------------
--------------------���� ����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_NOTICE_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE NOTICE CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE NOTICE (
   NO              NUMBER          CONSTRAINT PK_NOTIC_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(100)   NOT NULL
    , CONTENT       VARCHAR2(4000)   NOT NULL
    , ENROLL_DATE   TIMESTAMP       DEFAULT SYSDATE
    , MODIFY_DATE   TIMESTAMP       
    , DEL_YN        CHAR(1)         DEFAULT 'N'
);

-----�ܷ�Ű ��������-----
ALTER TABLE NOTICE
ADD CONSTRAINT FK_NOTICE_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
-----------------------FAQ------------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_FAQ_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_FAQ_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE FAQ CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE FAQ (
   NO              NUMBER          CONSTRAINT PK_FAQ_NO PRIMARY KEY
    , WRITER_NO     NUMBER          NOT NULL
    , TITLE         VARCHAR2(1000)  NOT NULL
    , CONTENT       VARCHAR2(4000)  NOT NULL
    , ENROLL_DATE   TIMESTAMP       NOT NULL
    , MODIFY_DATE   TIMESTAMP
    , DEL_YN        CHAR(1) DEFAULT 'N'   
);

-----�ܷ�Ű ��������-----
ALTER TABLE FAQ
ADD CONSTRAINT FK_FAQ_NO
FOREIGN KEY (WRITER_NO) REFERENCES ADMIN(NO)
;

--------------------------------------------------


--------------------------------------------------
--------------------���� ����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_QNA_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_QNA_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE QNA CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
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
-----------------------Ķ����----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_CALENDER_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_CALENDER_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE CALENDER CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE CALENDER (
   NO           NUMBER          CONSTRAINT PK_CALENDER_NO PRIMARY KEY
   ,CODE        VARCHAR2(100)   NULL
   ,ENROLL_DATE TIMESTAMP       DEFAULT     SYSDATE
   ,DEL_YN      CHAR(1)         DEFAULT'N'
);

--------------------------------------------------


--------------------------------------------------
----------------------�����-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_ANNIVERSARY_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_ANNIVERSARY_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE ANNIVERSARY CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE ANNIVERSARY 
ADD CONSTRAINT FK_ANNIVERSARY_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
----------------------������-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_HOLIDAY_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_HOLIDAY_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE HOLIDAY CASCADE CONSTRAINTS;

-----���̺� ����-----
CREATE TABLE HOLIDAY (
   NO               NUMBER          NOT NULL    CONSTRAINT PK_HOLIDAY_NO PRIMARY KEY
   ,TITLE           VARCHAR2(100)   NOT NULL
   ,HOLIDAY_DATE    DATE        
   ,DEL_YN          CHAR(1)         DEFAULT 'N'
);

--------------------------------------------------


--------------------------------------------------
----------------------������-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_SCHEDULE_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_SCHEDULE_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE SCHEDULE 
ADD CONSTRAINT FK_SCHEDULE_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------����--------------------
--------------------------------------------------

-----������ ����-----


-----������ ����-----


-----���̺� ����-----


-----���̺� ����-----


-----�ܷ�Ű ��������-----


--------------------------------------------------





);

--------------------------------------------------


--------------------------------------------------
----------------------������-----------------------
--------------------------------------------------

-----������ ����-----
DROP SEQUENCE SEQ_SCHEDULE_NO;

-----������ ����-----
CREATE SEQUENCE SEQ_SCHEDULE_NO NOCACHE NOCYCLE;

-----���̺� ����-----
DROP TABLE SCHEDULE CASCADE CONSTRAINTS;

-----���̺� ����-----
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

-----�ܷ�Ű ��������-----
ALTER TABLE SCHEDULE 
ADD CONSTRAINT FK_SCHEDULE_MEMBER
FOREIGN KEY (WRITER_NO) REFERENCES MEMBER (NO)
;

--------------------------------------------------


--------------------------------------------------
-------------------����--------------------
--------------------------------------------------

-----������ ����-----


-----������ ����-----


-----���̺� ����-----


-----���̺� ����-----


-----�ܷ�Ű ��������-----


--------------------------------------------------



