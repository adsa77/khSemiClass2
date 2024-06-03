-- MEMBER JOIN
INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pwd1234@@', 'nick1234', 'ȫ�浿1', '1990-01-01', '��⵵ �Ȼ��', '010-2020-2020', 'example1@example.com', '1234');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pwd1234@@', 'nick1234', 'ȫ�浿2', '1990-01-01', '��⵵ �Ȼ��', '010-2020-2020', 'example1@example.com', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user03', 'pwd1234@@', 'nick1234', 'ȫ�浿3', '1990-01-01', '��⵵ �Ȼ��', '010-2021-2020', 'example1@example.com', '1122');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user04', 'pwd1234@@', 'nick1234', 'ȫ�浿4', '1990-01-01', '��⵵ �Ȼ��', '010-2023-2020', 'example1@example.com', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user05', 'pwd1234@@', 'nick1234', 'ȫ�浿5', '1990-01-01', '��⵵ �Ȼ��', '010-2027-2020', 'example1@example.com', '9838');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user06', 'pwd1234@@', 'nick1234', 'ȫ�浿6', '1990-01-01', '��⵵ �Ȼ��', '010-2029-2020', 'example1@example.com', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--ANNIVERSARY INSERT

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '����� ���� 11', '����� ���� 11', '2024-05-20', '1234');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '����� ���� 22', '����� ���� 22', '2024-05-21', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '����� ���� 33', '����� ���� 33', '2024-05-22', '1122');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '����� ���� 44', '����� ���� 44', '2024-05-23', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '����� ���� 55', '����� ���� 55', '2024-05-24', '9838');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '����� ���� 66', '����� ���� 66', '2024-05-25', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--SCHEDULE INSERT

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '������ ���� 11', '������ ���� 11', '2024-05-26', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '������ ���� 22', '������ ���� 22', '2024-05-27', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '������ ���� 33', '������ ���� 33', '2024-05-28', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '������ ���� 44', '������ ���� 44', '2024-05-29', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '������ ���� 55', '������ ���� 55', '2024-05-30', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '������ ���� 66', '������ ���� 66', '2024-05-31', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--TODO INSERT

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, 'TODO ���� 11', 'TODO ���� 11', '2024-05-11', '1234');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, 'TODO ���� 22', 'TODO ���� 22', '2024-05-12', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, 'TODO ���� 33', 'TODO ���� 33', '2024-05-13', '1122');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, 'TODO ���� 44', 'TODO ���� 44', '2024-05-14', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, 'TODO ���� 55', 'TODO ���� 55', '2024-05-15', '9838');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, 'TODO ���� 66', 'TODO ���� 66', '2024-05-16', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--MEMO INSERT
INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '�޸� ���� 11', '�޸� ���� 11', '2024-05-20', '1234');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '�޸� ���� 22', '�޸� ���� 22', '2024-05-21', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '�޸� ���� 33', '�޸� ���� 33', '2024-05-22', '1122');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '�޸� ���� 44', '�޸� ���� 44', '2024-05-23', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '�޸� ���� 55', '�޸� ���� 55', '2024-05-24', '9838');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '�޸� ���� 66', '�޸� ���� 66', '2024-05-24', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--DIARY INSERT

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '���̾ ���� 11', '���̾ ���� 11', '2024-05-01', '1234');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '���̾ ���� 22', '���̾ ���� 22', '2024-05-02', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '���̾ ���� 33', '���̾ ���� 33', '2024-05-03', '1122');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '���̾ ���� 44', '���̾ ���� 44', '2024-05-04', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '���̾ ���� 55', '���̾ ���� 55', '2024-05-05', '9838');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '���̾ ���� 66', '���̾ ���� 66', '2024-05-06', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------

