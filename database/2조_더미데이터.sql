-- MEMBER JOIN
INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pwd1234@@', 'nick1234', '�����', '1990-06-30', '����', '010-6548-2311', 'example1@example.com', '1234');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pwd1234@@', 'nick1234', '������', '1989-06-05', '����', '010-9566-3615', 'example1@example.com', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user03', 'pwd1234@@', 'nick1234', '��Ű��', '2003-11-12', '��⵵', '010-4447-4122', 'example1@example.com', '1122');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user04', 'pwd1234@@', 'nick1234', '��Ű��', '2003-06-16', '��⵵', '010-3321-4545', 'example1@example.com', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user05', 'pwd1234@@', 'nick1234', '�̹���', '1990-06-21', '��⵵', '010-7877-1101', 'example1@example.com', '9838');

INSERT INTO MEMBER (NO, ID, PWD, NICK, NAME, BIRTH_DATE, ADDRESS, PHONE, EMAIL, CODE)
VALUES (SEQ_MEMBER_NO.NEXTVAL, 'user06', 'pwd1234@@', 'nick1234', '�ƹ���', '1990-11-20', '����', '010-3604-7952', 'example1@example.com', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--ANNIVERSARY INSERT

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '����', '����ģ�� ����', '2024-06-05', '1234');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '����', '����ģ�� ����', '2024-06-30', '1234');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '����', '����ģ�� ����', '2024-06-16', '1122');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '����', '����ģ�� ����', '2024-11-12', '1122');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '����', '����ģ�� ����', '2024-11-20', '9838');

INSERT INTO ANNIVERSARY (NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '����', '����ģ�� ����', '2024-06-21', '9838');


------------------------------------------------------------------------------------------------------------------------------------------------------------

--SCHEDULE INSERT

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '�Ѱ�', '�Ѱ� ��å�ϱ�', '2024-06-06', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '��', '�� ����Ʈ', '2024-06-07', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, 'ī��', '������', '2024-06-16', '1234');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '����', 'ī�� -> �� -> ������', '2024-06-22', '1234');

---------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '������', '������ ����', '2024-06-10', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '�ұ�', '���Ա�', '2024-06-14', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, 'ī��', '������', '2024-06-12', '1122');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '�ڵ�', '�����ϱ�', '2024-06-18', '1122');

--------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, 'ī��', '������', '2024-06-06', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '�ڵ�', '�����ϱ�', '2024-06-07', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '����', '��å�ϱ�', '2024-06-25', '9838');

INSERT INTO SCHEDULE( NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '����', '������(�Ѱ�, ����)', '2024-06-13', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--TODO INSERT

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '����', '����Ʈ �����ϱ�', '2024-06-05', '1234');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '����', '�ڵ� �ǽ�', '2024-06-14', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '����', '�׸� �����ϱ�', '2024-06-10', '1122');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '����', '�а� ���� �б�', '2024-06-16', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '����', '����Ʈ �����ϱ�', '2024-06-22', '9838');

INSERT INTO TODO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, '����', '�ڵ� �ǽ�', '2024-06-23', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--MEMO INSERT
INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '���� ���� �� ����', '�Ա� ���� û�� ���� �ұ�', '2024-06-03', '1234');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '���� �� ��', '���ڱ�~', '2024-06-04', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '����', '��� �����ϱ� ������ �� �ִ� ū �� ���', '2024-06-05', '1122');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '���̼�', '�鸮�� �迡 ���� �峭���̶� ȭ��ǰ ���', '2024-06-06', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '�̴Ͼ��', '�����ϰ�.. ���ְ�.. ��â���', '2024-06-07', '9838');

INSERT INTO MEMO(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, 'ġ������ũ', '�԰�ʹ�.', '2024-06-08', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

--DIARY INSERT

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 1, '���� ����', '���� ����.', '2024-06-03', '1234');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 2, '�п��� ��.', '�п����� ������ ��� ���� ��.', '2024-06-05', '1234');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 3, '�� ���� ����� ��', '��ȣ�� ����', '2024-06-01', '1122');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 4, '�������� ��', 'ó�� ���� �������� �ٸ�..', '2024-06-02', '1122');

------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 5, '�濡 ���� ���� ��', '����� ����', '2024-06-03', '9838');

INSERT INTO DIARY(NO, WRITER_NO, TITLE, CONTENT, CHECK_DATE, CODE)
VALUES(SEQ_MEMBER_NO.NEXTVAL, 6, 'ȭ���� ��', '�������� �ɱ�� ���� �ϴ� �� �� ��', '2024-06-03', '9838');

------------------------------------------------------------------------------------------------------------------------------------------------------------

