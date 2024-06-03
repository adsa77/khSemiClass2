-- MEMBER JOIN
INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pwd1234@@', 'nick1234', '홍길동1', '1990-01-01', '경기도 안산시', '010-2020-2020', 'example1@example.com', '1234');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pwd1234@@', 'nick1234', '홍길동2', '1990-01-01', '경기도 안산시', '010-2020-2020', 'example1@example.com', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user03', 'pwd1234@@', 'nick1234', '홍길동3', '1990-01-01', '경기도 안산시', '010-2021-2020', 'example1@example.com', '1122');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user04', 'pwd1234@@', 'nick1234', '홍길동4', '1990-01-01', '경기도 안산시', '010-2023-2020', 'example1@example.com', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user05', 'pwd1234@@', 'nick1234', '홍길동5', '1990-01-01', '경기도 안산시', '010-2027-2020', 'example1@example.com', '9838');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user06', 'pwd1234@@', 'nick1234', '홍길동6', '1990-01-01', '경기도 안산시', '010-2029-2020', 'example1@example.com', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--ANNIVERSARY INSERT

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '기념일 제목 11', '기념일 내용 11', '2024-05-20', '1234');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '기념일 제목 22', '기념일 내용 22', '2024-05-21', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '기념일 제목 33', '기념일 내용 33', '2024-05-22', '1122');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '기념일 제목 44', '기념일 내용 44', '2024-05-23', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '기념일 제목 55', '기념일 내용 55', '2024-05-24', '9838');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '기념일 제목 66', '기념일 내용 66', '2024-05-25', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--SCHEDULE INSERT

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '스케줄 제목 11', '스케줄 내용 11', '2024-05-26', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '스케줄 제목 22', '스케줄 내용 22', '2024-05-27', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '스케줄 제목 33', '스케줄 내용 33', '2024-05-28', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '스케줄 제목 44', '스케줄 내용 44', '2024-05-29', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '스케줄 제목 55', '스케줄 내용 55', '2024-05-30', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '스케줄 제목 66', '스케줄 내용 66', '2024-05-31', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--TODO INSERT

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, 'TODO 제목 11', 'TODO 내용 11', '2024-05-11', '1234');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, 'TODO 제목 22', 'TODO 내용 22', '2024-05-12', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, 'TODO 제목 33', 'TODO 내용 33', '2024-05-13', '1122');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, 'TODO 제목 44', 'TODO 내용 44', '2024-05-14', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, 'TODO 제목 55', 'TODO 내용 55', '2024-05-15', '9838');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, 'TODO 제목 66', 'TODO 내용 66', '2024-05-16', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--MEMO INSERT
INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '메모 제목 11', '메모 내용 11', '2024-05-20', '1234');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '메모 제목 22', '메모 내용 22', '2024-05-21', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '메모 제목 33', '메모 내용 33', '2024-05-22', '1122');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '메모 제목 44', '메모 내용 44', '2024-05-23', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '메모 제목 55', '메모 내용 55', '2024-05-24', '9838');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '메모 제목 66', '메모 내용 66', '2024-05-24', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--DIARY INSERT

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '다이어리 제목 11', '다이어리 내용 11', '2024-05-01', '1234');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '다이어리 제목 22', '다이어리 내용 22', '2024-05-02', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '다이어리 제목 33', '다이어리 내용 33', '2024-05-03', '1122');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '다이어리 제목 44', '다이어리 내용 44', '2024-05-04', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '다이어리 제목 55', '다이어리 내용 55', '2024-05-05', '9838');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '다이어리 제목 66', '다이어리 내용 66', '2024-05-06', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------

