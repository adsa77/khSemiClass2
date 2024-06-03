-- MEMBER JOIN
INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pwd1234@@', 'nick1234', '한재두', '1990-06-30', '서울', '010-6548-2311', 'example1@example.com', '1234');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pwd1234@@', 'nick1234', '손지욱', '1989-06-05', '서울', '010-9566-3615', 'example1@example.com', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user03', 'pwd1234@@', 'nick1234', '럭키원', '2003-11-12', '경기도', '010-4447-4122', 'example1@example.com', '1122');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user04', 'pwd1234@@', 'nick1234', '럭키쪙', '2003-06-16', '경기도', '010-3321-4545', 'example1@example.com', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user05', 'pwd1234@@', 'nick1234', '이무기', '1990-06-21', '경기도', '010-7877-1101', 'example1@example.com', '9838');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user06', 'pwd1234@@', 'nick1234', '아무개', '1990-11-20', '서울', '010-3604-7952', 'example1@example.com', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--ANNIVERSARY INSERT

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '생일', '남자친구 생일', '2024-06-05', '1234');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '생일', '남자친구 생일', '2024-06-30', '1234');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '생일', '여자친구 생일', '2024-06-16', '1122');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '생일', '여자친구 생일', '2024-11-12', '1122');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '생일', '여자친구 생일', '2024-11-20', '9838');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '생일', '남자친구 생일', '2024-06-21', '9838');


------------------------------------------------------------------------------------------------------------------------------------------------------------

--SCHEDULE INSERT

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '한강', '한강 산책하기', '2024-06-06', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '집', '집 데이트', '2024-06-07', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '카페', '나들이', '2024-06-16', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '공부', '카페 -> 밥 -> 도서관', '2024-06-22', '1234');

---------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '도서관', '도서관 가기', '2024-06-10', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '불금', '술먹기', '2024-06-14', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '카페', '나들이', '2024-06-12', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '코딩', '공부하기', '2024-06-18', '1122');

--------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '카페', '나들이', '2024-06-06', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '코딩', '공부하기', '2024-06-07', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '동네', '산책하기', '2024-06-25', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '서울', '나들이(한강, 맛집)', '2024-06-13', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--TODO INSERT

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '공부', '리액트 복습하기', '2024-06-05', '1234');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '공부', '코딩 실습', '2024-06-14', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '공부', '그림 묘사하기', '2024-06-10', '1122');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '공부', '학과 도서 읽기', '2024-06-16', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '공부', '리액트 복습하기', '2024-06-22', '9838');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '공부', '코딩 실습', '2024-06-23', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--MEMO INSERT
INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '오늘 저녁 뭐 먹지', '먹기 전에 청소 먼저 할까', '2024-06-03', '1234');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '오늘 할 일', '감자깡~', '2024-06-04', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '코코', '사료 샀으니까 보관할 수 있는 큰 통 사기', '2024-06-05', '1122');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '다이소', '들리는 김에 코코 장난감이랑 화장품 사기', '2024-06-06', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '미니약과', '달콤하고.. 맛있고.. 왕창사기', '2024-06-07', '9838');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '치즈케이크', '먹고싶다.', '2024-06-08', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--DIARY INSERT

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '날씨 좋음', '날이 좋음.', '2024-06-03', '1234');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '학원에 옴.', '학원에서 수업을 듣고 집에 옴.', '2024-06-05', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '길 가다 고양이 봄', '강호동 닮음', '2024-06-01', '1122');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '바퀴벌레 봄', '처음 보는 바퀴벌레 다리..', '2024-06-02', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '길에 꽃이 많이 핌', '기분이 좋음', '2024-06-03', '9838');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '화장한 날', '혜또지각 될까봐 팀플 하는 겸 밤 샘', '2024-06-03', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------

