INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id1', 'example_pwd1', 'example_nick1', 'John Doe1', '19900101', '123 Street, City, Country', '12345678901', 'example1@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id2', 'example_pwd2', 'example_nick2', 'John Doe2', '19900101', '123 Street, City, Country', '12345678902', 'example2@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id3', 'example_pwd3', 'example_nick3', 'John Doe3', '19900101', '123 Street, City, Country', '12345678903', 'example3@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id4', 'example_pwd4', 'example_nick4', 'John Doe4', '19900101', '123 Street, City, Country', '12345678904', 'example4@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id5', 'example_pwd5', 'example_nick5', 'John Doe5', '19900101', '123 Street, City, Country', '12345678905', 'example5@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id6', 'example_pwd6', 'example_nick6', 'John Doe6', '19900101', '123 Street, City, Country', '12345678906', 'example6@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id7', 'example_pwd7', 'example_nick7', 'John Doe7', '19900101', '123 Street, City, Country', '12345678907', 'example7@example.com');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'example_id8', 'example_pwd8', 'example_nick8', 'John Doe8', '19900101', '123 Street, City, Country', '12345678908', 'example8@example.com');


--TODO
INSERT INTO TODO (NO, WRITER_NO, TITLE, CONTENT)
VALUES (SEQ_TODO_NO.NEXTVAL, 1, 'Sample Title 1', 'Sample Content 1');

INSERT INTO TODO (NO, WRITER_NO, TITLE, CONTENT)
VALUES (SEQ_TODO_NO.NEXTVAL, 3, 'Sample Title 2', 'Sample Content 2');

INSERT INTO TODO (NO, WRITER_NO, TITLE, CONTENT)
VALUES (SEQ_TODO_NO.NEXTVAL, 2, 'Sample Title 3', 'Sample Content 3');



SELECT *
FROM TODO
ORDER BY NO DESC
;

SELECT 
M.NO
,M.NAME
,T.TITLE
FROM TODO T
JOIN MEMBER M ON M.NO = T.WRITER_NO
ORDER BY M.NO DESC
;

--관리자계정 생성--
INSERT INTO ADMIN (NO, ID, PWD, NICK)
VALUES (SEQ_ADMIN_NO.NEXTVAL, 'admin', '1234', 'admin');

--공지 작성--
INSERT INTO NOTICE (NO, WRITER_NO, TITLE, CONTENT)
VALUES (SEQ_NOTICE_NO.NEXTVAL, 1, 'New Notice', 'This is a new notice content.');

--공지 검색--
SELECT 
    N.TITLE
    , A.NICK
FROM NOTICE N
JOIN ADMIN A ON N.WRITER_NO = A.NO
;

--자주묻는질문 작성--
INSERT INTO FAQ (NO, WRITER_NO, TITLE, CONTENT, ENROLL_DATE)
VALUES (SEQ_FAQ_NO.NEXTVAL, 1, '새로운 FAQ 제목', '새로운 FAQ 내용', SYSDATE);

--자주묻는질문 검색--
SELECT 
    F.TITLE
    , A.NICK
FROM FAQ F
JOIN ADMIN A ON F.WRITER_NO = A.NO
;

--QNA 작성--
INSERT INTO QNA (NO, ADMIN_NO, WRITER_NO, TITLE, CONTENT, ENROLL_DATE, MODIFY_DATE, DEL_YN, ADMIN_TITLE, ADMIN_CONTENT, ADMIN_ENROLL_DATE)
VALUES (SEQ_QNA_NO.NEXTVAL, 1, 2, '새로운 QNA 제목', '새로운 QNA 내용', SYSDATE, SYSDATE, 'N', '관리자 제목', '관리자 내용', SYSDATE);

--QNA 조회--
SELECT 
    Q.TITLE
    , M.NICK
FROM QNA Q
JOIN MEMBER M ON Q.WRITER_NO = M.NO
;

SELECT 
    Q.TITLE
    , A.NICK
FROM QNA Q
JOIN ADMIN A ON Q.ADMIN_NO = A.NO
;



