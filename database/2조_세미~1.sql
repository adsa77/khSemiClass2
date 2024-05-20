INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL)
VALUES (SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?,?);

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